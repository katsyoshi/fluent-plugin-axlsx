require 'test/unit'
require 'fluent/test'
require 'lib/fluent/plugin/out_axlsx.rb'

class AxlsxOutputTest < Test::Unit::TestCase
  CONFIG =  %[
    path test_output_axlsx.xlsx
  ]

  def create_driver(config=CONFIG, tag='foo')
    Fluent::Test::OutputTestDriver.new(Fluent::AxlsxOutput).configure(config)
  end

  def test_configuration
    driver = create_driver
    assert_equal 'test_output_axlsx.xlsx', driver.instance.path
  end


  def test_emit_creates_worksheet_for_tag
   driver = create_driver
   driver.instance.emit('foo', [{"message" => "testing first", "message2" => "testing first another data"}], nil)
   assert_equal('foo', driver.instance.send(:package).workbook.worksheets.first.name)
  end
end
