require "spec/spec_helper"
require "lib/hideout_parser"

describe HideoutParser do
  it "parses the content" do
    @hideout_content = File.read("spec/mocks/the_hideout.txt")
    content = HideoutParser.new(@hideout_content)

    first_show = content.schedule.first

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
      "Damian Anaya",
    )
  end

  it "does not parse 'Gone Fishin'" do
    @hideout_content = File.read("spec/mocks/the_hideout.txt")
    schedule = HideoutParser.new(@hideout_content).schedule

    schedule.each do |show|
      show[:headliner].should_not == "Gone Fishin'"
    end
  end
end
