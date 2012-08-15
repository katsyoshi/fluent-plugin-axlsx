module Fluent
class AxlsxOutput < Output
  Plugin.register_output('axlsx', self)

  config_param :path, :string
  config_param :worksheets, :string, :default => "main"

  def initialize
    super
    require 'axlsx'
    @xlsx = Axlsx::Package.new
    @workbook = @xlsx.workbook
  end

  def configure(conf)
    super
    @worksheet = @workbook.add_worksheet(:name => @worksheets.to_s)
  end

  def start
  end

  def shutdown
  end

  def format(tag, time, record)
  end

  def emit(tag, es, chunk)
    es.each do |time, record|
      row = record.values
      @worksheet.add_row(row)
    end
    @xlsx.serialize(path)
  end
end
end
