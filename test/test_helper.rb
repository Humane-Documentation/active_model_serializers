require 'bundler/setup'

require 'timecop'
require 'rails'
require 'action_controller'
require 'action_controller/test_case'
require 'action_controller/railtie'
require 'active_support/json'
require 'fileutils'
FileUtils.mkdir_p(File.expand_path('../../tmp/cache', __FILE__))

gem 'minitest'
require 'minitest/autorun'
if defined?(Minitest::Test)
  # Minitest 5
  # https://github.com/seattlerb/minitest/blob/e21fdda9d/lib/minitest/autorun.rb
  # https://github.com/seattlerb/minitest/blob/e21fdda9d/lib/minitest.rb#L45-L59
else
  # Minitest 4
  # https://github.com/seattlerb/minitest/blob/644a52fd0/lib/minitest/autorun.rb
  # https://github.com/seattlerb/minitest/blob/644a52fd0/lib/minitest/unit.rb#L768-L787
  # Ensure backward compatibility with Minitest 4
  Minitest = MiniTest unless defined?(Minitest)
  Minitest::Test = MiniTest::Unit::TestCase
  def Minitest.after_run(&block)
    MiniTest::Unit.after_tests(&block)
  end
end

require 'capture_warnings'
CaptureWarnings.new(_fail_build = true).execute!

require 'active_model_serializers'

require 'support/stream_capture'

require 'support/rails_app'

require 'support/test_case'

require 'fixtures/active_record'

require 'fixtures/poro'
