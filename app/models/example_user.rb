class User
	attr_accessor :first_name, :last_name, :email

	def initialize(attributes = {})
		@last_name = attributes[:first_name]
		@first_name = [:last_name]
		@email = attributes[:email]
	end

	def full_name
		"#{@first_name}" + " "  + "#{@last_name}"	
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end