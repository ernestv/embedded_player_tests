require 'rspec/core'
require_relative '../../spec/support/jarvis'

class AutomatedTests < Thor

  desc 'sanity', 'Sanity Check. Run these tests and notify the team when finished'
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def sanity
    set_env_vars({:'E' => 'origin'})
    rspec_run '--tag sanity'
    send_results("Sanity Check on Origin", email: false)
  end

  desc 'bvt', 'Build Verification Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def bvt
    set_env_vars
    rspec_run '--tag bvt'
    send_results("BVT")
  end

  desc 'all', 'Run all tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def all_tests
    set_env_vars
    rspec_run
    send_results("All Tests")
  end

  desc 'playlist', 'Playlist Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def playlist
    set_env_vars
    rspec_run '--tag playlist'
    send_results("PLAYLIST")
  end
  
  desc 'mixer', 'Mixer Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def mixer
    set_env_vars
    rspec_run '--tag mixer'
    send_results("MIXER")
  end
  
    desc 'favorites', 'Favorites Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def favorites
    set_env_vars
    rspec_run '--tag favorites'
    send_results("FAVORITES")
  end
  
  desc 'search', 'Search Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def search
    set_env_vars
    rspec_run '--tag search'
    send_results("SEARCH")
  end
  
  desc 'general', 'General Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def general
    set_env_vars
    rspec_run '--tag general'
    send_results("GENERAL")
  end
  
  desc 'profile', 'Profile Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def profile
    set_env_vars
    rspec_run '--tag profile'
    send_results("PROFILE")
  end
  
  desc 'settings', 'Settings Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def settings
    set_env_vars
    rspec_run '--tag settings'
    send_results("SETTINGS")
  end
  
  desc 'share', 'Share Tests. Run these tests and notify the team when finished'
  method_option :env, :aliases => "-e", :default => "", :desc => "Target Environment, defaults to Production. Values: int, alpha, beta, preview, prod, origin"
  method_option :size, :aliases => "-s", :default => "large", :desc => "Browser size, defaults to large. Values: Small (600x900), Large (1200x800)"
  def share
    set_env_vars
    rspec_run '--tag share'
    send_results("SHARE")
  end  
  
  no_tasks do
    def rspec_run(cmd = '')
      base_cmd = ['spec']
      base_cmd << '--format html'
      base_cmd << '--out results.html'
      base_cmd << '--format json'
      base_cmd << '--out results.json'
      base_cmd << cmd

      cmd = base_cmd.join(' ')
      puts "rspec #{cmd}"

      puts cmd.split(' ').inspect

      RSpec::Core::Runner.run(cmd.split(' '))
    end

    def set_env_vars(vars = {})
      ENV['E'] = options[:env].to_s
      ENV['S'] = options[:size].to_s

      puts "E=#{ENV['E']}"
      puts "S=#{ENV['S']}"

      vars.each_pair do |key, value|
        ENV[key.to_s] = value.to_s
        puts "#{key}=#{value}"
      end
    end

    def backup_output(output_dir)
      path = File.join(Dir.pwd, "output", "rerun.txt")
      copy_to = File.join(output_dir, "rerun.txt")
      FileUtils.copy(path, copy_to)

      path = File.join(Dir.pwd, "results.html")
      copy_to = File.join(output_dir, "results.html")
      FileUtils.copy(path, copy_to)

      path = File.join(Dir.pwd, "results.json")
      copy_to = File.join(output_dir, "results.json")
      FileUtils.copy(path, copy_to)
    end

    def send_results(suite_name, email: true, slack: true)
      json_results = MultiJson.load(File.read(File.join(Dir.pwd, "results.json")))
      html_results = File.read(File.join(Dir.pwd, "results.html"))

      meta = {}
      meta[:env] = (options[:env] || "").capitalize
      meta[:suite_name] = suite_name
      meta[:timestamp] = File.read(File.join(Dir.pwd, "output", "last_timestamp"))
      meta[:rerun_txt] = File.read(File.join(Dir.pwd, "output", "rerun.txt"))
      meta[:duration] = Time.at(json_results["summary"]["duration"].to_i).utc.strftime("%H:%M:%S")
      meta[:summary] = json_results["summary_line"]

      backup_output(File.join(Dir.pwd, "output", meta[:timestamp]))

      Jarvis.send_email(html_results, meta) if email
      Jarvis.notify_slack(meta) if slack
    end
  end
end
