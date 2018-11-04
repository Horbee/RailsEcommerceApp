class UserMailer < ApplicationMailer

	def contact_email(name, email, subject, message)
		@name = name
		@message = message
		@subject = subject
		mail(
			from: email,
			to: "n.horox@gmail.com",
			subject: "A new contact form email from #{name}")
	end
end