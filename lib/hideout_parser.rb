require "nokogiri"

class HideoutParser
  def initialize(doc)
    @document = Nokogiri::HTML(doc)
  end

  def schedule
    shows = []
    content = @document.css("div.list-view-item")

    content.each do |s|
      headliner = s.css("h1.headliners a").text
      supporting_acts = s.css("h2.supports a").text.split(", ")
      date_time = s.at_css("h2.times span.start span")["title"]
      info = "https://www.hideoutchicago.com" + s.at_css("h2.more-info a")["href"]
      ticket_price = s.css("div.ticket-price h3.price-range").text.strip

      shows << {
        :venue => "The Hideout",
        :headliner => headliner,
        :supporting_acts => supporting_acts,
        :date_time => Date.parse(date_time),
        :info => info,
        :ticket_price => ticket_price,
      }
    end

    shows
  end
end
