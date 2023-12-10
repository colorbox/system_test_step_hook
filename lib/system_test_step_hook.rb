# frozen_string_literal: true

require_relative "system_test_step_hook/version"

module SystemTestStepHook
  class << self
    attr_accessor :before_hook, :after_hook

    def before(&block)
      @before_hook = block
    end

    def after(&block)
      @after_hook = block
    end

    def modify_proc(proc)
      buffer = ::Parser::Source::Buffer.new('(string)')
      buffer.source = proc.source
      parser = ::Parser::CurrentRuby.new
      ast = parser.parse(buffer)

      rewriter = ::Parser::Source::TreeRewriter.new(buffer)

      ast.children.last.children.each do |child|
        rewriter.insert_before(child.location.expression, "\nSystemTestStepHook.before_hook.call\n")

        rewriter.insert_after(child.location.expression, "\nSystemTestStepHook.after_hook.call\n")
      end
      modified_code = rewriter.process

      modified_code.split("\n")[1..-2].join("\n")
    end
  end
end

module Minitest
  class Test < Runnable
    def run
      with_info_handler do
        time_it do
          capture_exceptions do
            SETUP_METHODS.each do |hook|
              self.send hook
            end

            if is_a?(ActionDispatch::SystemTestCase)
              proc = self.method(self.name).to_proc
              modified_code = SystemTestStepHook.modify_proc(proc)

              Proc.new { eval(modified_code) }.call
            else
              self.send self.name
            end
          end

          TEARDOWN_METHODS.each do |hook|
            capture_exceptions do
              self.send hook
            end
          end
        end
      end

      Result.from self # per contract
    end
  end
end
