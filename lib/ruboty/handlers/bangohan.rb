require "ruboty/bangohan/actions/bangohan"
require "ruboty/bangohan/actions/recommend_recipe"

module Ruboty
  module Handlers
    class Bangohan < Base
      on /今日のごはん\z/, name: 'bangohan', description: 'output dinner menu'
      on /今日は(?<food>.+)かな\z/, name: 'recommend_recipe', description: 'output recommend recipe'

      def bangohan(message)
        Ruboty::Bangohan::Actions::Bangohan.new(message).call
      end

      def recommend_recipe(message)
        food = message[:food]
        Ruboty::Bangohan::Actions::RecommendRecipe.new(message).call(food)
      end
    end
  end
end
