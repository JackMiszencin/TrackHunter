ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  def assert_attribute_validated(model, attribute)
  	model.assign_attributes(attribute => nil)
  	assert !model.valid?, "#{model} is not validating presence of #{attribute}."
  end
  def assert_string_attribute_checks_format(model, attribute, string)
  	model.assign_attributes(attribute => string)
  	assert_raise NameError do
  		model.assign_attributes(attribute => string)
  	end
  end
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
