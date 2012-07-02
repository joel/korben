require 'spec_helper'

describe KcConfig do
  
  context "Simple Configuration" do
    before { KcConfig.load!( { foo: 'bar' } ) }
    it { KcSettings[:foo].should eql 'bar' }
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

end