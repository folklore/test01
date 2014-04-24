class Image < ActiveRecord::Base

  mount_uploader :file, FileUploader
  validates :file,
             presence: true

  validates :title,
             presence: true

  attr_accessor :tag_list

  has_many :images_tags
  has_many :tags,
            through: :images_tags

  def tag_list
    tags.map(&:title).join(", ")
  end
 
  def tag_list=(titles)
    transaction do
      self.tags = titles.split(/[,; ]+/).map do |t|
        t = t.strip.gsub('_', ' ').downcase
        Tag.where(title: t).first_or_create!
      end
    end
  end

  before_create :remove_extension_from_title

  private

    def remove_extension_from_title
      self.title = File.basename(self.title, '.*')
    end

end