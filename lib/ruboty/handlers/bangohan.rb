require "ruboty/bangohan/actions/bangohan"
require "ruboty/bangohan/actions/recommend_recipe"
require "ruboty/bangohan/actions/recipe_food"

module Ruboty
  module Handlers
    class Bangohan < Base
      on /今日のごはん\z/, name: 'bangohan', description: 'output dinner menu'
      on /今日は(?<food>.+)かな\z/, name: 'recommend_recipe', description: 'output recommend recipe'
      on /食材教えて\z/, name: 'recipe_food', description: 'output recipe food'

      def bangohan(message)
        Ruboty::Bangohan::Actions::Bangohan.new(message).call
      end

      def recommend_recipe(message)
        food = message[:food]
        Ruboty::Bangohan::Actions::RecommendRecipe.new(message).call(food)
      end

      def recipe_food(message)
        Ruboty::Bangohan::Actions::RecipeFood.new(message).call
      end
    end
  end
end
