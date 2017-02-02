require 'slack-notifier'
require 'multi_json'
require 'pony'

class Jarvis
  def self.slack_url
    "https://hooks.slack.com/services/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"
  end

  def self.send_email(results, meta)
    begin

      Pony.mail({
                    :to => "mslider@rhapsody.com",
                    :from => 'pitch-qa@rhapsody.com',
                    :subject => "#{meta[:env]} #{meta[:suite_name]} Completed (#{meta[:timestamp]}) - #{meta[:summary]}, finished in #{meta[:duration]}",
                    :html_body => results,
                    :via => :smtp,
                    :via_options => {
                        :address => 'smtp-prod.internal.rhapsody.com'
                    },
                    :attachments => {'rerun.txt' => meta[:rerun_txt]}
                })
    rescue Exception => e
      # NOTE: An error will occur if you're not on VPN, try sending from the gmail account
      puts "Unable to send mail to pitch-qa@rhapsody.com - #{e.message}"

      Pony.mail({
                    :to => ["evaljak@rhapsody.com"],
                    :from => 'automatedtests125@gmail.com',
                    :subject => "#{meta[:env]} #{meta[:suite_name]} Completed #{meta[:summary]}",
                    :html_body => results,
                    :via => :smtp,
                    :via_options => {
                        :address => 'smtp.gmail.com',
                        :user_name => 'automatedtests125@gmail.com',
                        :password => 'ernest125'
                    }
                })
    end
  end

  def self.send_to_slack(str)
    begin
      notifier = Slack::Notifier.new self.slack_url
      notifier.ping str
    rescue Exception => e
      puts "Unable to notify slack - #{e.message}"
    end
  end

  def self.notify_slack(meta)
    begin
      notifier = Slack::Notifier.new self.slack_url
      notifier.ping "#{meta[:env]} #{meta[:suite_name]} Completed (#{meta[:timestamp]}) - #{meta[:summary]}, finished in #{meta[:duration]}"
    rescue Exception => e
      puts "Unable to notify slack - #{e.message}"
    end
  end
end
