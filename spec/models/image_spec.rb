require 'spec_helper'

describe Image do

  let!(:image) { FactoryGirl.create(:image, tag_list: 'tag1 tag2, tag3; tag4') }

  subject { image }

  context "database schema" do
    it { should have_db_column(:title).of_type(:string) 
                                      .with_options(null: false) }
    it { should have_db_column(:file).of_type(:string) 
                                     .with_options(null: false) }
  end

  context "model attributes" do
    it { should respond_to(:title) }
    it { should respond_to(:file) }
    it { should respond_to(:tag_list) }
  end

  context "validations" do
    it { should validate_presence_of(:title) }

    it "should create with file" do
      expect{ FactoryGirl.create(:image) }.to change( Image, :count ).by( 1 )
    end

    it "shouldn't create without file" do
      @attr = { :title => "title",
                :file => nil }

      expect{ Image.create( @attr ) }.not_to change( Image, :count ).by( 1 )
    end

  end

  context "associations" do
    it { should have_many(:images_tags) }
    it { should have_many(:tags).through(:images_tags) }
  end

  context "tag_lists" do
    it "split string of tag" do
      expect{ FactoryGirl.create(:image, tag_list: 'tag6 tag7, tag8; tag9') }.to change( Tag, :count ).by( 4 )
    end

    it "tags shouldn't have dublicates" do
      expect{ FactoryGirl.create(:image, tag_list: 'tag1 tag2') }.to change( Tag, :count ).by( 0 )
      expect{ FactoryGirl.create(:image, tag_list: 'tag5 tag3; tag4') }.to change( Tag, :count ).by( 1 )
    end

    it "join tags to string" do
      image.tag_list.should == 'tag1, tag2, tag3, tag4'
    end
  end

  context "before_create" do
    it "title shouldn't contain extension" do
      FactoryGirl.create(:image, title: 'image.extension').title.should == 'image'
    end
  end

end