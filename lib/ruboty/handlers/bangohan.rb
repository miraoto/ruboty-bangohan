require "ruboty/bangohan/actions/recommend_recipe"

module Ruboty
  module Handlers
    class Bangohan < Base
      on /(.*)?今日は(?<food>.+)かな\z/, name: 'recommend_recipe', description: 'output recommend recipe'

      def recommend_recipe(message)
        food = message[:food]
        Ruboty::Bangohan::Actions::RecommendRecipe.new(message).call(food)
      end
    end
  end
end
