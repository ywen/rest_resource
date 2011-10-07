require File.join(File.expand_path(File.dirname(__FILE__)), "..", "spec_helper")

module RestResource
  describe RestCrud do
    subject {RestCrud.new("http://example.com/resources")}
    describe ".find" do
      it "should get the resource specified" do
        RestClient.should_receive(:get).with("http://example.com/resources/123.json")
        subject.find 123
      end
    end

    describe ".create" do
      it "should post the resource specified" do
        RestClient.should_receive(:post).with("http://example.com/resources.json", {:param1 => "value1", :param2 => "values2"})
        subject.create({:param1 => "value1", :param2 => "values2"})
      end
    end
  end
end
