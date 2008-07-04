= ar_mailer

A two-phase delivery agent for ActionMailer

Rubyforge Project:

http://rubyforge.org/projects/seattlerb

Documentation:

http://seattlerb.org/ar_mailer

and for forked additions

http://github.com/adzap/ar_mailer/wikis

Bugs:

http://rubyforge.org/tracker/?func=add&group_id=1513&atid=5921

== About

Even delivering email to the local machine may take too long when you have to
send hundreds of messages.  ar_mailer allows you to store messages into the
database for later delivery by a separate process, ar_sendmail.

== Installing ar_mailer (forked)

Install the gem from GitHub gems server:

First, if you haven't already

  $ sudo gem sources -a http://gems.github.com

Then

  $ sudo gem install adzap-ar_mailer

See ActionMailer::ARMailer for instructions on converting to ARMailer.

See ar_sendmail -h for options to ar_sendmail.

NOTE: You may need to delete an smtp_tls.rb file if you have one lying
around.  ar_mailer supplies it own.

=== init.d/rc.d scripts

For Linux both script and demo config files are in share/linux. 
See ar_sendmail.conf for setting up your config. Copy the ar_sendmail file 
to /etc/init.d/ and make it executable. Then for Debian based distros run
'sudo update-rc.d ar_sendmail defaults' and it should work. Make sure you have 
the config file /etc/ar_sendmail.conf in place before starting.

For FreeBSD or NetBSD script is share/bsd/ar_sendmail. This is old and does not
support the config file unless someone wants to submit a patch.
