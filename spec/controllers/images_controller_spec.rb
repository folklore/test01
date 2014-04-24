require 'spec_helper'

describe ImagesController do

  let(:valid_attributes) { { :title => "title",
                             :file => File.open(File.join(Rails.root, '/spec/fixtures/file/image.png')) } }

  let(:valid_session) { { "warden.user.user.key" => session["warden.user.user.key"] } }

  describe "GET index" do
    it "assigns all images as @images" do
      image = Image.create! valid_attributes
      get :index, {}, valid_session
      assigns(:images).should eq([image])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the images into @posts" do
      image1, image2 = Image.create!( valid_attributes ), Image.create!( valid_attributes )
      get :index

      expect(assigns(:images)).to match_array([image1, image2])
    end

  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      image = Image.create! valid_attributes
      get :show, {:id => image.to_param}, valid_session
      assigns(:image).should eq(image)
    end
  end

  describe "GET edit" do
    it "assigns the requested image as @image" do
      image = Image.create! valid_attributes
      get :edit, {:id => image.to_param}, valid_session
      assigns(:image).should eq(image)
    end
  end
end