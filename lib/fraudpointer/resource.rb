module Fraudpointer
  class Resource < ActiveResource::Base
    self.site = Client::SITE

    def create
      connection.post(collection_path, encode, self.class.headers).tap do |response|
        self.id = id_from_response(response)
        load_attributes_from_response(response)
      end
    end

    class << self
      def collection_path(prefix_options = {}, query_options = nil)
        super(prefix_options, (query_options || {}).merge(:key => key || Client.key))
      end

      def key
        @key
      end

      def with_key(key)
        Class.new(self).tap do |klass|
          klass.instance_variable_set(:@key, key)
          klass.element_name = self.element_name
        end
      end
    end
  end
end

