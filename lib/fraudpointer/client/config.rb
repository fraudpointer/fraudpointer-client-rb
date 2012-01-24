module Fraudpointer
  module Client
    SITE = 'https://production.fraudpointer.com/api'

    class << self
      def key=(key)
        @key = key
      end

      def key
        @key
      end
    end

  end
end
