#encoding: utf-8

# Requires
require 'validations'

class User < ActiveRecord::Base
	# Includes
	include Validations

	# Relationships
	has_many :answers

	# Passw secure
	has_secure_password

	# Constants
	BLANK_ERROR    = "nao pode ficar em branco"

	validate do |user|
		# Validate Name
		unless is_present?(user.name)
			errors.add :name, BLANK_ERROR
		else
			if minimum?(user.name, 3)
				errors.add :name, minimum_error(3)
			else
				string_regex(:name)
			end
		end
		#Validate E-mail
		unless is_present?(user.email)
			errors.add :email, BLANK_ERROR
		else
			if minimum?(user.email, 6)
				errors.add :email, minimum_error(6)
			else
				email_regex(:email)
			end
		end
		# Validate Password and Confirmation
		if is_present?(user.password)						
			if is_present?(user.password_confirmation)
				passw_regex(:password)
				passw_regex(:password_confirmation)
			end
		end
		# Validate Gender
		unless is_present?(user.gender)
			errors.add :gender, BLANK_ERROR
		else
			if user.gender != "male" &&
				user.gender != "female"
				errors.add :gender, "nao e valido"
			end
		end
		# Validate Privilege
		unless is_present?(user.privilege)
			errors.add :privilege, BLANK_ERROR
		else
			if user.privilege != 1 && user.privilege != 0
				errors.add :privilege, "nao e valido"
			end
		end
	end
	
end