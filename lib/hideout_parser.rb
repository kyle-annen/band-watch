require "nokogiri"

class HideoutParser
  def initialize(doc)
    @document = Nokogiri::HTML(doc)
  end

  def schedule
    shows = []
    content = @document.css("div.list-view-item")

    content.each do |show|
      headliner = show.css("h1.headliners a").text
      supporting_acts = show.css("h2.supports a").text.split(", ")
      date_time = show.at_css("h2.times span.start span")["title"]
      info = "https://www.hideoutchicago.com" + show.at_css("h2.more-info a")["href"]
      ticket_price = show.css("div.ticket-price h3.price-range").text.strip

      shows << {
        :venue => "The Hideout",
        :headliner => headliner,
        :supporting_acts => supporting_acts,
        :date_time => Date.parse(date_time),
        :info => info,
        :ticket_price => ticket_price,
      }
    end

    shows.reject { |s| s[:headliner] == "Gone Fishin'" }
  end
end
