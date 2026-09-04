class Upload
  class HTTPClient
    def post(content)
    end

    module Substitute
      def posted?(content)
        invoked?(:post, content: content)
      end
    end
  end
end
