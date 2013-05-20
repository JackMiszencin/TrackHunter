class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :is_admin, :is_merchant
  has_many :businesses, :class_name => "Merchant", :foreign_key => "owner_id", :inverse_of => :owner
  has_many :owner_ratings, :class_name => "Rating", :through => :businesses, :source => :ratings, :dependent => :destroy
  # The listener object allows us to access and manipulate many of the attributes for creating a rating without having to alter
  # the custom devise controllers too much. Monkeypatching doesn't tend to work too well with devise, and it's just better
  # to leave those controllers alone and let the 'black box' do its work.
  has_one :listener

end