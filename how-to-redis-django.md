### this is how-to set up redis(running in docker) with fresh django-project(not running in docker)

- start docker-containers with redis running -> expose 6379 to host machine!

- `pip install dj_redis_url`

- export REDIS variable `export REDIS_URL=redis://127.0.0.1:6379/0`  !!! In case of heroku addons, it will be exported automatically

- open settings.py and amend the following settings:

# settings.py ------------------------------------------------------------------------------

import dj_redis_url

CHANNEL_LAYERS = {
    'default': {
        'BACKEND': 'channels_redis.core.RedisChannelLayer',
        'CONFIG': {
            #"hosts": [('127.0.0.1', 6379)],
            "hosts": [(dj_redis_url.config()['HOST'],dj_redis_url.config()['PORT'] )],  # With this settings we can read the REDIS_URL env from host.
        },
    },
}

# settings.py ------------------------------------------------------------------------------


Test that all working now in python app
