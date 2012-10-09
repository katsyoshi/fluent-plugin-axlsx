require 'test/unit'
require 'fluent/test'
require 'lib/fluent/plugin/out_axlsx.rb'

class AxlsxOutputTest < Test::Unit::TestCase
  CONFIG =  %[
    path test_output_axlsx.xlsx
  ]

  def create_driver(config=CONFIG)
    Fluent::Test::OutputTestDriver.new(Fluent::AxlsxOutput).configure(config)
  end

  def test_configuration
    driver = create_driver
    assert_equal 'test_output_axlsx.xlsx', driver.instance.path
  end
end
