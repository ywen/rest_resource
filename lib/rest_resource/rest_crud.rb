module RestResource
  class RestCrud
    attr_reader :url, :http
    private :url
    def initialize(url)
      @http = Class.new do
        include HTTParty
        base_uri "#{url}"
      end
    end

    def find(resource_id)
      http.get "/#{resource_id}.json"
    end

    def all(params)
      http.get(".json", :query => params).parsed_response
    end

    def create(params)
      http.post ".json", params
    end

    def update(params)
      http.put "/#{params.delete(:id)}.json", params
    end
  end
end
