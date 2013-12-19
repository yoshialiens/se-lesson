class Post < ActiveRecord::Base
  has_attached_file :avatar, styles: { :thumb => ["50x50#", :jpg], :medium => ["100x100#", :jpg], :large => ["300x300>", :jpg] },
  default_url: "http://nikkegroup.com/wp-content/uploads/2013/08/nikke-top1.jpg",
  :url => "/system/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"

  has_many :comments


  validates :title, :presence => true
  validates :content, :presence => true,
                      :length => { :minimum => 5 }
  # validates_attachment :avatar, presence: true,
  #   content_type: { content_type: ["image/jpg", "image/png"] },
  #   size: { less_than: 2.megabytes }



end
