class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :is_admin, :is_merchant
  # attr_accessible :title, :body
  has_many :businesses, :class_name => "Merchant", :foreign_key => "owner_id", :inverse_of => :owner
  has_many :owner_ratings, :class_name => "Rating", :through => :businesses, :source => :ratings, :dependent => :destroy
  has_one :listener

end