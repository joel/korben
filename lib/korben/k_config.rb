require 'active_support/core_ext/module/attribute_accessors'

module KConfig
  # ensures the setup only gets run once
  @@_ran_once = false

  mattr_accessor :const_name
  @@const_name = "KSettings"

  class << self
    
    def setup
      yield self if @@_ran_once == false
      @@_ran_once = true
    end
  
    def load!(settings = {})
      Kernel.send(:remove_const, KConfig.const_name) if Kernel.const_defined?(KConfig.const_name)
      k_wrapper = KConfig::KWrapper.new
      k_wrapper.load!(settings)
      Kernel.const_set(KConfig.const_name, k_wrapper)
    end
  end
  
  class KWrapper

    def initialize
      @settings = {}
    end

    def load!(settings = {})
      settings.each { |key, value| set(key, value) }
    end

    def set(key, value)
      define_accessor(key) { value }
      @settings[key] = value
    end

    def exist?(key)
      @settings.key?(key)
    end
  
    def get(key)
      @settings[key]
    end

    private

    def define_accessor(name, &block)
      singleton_class.class_eval { define_method(name, &block) } if !respond_to?(name) || exist?(name)
    end

    def singleton_class
      class << self
        self
      end
    end
  end
  
end