require 'spec_helper'

describe "question/index" do

  before(:each) do
    render
  end

  it 'sholud have button yes' do
    expect(rendered).to have_selector(".yes")
  end


  it 'sholud have button no' do
    expect(rendered).to have_selector(".no")
  end

end