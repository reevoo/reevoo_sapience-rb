require "reevoo_sapience/version"
require "sapience"
require "yaml"

module ReevooSapience
  def self.initialize
    initialize_rails if defined?(::Rails)
    initialize_rack if defined?(::Rack)
    initialize_grape if defined?(::Grape)
  end

  def self.initialize_rails # rubocop:disable AbcSize
    rails_config = ::Rails.application.config
    Sapience.configure do |c|
      c.default_level           = rails_config.log_level
      c.default_backtrace_level = rails_config.log_level
      c.application             = ::Rails.application.class.name
      c.appenders               = config[::Rails.environment]["appenders"]
    end

    ::Rails.logger = Sapience.logger
    [:active_record, :action_controller, :action_mailer, :action_view].each do |name|
      ActiveSupport.on_load(name) { include Sapience::Loggable }
    end
    ActiveSupport.on_load(:action_cable) { self.logger = Sapience["ActionCable"] }
  end

  def self.initialize_rack
    ::Rack.logger = Sapience.logger
  end

  def self.initialize_grape
    ::Grape.logger = Sapience.logger
  end

  def self.config
    @_config = YAML.load_file(File.expand_path("../reevoo_sapience/sapience.yml", __FILE__))
  end
end
