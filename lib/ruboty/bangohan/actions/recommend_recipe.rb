# encoding: utf-8

require 'faraday'
require 'json'

module Ruboty
  module Bangohan
    module Actions
      class RecommendRecipe < Ruboty::Actions::Base
        RECIPE_CATEGORY_URL = "/services/api/Recipe/CategoryList/20121121?format=json&elements=categoryName%2CcategoryId%2CparentCategoryId&categoryType=medium&applicationId=#{ENV['APPLICATION_ID']}"
        RECIPES_URL = "/services/api/Recipe/CategoryRanking/20121121?format=json&formatVersion=2&applicationId=#{ENV['APPLICATION_ID']}&categoryId="

        def call(food)
          message.reply(hearing(food))
        end

        private

        def hearing(food)
          results = recipe_categories
          if food == 'なんでもいい'
            recipe_category_id = results[results.keys.sample(1)]
            recipe = choose_recipe(recipe_category_id)
            "#{food}なら、#{recipe['recipeTitle']} とかはどう？\n #{recipe['foodImageUrl']}"
          else
            recipe_category_id = results.fetch(food, nil)
            if recipe_category_id.nil?
              "#{food}もうちょっと詳しく教えて"
            else
              recipe = choose_recipe(recipe_category_id)
              "#{food}だと、#{recipe['recipeTitle']} とかはどう？\n #{recipe['foodImageUrl']}"
            end
          end
        end

        def recipe_categories
          conn = Faraday.new(:url => 'https://app.rakuten.co.jp') do |faraday|
            faraday.request  :url_encoded
            faraday.adapter  Faraday.default_adapter
          end
          response = conn.get(RECIPE_CATEGORY_URL)
          results = JSON.parse(response.body.force_encoding('UTF-8'))
          results["result"]["medium"].map{|result| [result['categoryName'], "#{result['parentCategoryId']}-#{result['categoryId']}"]}.to_h
        end

        def choose_recipe(recipe_category_id)
          conn = Faraday.new(:url => 'https://app.rakuten.co.jp') do |faraday|
            faraday.request  :url_encoded
            faraday.response :logger
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end
          response = conn.get("#{RECIPES_URL}#{recipe_category_id}")
          results = JSON.parse(response.body.force_encoding('UTF-8'))
          results['result'][Random.rand(1 .. results['result'].count)]
        end
      end
    end
  end
end
