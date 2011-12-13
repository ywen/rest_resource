module RestResource
  class RestCrud
    attr_reader :url, :http
    private :url
    def initialize(url)
      @http = Class.new do
        include HTTParty
        base_uri "#{url}"
      end
      @url = url
    end

    def find(resource_id)
      RestClient.get "#{url}/#{resource_id}.json"
    end

    def all(params)
      RestClient.get "#{url}.json", params
    end

    def create(params)
      RestClient.post "#{url}.json", params
    end

    def update(params)
      RestClient.put "#{url}/#{params.delete(:id)}.json", params
    end
  end
end
