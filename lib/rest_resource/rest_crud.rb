module RestResource
  class RestCrud
    attr_reader :url
    private :url
    def initialize(url)
      @url = url
    end

    def find(resource_id)
      RestClient.get "#{url}/#{resource_id}.json"
    end

    def create(params)
      RestClient.post "#{url}.json", params
    end

    def update(params)
      RestClient.put "#{url}.json", params
    end
  end
end
