module Scrapper
  class CreateScrapperService
    def get_from_url(url)
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)

      name = doc.css(".vcard-fullname").text.strip
      img = doc.css(".js-profile-editable-replace").first.css("a")[0].attributes["href"].value
      nick_name = doc.css(".vcard-username").text.strip
      followers = doc.css(".js-profile-editable-area").css("span").first.text
      following = doc.css(".js-profile-editable-area").css("span")[1].text
      stars = doc.css(".UnderlineNav").css(".Counter").last.text
      contributions = doc.css(".js-yearly-contributions").first.css("h2").text.strip.split("\n")[0]
      organization = doc.css(".vcard-detail").empty? ? "" : doc.css(".vcard-detail").css(".p-org").text
      location = doc.css(".js-profile-editable-area").empty? ? "" : doc.css(".js-profile-editable-area").css(".p-label").text

      scrapped = {
        "name" => name,
        "img" => img,
        "nick_name" => nick_name,
        "followers" => followers,
        "following" => following,
        "stars" => stars,
        "contributions" => contributions,
        "organization" => organization,
        "location" => location,
      }
    end
  end
end
