module Shortener
  class CreateShortenerService
    def short_link(url)
      client = Bitly::API::Client.new(
        token: "#{ENV['BIT_LY_ACCESS_TOKEN']}"
      )

      bitlink = client.shorten(long_url: url)
      bitlink.link
    end
  end
end
