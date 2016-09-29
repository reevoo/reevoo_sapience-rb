require "reevoo_sapience/version"
require "sapience"

module Sapience
  module ConfigLoader
    REEVOO_DEFAULT_FILE = "default_reevoo_sapience.yml".freeze
    CURRENT_FOLDER      = File.realpath(File.dirname(__FILE__))

    class << self
      def config_file_path
        File.join(CURRENT_FOLDER, REEVOO_DEFAULT_FILE)
      end
    end
  end
end
