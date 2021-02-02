class GuestMailer < ApplicationMailer
  def welcome_email(reservation)
    @guest = reservation.guest
    @reservation = reservation
    mail(to: @guest.email, subject: 'Your Reservation been confirmed')
  end
end
