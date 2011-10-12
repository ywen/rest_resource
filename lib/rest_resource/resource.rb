module RestResource
  class Resource
    attr_reader :attributes

    class << self
      def find(resource_id)
        self.new(rest_crud.find(resource_id))
      end

      def create(params)
        self.new(rest_crud.create(params))
      end

      def rest_crud
        RestCrud.new(url)
      end

      private

      def url
        "#{site}/#{resource_name}"
      end
    end

    def initialize(params={})
      return if params.blank?
      params_hash = (params.is_a?(String)) ? ActiveSupport::JSON.decode(params) : params
      @attributes = params_hash
      (class << self; self; end).class_eval do
        params_hash.each_pair do |method_name, value|
          define_method(method_name) do
            Value.new(value).value
          end
        end
      end
    end
    def save
      self.class.rest_crud.update self.attributes
    end

  end
end
