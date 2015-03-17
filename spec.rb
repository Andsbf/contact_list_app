require_relative 'spec_helper'



describe Contact do
  before :each do
    @contact = Contact.new
  end

 
  describe "#find" do
    it "should return array with contact if contact is find" do
      result = Contact.find("and") #and sure is in DB
      expect(result).to be_kind_of(Array)
    end
    
    it "should return nil with contact if contact is find" do
      result = Contact.find("ZzZZzzzzzzzzzzzzzz").class #and sure is in DB
      expect(result).to be(NilClass)
    end
  end

  describe "#find_exactly" do
    it "should return array with contact if contact is find" do
      result = Contact.find("and") #and sure is in DB
      expect(result).to be_kind_of(Array)
    end
    
    it "should return nil with contact if contact is find" do
      result = Contact.find("ZzZZzzzzzzzzzzzzzz").class #and sure is in DB
      expect(result).to be(NilClass)
    end
  end
end

describe Application do 
  before :each do
    @app = Application.new
  end

    describe "#self.repeated_mail?" do
      it "Should return true if contact found" do
        Contact.should_receive(:find_exactly).and_return true
        result = Application.repeated_mail? ("Blah")
        expect(result).to be(true)
      end

      it "Should return true if contact found" do
        Contact.should_receive(:find_exactly).and_return false
        result = Application.repeated_mail? ("Blah")
        expect(result).to be(false)
      end
    end

    describe"#add_phone" do

      it "return 'old' contact with phone" do

      end
    end


end

