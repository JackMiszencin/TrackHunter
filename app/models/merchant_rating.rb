class MerchantRating < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :merchant
  belongs_to :rating
end
