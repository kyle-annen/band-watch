require "spec/spec_helper"
require "lib/hideout_scrapper"
require "pry"
require "ap"

describe HideoutScrapper do
  it "parses the content" do
    @hideout_content = File.read("spec/mocks/the_hideout.txt")
    scrapper = HideoutScrapper.new(@hideout_content)

    first_show = scrapper.schedule.first

    first_show.should include(
      venue: "The Hideout",
      headliner: "Domeheads Attack w/Alan Ford Giles",
      info: "https://www.hideoutchicago.com/event/1706883-domeheads-attack-alan-ford-chicago/",
      ticket_price: "$7.00",
    )

    first_show[:supporting_acts].should include(
      "George David Elrod",
      "Annie Sullivan",
      "Max Lazerine",
      "Manuela Mendoza",
      "Aidan O'Connor",
      "Seth Arthur Johnson",
      "Laura Mulcahy",
      "Damian Anaya"
    )
  end
end
