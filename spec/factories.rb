FactoryGirl.define do
  factory :image do
    title { ('a'..'z').to_a.shuffle.first(9).join }
    file { File.open(File.join(Rails.root, '/spec/fixtures/file/image.png')) }
    tag_list 'tag1 tag2, tag3; tag4'
  end

  factory :invalid_image, parent: :image do
    title nil
    file nil
  end
end