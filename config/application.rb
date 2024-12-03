require_relative 'boot'

require 'rails/all'

# Replace Psych's YAML loader to support aliases
YAML.singleton_class.prepend(
  Module.new do
    def load_file(filename, *args)
      Psych.load_with_aliases(File.read(filename), filename)
    end
  end
)

Bundler.require(*Rails.groups)

module SpeakToMe
  class Application < Rails::Application
    # Application configuration
    config.load_defaults 6.0
  end
end
