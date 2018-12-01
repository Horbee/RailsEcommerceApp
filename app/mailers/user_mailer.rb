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

	def order_received_email(email, name, order)
		@name = name
		@order = order
		mail(
			from: "thehonormaster@gmail.com",
			to: email,
			subject: "Thank you for your purchase!")
	end

	def admin_rights_requested(user, message, time)
		@user = user	
		@message = message
		@time = time
		mail(
			from: @user.email,
			to: "n.horox@gmail.com",
			subject: "User has requested admin rights"
		)
	end
end