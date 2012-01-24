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
        super(prefix_options, (query_options || {}).merge(:key => Client.key))
      end
    end
  end
end

