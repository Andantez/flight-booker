# frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.thank_you_email.subject
  #
  def thank_you_email
    # @passenger_email = params[:passengers].pluck(:email)
    @passenger = params[:passenger]
    mail to: @passenger.email,
         subject: "Thank you #{@passenger.name} for choosing us"
  end
end
