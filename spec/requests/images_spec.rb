require 'spec_helper'

describe "Images" do

  it "download image" do
    visit images_path
    page.should have_selector("#uploader")

    post "/images", { 'image[title]' => "image_title",
                      'image[file]' => fixture_file_upload("#{Rails.root}/spec/fixtures/file/image.png", 'image/png') }

    visit current_path

    wait_until do
      page.find("#images").should have_content("image_title")
    end
  end

end