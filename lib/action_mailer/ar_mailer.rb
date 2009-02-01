require 'action_mailer'

##
# Adds sending email through an ActiveRecord table as a delivery method for
# ActionMailer.
#

class ActionMailer::Base

  @@email_class = Email

  ##
  # Current email class for deliveries.

  def self.email_class
    @@email_class
  end

  ##
  # Sets the email class for deliveries.

  def self.email_class=(klass)
    @@email_class = klass
  end

  ##
  # Adds +mail+ to the Email table.  Only the first From address for +mail+ is
  # used.

  def perform_delivery_activerecord(mail)
    mail.destinations.each do |destination|
      @@email_class.create :mail => mail.encoded, :to => destination,
                           :from => mail.from.first
    end
  end

end

