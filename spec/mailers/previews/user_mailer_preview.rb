# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_email
    	UserMailer.contact_email("John", "john@example.com", "Test Subject", "Hello World!")
	end

	def order_received_email
		UserMailer.order_received_email("john@example.com", "John", Order.first)
	end
	
	def admin_rights_requested
		UserMailer.admin_rights_requested(User.first, "Please give me the admin rights, as already discussed.", Time.now)
	end
end