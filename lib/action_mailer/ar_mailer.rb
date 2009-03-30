require 'action_mailer'

##
# Adds sending email through an ActiveRecord table as a delivery method for
# ActionMailer.
#

class ActionMailer::ARMailer < ActionMailer::Base

  def self.inherited(sub)
    logger.warn('The ActionMailer::ARMailer class has been deprecated. Will be removed in version 2.1. Just use ActionMailer::Base.')
  end

end

class ActionMailer::Base

  ##
  # Set the email class for deliveries.
  #
  cattr_accessor :email_class

  ##
  # Adds +mail+ to the Email table.  Only the first From address for +mail+ is
  # used.

  def perform_delivery_activerecord(mail)
    mail.destinations.each do |destination|
      self.class.email_class.create :mail => mail.encoded, :to => destination, :from => mail.from.first
    end
  end

end

