class Post < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  has_many :comments


  validates :title, :presence => true
  validates :content, :presence => true,
                      :length => { :minimum => 5 }
  validates_attachment :avatar, presence: true,
    content_type: { content_type: ["image/jpg", "image/png"] },
    size: { less_than: 2.megabytes }

end
