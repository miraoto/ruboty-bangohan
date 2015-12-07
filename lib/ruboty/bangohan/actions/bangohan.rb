module Ruboty
  module Bangohan
    module Actions
      class Bangohan < Ruboty::Actions::Base
        def call
          message.reply(hearing)
        end

        private

        def hearing
          '今日のご飯はどうするの？'
        end
      end
    end
  end
end
