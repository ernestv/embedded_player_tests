require 'yaml'

class RhapsodyUrl

  def self.get(region, path = "")
#    puts "RhapsodyUrl.get #{URI.join(self.web_root(RSpec.configuration.test_env)[region], path).to_s}"
    URI.join(self.web_root(RSpec.configuration.test_env)[region], path).to_s
  end

  def self.web_root(env = 'prod')
    @@env_urls[env]
  end

  def self.load_yml
    yml = YAML.load_file(File.join(Dir.pwd, 'spec', 'support', 'env_urls.yml'))
    @@env_urls = yml['env_urls']
  end
end
