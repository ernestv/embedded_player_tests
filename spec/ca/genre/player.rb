
require 'rspec'
require 'watir-webdriver'

describe "EMBEDDED PLAYER" do
  describe "CA" do
  include_context "firefox browser"
      describe "- GENRE -" do
      
        describe "Horizontal player" do    
          it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "horizontal-player").div(:class, "icon-napster").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:ca,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "horizontal-player").body(:class, " filter-supported").div(:id, "header").li(:class, "header-account").when_present.click
              browser.iframe(:id, "horizontal-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "horizontal-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "horizontal-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "horizontal-player").button(:id => "login-button").when_present.click        
            end        
            it "playback" do
              sleep 2
              browser.iframe(:id, "horizontal-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "horizontal-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "horizontal-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "horizontal-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "horizontal-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "horizontal-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "horizontal-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "horizontal-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
          end
          
          describe "Track Player" do
            it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "track-player").div(:id, "logo-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:ca,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "track-player").body(:class, " filter-supported").div(:id, "header").li(:class, "header-account").when_present.click
              browser.iframe(:id, "track-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "track-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "track-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "track-player").button(:id => "login-button").when_present.click
              browser.cookies.clear
            end
            it "playback" do
              sleep 2
              browser.iframe(:id, "track-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "track-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "track-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "track-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "track-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "track-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "track-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "track-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
          end
          
          describe "Square Player" do
            it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "square-player").div(:id, "logo").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:ca,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "square-player").body(:class, " filter-supported").li(:class, "header-account").when_present.click
              browser.iframe(:id, "square-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "square-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "square-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "square-player").button(:id => "login-button").when_present.click
              browser.cookies.clear
            end
            it "playback" do
              sleep 2
              browser.iframe(:id, "square-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "square-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "square-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "square-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "square-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "square-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "square-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "square-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
          end
          
          describe "IAB Rectangle Player" do
            it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-rectangle-player").div(:class, "icon-napster").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:ca,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "iab-rectangle-player").body(:class, " filter-supported").li(:class, "header-account").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "iab-rectangle-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "iab-rectangle-player").button(:id => "login-button").when_present.click
              browser.cookies.clear
            end
            it "playback" do
              sleep 2
              browser.iframe(:id, "iab-rectangle-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-rectangle-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "iab-rectangle-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "iab-rectangle-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "iab-rectangle-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
          end
          
          describe "IAB Skyscraper Player" do
            it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "logo-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:ca,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "iab-skyscraper-player").body(:class, " filter-supported").li(:class, "header-account").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "iab-skyscraper-player").button(:id => "login-button").when_present.click
              browser.cookies.clear
            end
            it "playback" do
              sleep 2
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.goto RhapsodyUrl.get(:ca, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-skyscraper-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
         end
       end
     end
  end


