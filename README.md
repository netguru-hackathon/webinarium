# Description

Webinarium - webinar archive. Allows you to add, edit, upvote and bookmark favorite webinars. You can schedule a webinar and have the app automatically send a reminder to slack. Includes a suggestion box and voting on best webinar subject ideas.

# Future goals

* admin panel
* posting new suggestions to slack
* posting newly scheduled webinars to slack

# Database setup

We're using postgres.

`sudo -u postgres psql template1`

Fill in your desired password in the `db/development_setup_script.sql` - if you leave it empty you might have to [change your hba_conf](https://gist.github.com/p1nox/4953113).

Then in the pql console run: `\i /path/to/db/development_setup_script.sql`
