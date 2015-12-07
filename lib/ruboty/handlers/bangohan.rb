require "ruboty/bangohan/actions/bangohan"

module Ruboty
  module Handlers
    class Bangohan < Base
      on /今日の晩御飯\z/, name: 'bangohan', description: 'output dinner menu'

      def bangohan(message)
        Ruboty::Feedly::Actions::Bangohan.new(message).call
      end
    end
  end
end
