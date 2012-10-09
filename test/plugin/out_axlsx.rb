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
   driver.instance.emit('foo', {Time.now => {"message1" => "testing first", "message2" => "testing first another data"}}, nil)
   assert_equal('foo', driver.instance.send(:package).workbook.worksheets.first.name)
  end

  def test_emit_creates_column_headers
    driver = create_driver
    driver.instance.emit('bar', {Time.now => {"message1" => "testing first", "message2" => "testing first another data"}}, nil)
    assert_equal('time', driver.instance.send(:package).workbook.worksheets.first.rows[0].cells[0].value)
    assert_equal('message1', driver.instance.send(:package).workbook.worksheets.first.rows[0].cells[1].value)
    assert_equal('message2', driver.instance.send(:package).workbook.worksheets.first.rows[0].cells[2].value)


  end

end
