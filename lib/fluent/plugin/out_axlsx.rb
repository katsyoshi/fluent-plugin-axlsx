module Fluent

  # The AxlsxOutput class exports fluend emmitions into an OOXML
  #  spreadsheet document (xlsx)
  class AxlsxOutput < Output

    Plugin.register_output('axlsx', self)

    config_param :path, :string
    # config_param :worksheets, :string, :default => "main"
    
    
    # PENDING @see configure TODOconfig_param :keys, :string, :default => nil

    def initialize
      super
      require 'axlsx'
    end

    def configure(conf)
      super
      # TODO - I like the csv keys idea in the configuration but I think it needs to be tag specific.
      # e.g. dstat_keys foo, bar, biz.bang, hoge.hoge.hoge
      # dot notation indicates nested keys
      @time_format = workbook.styles.add_style :format_code => 'hh:mm:ss'
    end

    def start
    end

    def shutdown
    end

    def format(tag, time, record)
    end

    def emit(tag, es, chunk)
      to_xlsx(tag, es)
    end

    private

    def to_xlsx(tag, es)
      sheet_for(tag) do |sheet|
        sheet.add_row []
        es.each do |time, record|
          column_headers = column_header | record.keys
          sheet.add_row record.values.insert(Time.at(time), 0), :style => [@time_format]
        end
        # yes, I am cheeting!
        sheet.rows.first.send :array_to_cells, column_headers
      end
      serialize
    end

    def package
      @package ||= Axlsx::Package.new
    end

    private

    def column_headers
      @column_headers ||= ['time']
    end

    def sheet_for(tag)
      workbook.sheet_by_name(tag) || workbook.add_worksheet(:name => tag)
    end

    def serialize
      @package.serialize(path)
    end

     def workbook
      package.workbook
    end

  end

end
