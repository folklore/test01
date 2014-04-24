require 'spec_helper'

describe Tag do

  context "associations" do
    it { should have_many(:images_tags) }
    it { should have_many(:images).through(:images_tags) }
  end

end