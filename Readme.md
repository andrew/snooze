# Snooze

Keep your web apps awake.

## Setup

Set config in ENV:

    export SNOOZE_SITES=http://teabass.com,http://github.com
    export SNOOZE_EMAIL=andrewnez@gmail.com

Add the sendgrid addon in heroku:

    heroku addons:add sendgrid:starter

Run on a regular basis with:

    heroku run bin/snooze

Goes great with the heroku scheduler: <http://devcenter.heroku.com/articles/scheduler>

## Development

Source hosted at [GitHub](http://github.com/andrew/snooze).
Report Issues/Feature requests on [GitHub Issues](http://github.com/andrew/snooze/issues).

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so I don't break it in a
   future version unintentionally.
 * Commit, do not mess with rakefile, version, or history.
   (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
 * Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Andrew Nesbitt. See [LICENSE](https://github.com/andrew/snooze/blob/master/LICENSE) for details.