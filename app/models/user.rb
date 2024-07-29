class User < ApplicationRecord

  

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, 
  #        :trackable, :confirmable

  before_save {self.email.downcase!}

  has_many :articles, dependent: :destroy

  
  validates :username , presence: true , uniqueness:{case_sensitive:false},length: {minimum:3, maximum:30}

  validates :email , presence: true , 
            uniqueness:{case_sensitive:false},
            length: {maximum:105},
            format: {with: URI::MailTo::EMAIL_REGEXP}

  has_secure_password

end