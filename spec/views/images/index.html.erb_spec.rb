require 'spec_helper'

describe "images/index" do

  before(:each) do

    @attr = { :title => "title",
              :file => File.open(File.join(Rails.root, '/spec/fixtures/file/image.png')) }

    assign(:images, [Image.create( @attr ), Image.create( @attr )])
    render

  end

  it "should contain element for pupload" do
    expect(rendered).to match("<div id='uploader'></div>")
  end

  it "renders _image partial for each image" do
    expect(view).to render_template(partial: "_image", count: 2)
  end

end