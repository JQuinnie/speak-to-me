# config/initializers/psych.rb

require 'yaml'

# Reconfigure Psych to allow aliases in YAML files
module Psych
  class << self
    def load_with_aliases(yaml, filename = nil)
      load(yaml, aliases: true, filename: filename)
    end
  end
end
