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
    configure(
      ::Rails.application.config.log_level,
      ::Rails.application.class.parent_name.to_s,
      config[::Rails.environment]["appenders"],
    )

    ::Rails.logger = Sapience[::Rails]
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

  def self.configure(log_level, application, appenders = [])
    Sapience.configure do |c|
      c.default_level           = log_level
      c.default_backtrace_level = log_level
      c.application             = application
      c.appenders               = appenders
    end
  end
end
