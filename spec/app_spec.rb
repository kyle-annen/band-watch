require "spec/spec_helper.rb"

describe App do
  describe "GET root" do
    it "get root returns 200" do
      get "/"

      last_response.status.should == 200
      last_response.body.should == "hello world"
    end
  end
end
