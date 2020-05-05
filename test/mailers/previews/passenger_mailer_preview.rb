# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/thank_you_email
  def thank_you_email
    
    PassengerMailer.thank_you_email
  end

end
