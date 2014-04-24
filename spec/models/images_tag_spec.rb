require 'spec_helper'

describe ImagesTag do

  context "associations" do
    it { should belong_to(:image) }
    it { should belong_to(:tag) }
  end

end