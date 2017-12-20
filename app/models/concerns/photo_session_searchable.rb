require 'elasticsearch/model'

module PhotoSessionSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    settings index: { number_of_shards: 1, number_of_replicas: 0 } do
      mapping do
        indexes :title, analyzer: 'snowball', boost: 100, fielddata: true
        indexes :description, analyzer: 'snowball', boost: 100
        indexes :price, type: :integer
        indexes :updated_at, type: :date
        indexes :cities do
          indexes :id
          indexes :title, analyzer: 'keyword', boost: 50, fielddata: true
        end

        indexes :themes do
          indexes :id
          indexes :title, analyzer: 'keyword', boost: 50, fielddata: true
        end

        indexes :session_days do
          indexes :when, type: :date
          indexes :session_time, type: :integer
          indexes :special
          indexes :price
        end
      end
    end

    # Customize the JSON serialization for Elasticsearch
    #
    def as_indexed_json(options={})
      as_json(
        only: ['title', 'description', 'price', 'updated_at'],
        methods: ['cities', 'themes', 'session_days']
        )
    end

    # Return documents matching the user's query, include highlights and aggregations in response,
    # and implement a "cross" faceted navigation
    #
    # @param q [String] The user query
    # @return [Elasticsearch::Model::Response::Response]
    #

    def self.search(params={})
      definition = Elasticsearch::DSL::Search::Search.new do
        size 1000
        query do

          bool do
            # ... search in `title`, `abstract` and `content`, boosting `title`
            #
            unless params[:q].blank?
              must do
                query_string do
                  query  params[:q]
                  fields ['title', 'description']
                  default_operator 'and'
                end
              end
            end

            must do
              range :price do
                gte params[:min]
                lte params[:max]
              end
            end

            if params[:city]
              must do
                term 'cities.title': params[:city]
              end
            end

            if params[:theme]
              must do
                term 'themes.title': params[:theme]
              end
            end

            if params[:special]
              must do
                term 'session_days.special': true
              end
            end

            if params[:date].present?
              must do
                range 'session_days.when' do
                  gte Date.strptime(params[:date], "%m/%d/%Y").beginning_of_day
                  lte Date.strptime(params[:date], "%m/%d/%Y").end_of_day
                end
              end
            end

            if params[:time].present?
              must do
                range 'session_days.session_time' do
                  case params[:time]
                  when 'morning'
                    gte 0
                    lte 1159
                  when 'day'
                    gte 1200
                    lte 1759
                  when 'evening'
                    gte 1800
                    lte 2359
                  end
                end
              end
            end

            # ... search in comment body if user checked the comments checkbox
            #
            # if q.present? && options[:comments]
            #   should do
            #     nested do
            #       path :comments
            #       query do
            #         multi_match do
            #           query q
            #           fields   'comments.body'
            #           operator 'and'
            #         end
            #       end
            #     end
            #   end
            # end
          end
        end

        # post_filter do
        #   bool do
        #     # must { term categories: options[:category] } if options[:category]
        #     # must { match_all } if options.keys.none? { |k| [:c, :a, :w].include? k }
        #     # must { term 'authors.full_name.raw' => options[:author] } if options[:author]
        #     must { range price: { gte: params[:min], lte: params[:max] } }
        #   end
        # end
        aggregation :time do
          range do
            field 'session_days.session_time'
            key 'morning', from: 0, to: 1159
            key 'day', from: 1200, to: 1759
            key 'evening', from: 1800, to: 2359
          end
        end

        aggregation :min_price do
          min field: :price
        end

        aggregation :max_price do
          max field: :price
        end

        aggregation :popular_titles do
          terms do
            field :title
          end
        end

        aggregation :popular_cities do
          terms do
            field 'cities.title'
          end
        end

        aggregation :popular_themes do
          terms do
            field 'themes.title'
          end
        end

        case
        when params[:sort]
          sort params[:sort].to_sym => 'asc'
          # track_scores true
        when params[:q].blank?
          sort 'session_days.when': 'asc'
        end

      end

      Elasticsearch::Model.search(definition)
    end

  end
end
