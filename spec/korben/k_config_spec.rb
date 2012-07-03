require 'spec_helper'

describe KConfig do
  
  context "Simple Configuration" do
    before { KConfig.load!( { foo: 'bar' } ) }
    it { KSettings.get(:foo).should eql 'bar' }
    it { KSettings.foo.should eql 'bar' }
  end

  context "Custom Configuration" do
    it "should have the default settings constant as 'KSettings'" do
      KConfig.const_name.should eql "KSettings"
    end

    it "should be able to assign a different settings constant" do
      KConfig.setup { |config| config.const_name = "AnotherSettingConstantName" }
      KConfig.const_name.should == "AnotherSettingConstantName"
    end
  end
  
  context "KConfig::KWrapper" do
    let(:wrapper) { KConfig::KWrapper.new }
    before { wrapper.set(:key, 'value') }
    subject { wrapper.get(:key) }
    
    it "should have the value" do
      should eql 'value'
    end

    context "have method" do
      subject { wrapper }
      its(:key) { should eql 'value' }
    end
  end
    
end

