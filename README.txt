= ar_mailer

A two-phase delivery agent for ActionMailer

Rubyforge Project:

http://rubyforge.org/projects/seattlerb

Documentation:

http://seattlerb.org/ar_mailer

Bugs:

http://rubyforge.org/tracker/?func=add&group_id=1513&atid=5921

== About

Even delivering email to the local machine may take too long when you have to
send hundreds of messages.  ar_mailer allows you to store messages into the
database for later delivery by a separate process, ar_sendmail.

== Installing ar_mailer

Just install the gem:

  $ sudo gem install ar_mailer

See ActionMailer::ARMailer for instructions on converting to ARMailer.

See ar_sendmail -h for options to ar_sendmail.

NOTE: You may need to delete an smtp_tls.rb file if you have one lying
around.  ar_mailer supplies it own.

=== ar_sendmail on FreeBSD or NetBSD

An rc.d script is included in share/ar_sendmail.

