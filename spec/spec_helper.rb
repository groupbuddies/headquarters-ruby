require 'headquarters'
require 'climate_control'

Dir[File.join(Headquarters::ROOT_PATH, 'spec/support/**/*.rb')].each { |f| require f }
Dir[File.join(Headquarters::ROOT_PATH, 'spec/shared_examples/**/*.rb')].each { |f| require f }

class DummyLogger
  def self.info(_message); end
end
Headquarters.logger = DummyLogger

def with_modified_env(options, &block)
  ClimateControl.modify(options, &block)
end
