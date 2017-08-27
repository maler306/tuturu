class TicketsMailer < ApplicationMailer

  def buy_ticket(ticket)
    @ticket = ticket
    @user = ticket.user
    mail(to: @user.email, subject: t('tickets_mailer.buy_ticket.letter_subject'))
  end

  def cancell_ticket(ticket)
    @user = ticket.user
    @ticket_route = ticket.route_name
    mail(to: @user.email, subject: t('tickets_mailer.cancell_ticket.letter_subject'))
  end
end
