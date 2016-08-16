require "reevoo_sapience/version"
require "sapience"
require "yaml"
require "erb"

module ReevooSapience
  class Configuration
    def initialize
      initialize_rails if defined?(::Rails)
      # initialize_rack if defined?(::Rack)
      initialize_grape if defined?(::Grape)
    end

    def initialize_rails # rubocop:disable AbcSize
      configure(
        log_level: ::Rails.application.config.log_level,
        application: ::Rails.application.class.parent_name.to_s,
        appenders: config[environment]["appenders"],
      )

      ::Rails.logger = Sapience[::Rails]
      [:active_record, :action_controller, :action_mailer, :action_view].each do |name|
        ActiveSupport.on_load(name) { include Sapience::Loggable }
      end
      ActiveSupport.on_load(:action_cable) { self.logger = Sapience["ActionCable"] }
    end

    def initialize_rack
      ::Rack.logger = Sapience::Logger.logger
    end

    def initialize_grape # rubocop:disable AbcSize
      configure(
        log_level: config[environment]["log_level"].downcase.to_sym,
        application: config[environment]["application"],
        appenders: config[environment]["appenders"],
      )
      Grape::API.send(:include, Sapience::Loggable)
    end

    def environment
      @environment ||=
        ENV.fetch("RAILS_ENV") do
          ENV.fetch("RACK_ENV") do
            ::Rails.env if defined?(::Rails)
          end
        end
    end

    def config
      @_config ||= begin
        text = File.open(yaml_config).read
        erb = ERB.new(text)
        yaml = erb.result
        YAML.load(yaml)
      end
    end

    def yaml_config
      @yaml_config ||= rack_config
      @yaml_config ||= File.expand_path("../../reevoo_sapience/default_reevoo_sapience.yml", __FILE__)
    end

    def rails_config
      return unless defined?(::Rails)
      file = Rails.root.join("config/sapience.yml")
      return unless File.exist?(file)
      file
    end

    def rack_config
      return unless defined?(::Rack::Directory)
      file = File.join(Rack::Directory.new("").root, "config/sapience.yml")
      return unless File.exist?(file)
      file
    end

    def configure(log_level:, application:, appenders: [])
      Sapience.configure do |c|
        c.default_level   = log_level
        c.backtrace_level = log_level
        c.application     = application
        c.appenders       = appenders
      end
    end
  end
end
