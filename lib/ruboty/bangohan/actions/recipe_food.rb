# encoding: utf-8

require 'faraday'
require 'json'

module Ruboty
  module Bangohan
    module Actions
      class RecipeFood < Ruboty::Actions::Base
        RECIPES_URL = "/services/api/Recipe/CategoryRanking/20121121?format=json&formatVersion=2&applicationId=#{ENV['APPLICATION_ID']}&categoryId="

        def call
          message.reply(food)
        end

        private

        def food
          # TODO  キャッシュから食材を取ってくる
          recipe = choose_recipe('10-11')
          "#{recipe['recipeTitle']} とかはどう？\n #{recipe['foodImageUrl']}"
        end

        def choose_recipe(recipe_category_id)
          conn = Faraday.new(:url => 'https://app.rakuten.co.jp') do |faraday|
            faraday.request  :url_encoded
            faraday.response :logger
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end
          response = conn.get("#{RECIPES_URL}#{recipe_category_id}")
          results = JSON.parse(response.body.force_encoding('UTF-8'))
          results['result'][1]
        end
      end
    end
  end
end
