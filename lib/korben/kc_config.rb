require 'active_support/core_ext/module/attribute_accessors'

module KcConfig
  # ensures the setup only gets run once
  @@_ran_once = false

  mattr_accessor :const_name
  @@const_name = "KcSettings"

  class << self
    
    def setup
      yield self if @@_ran_once == false
      @@_ran_once = true
    end
  
    def load!(options = {})
      Kernel.send(:remove_const, KcConfig.const_name) if Kernel.const_defined?(KcConfig.const_name)
      Kernel.const_set(KcConfig.const_name, options)
    end
  end
end