shared_context "firefox browser" do
  let(:browser){ @browser }
  before(:all) {
    @browser = Watir::Browser.new :firefox
    @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
#  after(:each) { |example|
#    @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
#  }
  after(:all) { @browser.close }
end

shared_context "firefox browser for each example" do
  let(:browser){ @browser }
  before(:each) {
      @browser = Watir::Browser.new :firefox
      @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
  
 after(:each) { |example|
#   @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
   @browser.close
 }
end

shared_context "safari browser" do
  let(:browser){ @browser }
  before(:all) {
    @browser = Watir::Browser.new :safari
    @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
# after(:each) { |example|
#    @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
#  }
  after(:all) { @browser.close }
end