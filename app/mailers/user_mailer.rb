class UserMailer < ApplicationMailer

	def contact_form(name, email, message)
		@message = message
		mail(
			from: email,
			to: "n.horox@gmail.com",
			subject: "A new contact form email from #{name}")
	end
end