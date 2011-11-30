require File.join(File.expand_path(File.dirname(__FILE__)), "..", "spec_helper")

module RestResource
  describe RestCrud do
    subject {RestCrud.new("http://example.com/resources")}
    let(:response) {double :response, :parsed_response => "a str"}
    let(:http) {double :http_class, :get => response, :post => response}
    before(:each) do
      Class.stub(:new).and_return http
    end
    
    describe "#find" do
      it "should get the resource specified" do
        http.should_receive(:get).with("/123.json")
        subject.find 123
      end
    end

    describe "#all" do
      it "should get the resources specified" do
        http.should_receive(:get).with(".json", :query => {:condition => "a condition"})
        subject.all :condition => "a condition"
      end
    end

    describe "#create" do
      it "should post the resource specified" do
        http.should_receive(:post).with(".json", {:param1 => "value1", :param2 => "values2"})
        subject.create({:param1 => "value1", :param2 => "values2"})
      end
    end

    describe "#update" do
      it "should put the resource specified" do
        http.should_receive(:put).with("/1.json", {:param1 => "value1", :param2 => "values2"})
        subject.update({:id => 1,:param1 => "value1", :param2 => "values2"})
      end
    end
  end
end
