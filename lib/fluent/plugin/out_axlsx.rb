module Fluent
class AxlsxOutput < Output
  Plugin.register_output('axlsx', self)

  config_param :path, :string
  config_param :worksheets, :string, :default => "main"
  config_param :keys, :string, :default => nil

  def initialize
    super
    require 'axlsx'
    @xlsx = Axlsx::Package.new
    @workbook = @xlsx.workbook
    @rec = Hash.new
  end

  def configure(conf)
    super
    @worksheet = @workbook.add_worksheet(:name => @worksheets.to_s)
    keys = ['time']
    if @keys
      keys << @keys.split(',')
      @keys.split(',').map do |k|
        @rec[k] = nil
      end
    end
    @worksheet.add_row(keys)
    @time_format = @workbook.styles.add_style :format_code => 'hh:mm:ss'
  end

  def start
  end

  def shutdown
  end

  def format(tag, time, record)
  end

  def emit(tag, es, chunk)
    es.each do |time, record|
      row = []
      record.each do |key, val|
        @rec[key] = val
      end
      @rec.each do |k, v|
        row << v
        @rec[k] = nil
      end
      time = Time.at(time)
      row.unshift(time)

      @worksheet.add_row(row, :style => [@time_format])
    end
    @xlsx.serialize(path)
  end
end
end
