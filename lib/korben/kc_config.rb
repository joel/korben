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
  
    def load!(settings = {})
      Kernel.send(:remove_const, KcConfig.const_name) if Kernel.const_defined?(KcConfig.const_name)
      kc_wrapper = KcWrapper.new
      kc_wrapper.load!(settings)
      Kernel.const_set(KcConfig.const_name, kc_wrapper)
    end
  end
end

class KcWrapper

  def initialize
    @settings = {}
  end

  def load!(settings = {})
    settings.each do |key, value|
      set(key, value)
    end
  end

  def set(key, value)
    unset(key) if set?(key)
    define_accessor(key) { value }
    @settings[key] = value
  end

  def set?(key)
    @settings.key?(key)
  end
  
  def get(key)
    @settings[key]
  end

  private

  def define_accessor(name, &block)
    singleton_class.class_eval { define_method(name, &block) } if !respond_to?(name) || exists?(name)
  end

  def singleton_class
    class << self
      self
    end
  end
end
