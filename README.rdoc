= ar_mailer

A two-phase delivery agent for ActionMailer

Rubyforge Project:

http://rubyforge.org/projects/seattlerb

Documentation:

http://seattlerb.org/ar_mailer

and for forked additions

http://github.com/adzap/ar_mailer/wikis

Bugs:

http://adzap.lighthouseapp.com/projects/26997-ar_mailer

== About

Even delivering email to the local machine may take too long when you have to
send hundreds of messages.  ar_mailer allows you to store messages into the
database for later delivery by a separate process, ar_sendmail.

== Installing ar_mailer (forked)

Before installing you will need to make sure the original gem is uninstalled as they can't coexist:

  $ sudo gem uninstall ar_mailer

Install the gem from GitHub gems server:

First, if you haven't already:

  $ sudo gem sources -a http://gems.github.com

Then

  $ sudo gem install adzap-ar_mailer

For Rails >= 2.1, in your environment.rb:
  
  config.gem "adzap-ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'

For Rails 2.0, in an initializer file:

  require 'action_mailer/ar_mailer'

== Usage

Go to your Rails project:

  $ cd your_rails_project

Create a new migration:

  $ ar_sendmail --create-migration

You'll need to redirect this into a file.  If you want a different name
provide the --table-name option.

Create a new model:

  $ ar_sendmail --create-model

You'll need to redirect this into a file.  If you want a different name
provide the --table-name option.

You'll need to be sure to set the From address for your emails.  Something
like:

  def list_send(recipient)
    from 'no_reply@example.com'
    # ...

Edit config/environments/production.rb and set the delivery method:

  config.action_mailer.delivery_method = :activerecord

Or if you need to, you can set each mailer class delivery method individually:

  class MyMailer < ActionMailer::Base
    self.delivery_method = :activerecord
  end

This can be useful when using plugins like ExceptionNotification. Where it
might be foolish to tie the sending of the email alert to the database when the 
database might be causing the exception being raised. In this instance you could
override ExceptionNofitier delivery method to be smtp or set the other 
mailer classes to use ARMailer explicitly.

Then to run it:

  $ ar_sendmail

You can also run it from cron with -o, or as a daemon with -d.

See <tt>ar_sendmail -h</tt> for full details.

=== Alternate Mail Storage

If you want to set the ActiveRecord model that emails will be stored in,
see ActionMailer::Base.email_class=


=== Help

See ar_sendmail -h for options to ar_sendmail.

NOTE: You may need to delete an smtp_tls.rb file if you have one lying
around.  ar_mailer supplies it own.

== Run as a service (init.d/rc.d scripts)

For Linux both script and demo config files are in share/linux. 
See ar_sendmail.conf for setting up your config. Copy the ar_sendmail file 
to /etc/init.d/ and make it executable. Then for Debian based distros run
'sudo update-rc.d ar_sendmail defaults' and it should work. Make sure you have 
the config file /etc/ar_sendmail.conf in place before starting.

For FreeBSD or NetBSD script is share/bsd/ar_sendmail. This is old and does not
support the config file unless someone wants to submit a patch.
