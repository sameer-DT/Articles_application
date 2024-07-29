class Article < ApplicationRecord

  belongs_to :user

  validates :title,presence:true,uniqueness:{case_sensitive:false},length: {minimum:6, maximum:15}

  validates :description,presence:true,length: {minimum:7, maximum:20}

  validates :author,presence:true,length: {minimum:6, maximum:15}


end