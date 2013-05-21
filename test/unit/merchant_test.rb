require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
	def setup
		@m = merchants(:thai_hut)
	end
	def test_raises_error_when_address_blank
		assert_attribute_validated(@m, :address)
	end
	def test_raises_error_when_city_blank
		assert_attribute_validated(@m, :city)
	end
	def test_raises_error_when_state_blank
		assert_attribute_validated(@m, :state)
	end
	def test_raises_error_when_zip_blank
		assert_attribute_validated(@m, :zip)
	end
	def test_raises_error_when_name_blank
		assert_attribute_validated(@m, :name)
	end
	def test_checks_format_of_zip
		assert_string_attribute_checks_format(@m, :zip, "bzkhf34-0120")
	end
	def test_checks_format_of_state
		assert_string_attribute_checks_format(@m, :state, "AAAAAAbbbbb312")
	end
	
end
