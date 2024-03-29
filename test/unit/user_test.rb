require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

		test "a user should enter a profile name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

		test "a user should have a unique profile name" do 
		user = User.new
		user.profile_name = "mrvotto"
		user.email = "mrvotto@uwm.edu"
		user.first_name = "Michael"
		user.last_name = "Votto"
		user.password = "dietcoke"
		user.password_confirmation = "dietcoke"
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

		test "a user should have a profile name without spaces"
		user = User.new
		user.profile_name = "My Profile Name With Spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
end
