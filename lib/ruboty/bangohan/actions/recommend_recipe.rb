# encoding: utf-8

require 'faraday'
require 'json'

module Ruboty
  module Bangohan
    module Actions
      class RecommendRecipe < Ruboty::Actions::Base
        RECIPE_CATEGORY_URL = "/services/api/Recipe/CategoryList/20121121?format=json&elements=categoryName%2CcategoryId%2CparentCategoryId&categoryType=medium&applicationId="

        def call(food)
          message.reply(hearing(food))
        end

        private

        def hearing(food)
          recipe_categories = recipe
          recipe_category_id = recipe_categories.fetch(food, nil)
          if food == 'なんでもいいよ'
            # TODO 適当に決める
          end
          if recipe_category_id.nil?
            'もうちょっと詳しく教えて'
          else
            "#{food}だと、#{recipe_category_id}とかはどう？"
          end
        end

        def recipe
          conn = Faraday.new(:url => 'https://app.rakuten.co.jp') do |faraday|
            faraday.request  :url_encoded
            faraday.response :logger
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end
          response = conn.get(RECIPE_CATEGORY_URL)
          results = JSON.parse(response.body.force_encoding('UTF-8'))
          results["result"]["medium"].map{|result| [result['categoryName'], "#{result['parentCategoryId']}-#{result['categoryId']}"]}.to_h
        end
      end
    end
  end
end
