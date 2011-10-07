module RestResource
  class Value
    attr_reader :raw_value
    private :raw_value
    def initialize(raw_value)
      @raw_value = raw_value
    end

    def value
      return raw_value if !raw_value.is_a?(Hash) or raw_value["object"].nil?
      class_name = raw_value["object"].keys.first
      klass = class_name.classify.constantize
      klass.new raw_value["object"][class_name]
    end
  end
end
