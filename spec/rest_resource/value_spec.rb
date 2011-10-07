require File.join(File.expand_path(File.dirname(__FILE__)), "..", "spec_helper")
module RestResource
  describe Value do
    describe "#value" do
      context "when the raw value is not a hash" do
        it "should return the value" do
          Value.new(23).value.should == 23
        end
      end
      context "when the raw value is a hash" do
        context "and the hash doesn't have the key object" do
          it "should return the value" do
            Value.new({"test" => "para"}).value.should == ({"test" => "para"})
          end
        end
        context "and the hash has the key object" do
          let(:params) {
            {"object" => { "rest_resource/test_class" => {"attr1" => "val1"}}}
          }
          subject {Value.new params}
          before(:each) do
            RestResource::TestClass = Class.new(Resource)
          end
          
          it "should return an object of the type being indicated in the hash" do
            subject.value.should be_a RestResource::TestClass
          end

          it "should set" do
            subject.value.attr1.should == "val1"
          end
        end
      end
    end
  end
end
