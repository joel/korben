require 'spec_helper'

describe KcConfig do
  
  context "Simple Configuration" do
    before { KcConfig.load!( { foo: 'bar' } ) }
    it { KcSettings.get(:foo).should eql 'bar' }
    it { KcSettings.foo.should eql 'bar' }
  end

  context "Custom Configuration" do
    it "should have the default settings constant as 'KcSettings'" do
      KcConfig.const_name.should eql "KcSettings"
    end

    it "should be able to assign a different settings constant" do
      KcConfig.setup { |config| config.const_name = "AnotherSettingConstantName" }
      KcConfig.const_name.should == "AnotherSettingConstantName"
    end
  end
  
  context "KcWrapper" do
    let(:wrapper) { KcWrapper.new }
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

