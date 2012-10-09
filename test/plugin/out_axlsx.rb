require 'test/unit'
require 'fluent/test'
require 'lib/fluent/plugin/out_axlsx.rb'

class AxlsxOutputTest < Test::Unit::TestCase
  CONFIG =  %[
    path test_output_axlsx.xlsx
  ]

  def create_driver(config=CONFIG, tag='test')
    Fluent::Test::BufferedOutputDriver.new(Fluent::AxlsxOutput, tag).configure(conf)
  end
  
end
