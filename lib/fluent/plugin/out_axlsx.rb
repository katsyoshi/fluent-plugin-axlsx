module Fluent
class AxlsxOutput < Output
  Plugin.register_output('axlsx', self)

  config_param :path, :string

  def initialize
    super
    require 'axlsx'
  end

  def configure(conf)
    super
  end

  def start
  end

  def shutdown
  end

  def format(tag, time, record)
  end
end
end
