### this is how-to set up psql(running in docker) with fresh django-project(not running in docker)
### WE HAVE TWO OPTIONS:
    1) - Put settings in settings.py
    2) - Supply environment variable DATABASE_URL and reffet to it in settings.py





### OPTION 1:
- start docker-containers with postresql db running


- when starting docker-container the following env variables to be supplied to create the database:
POSTGRES_HOST= 'postgres'
POSTGRES_PORT= '5432'
POSTGRES_DB= 'somedatabasename'
POSTGRES_USER= 'psqluser'
POSTGRES_PASSWORD= 'strongpassword777'

- open settings.py and amend the following settings:

# settings.py ------------------------------------------------------------------------------
# PostgreSQL

  DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',

        'NAME': 'someproject2',  #this will be the name of database created in container

        'USER': 'psqluser',      

        'PASSWORD': 'strongpassword777',

        'HOST': '127.0.0.1',  #postgres

        'PORT': '5432',
    }
  }

# settings.py ------------------------------------------------------------------------------

- run: python manage.py migrate  ->  python manage.py runserver  ->  to see that all works well.




### OPTION 2:
- start docker-containers with postresql db running

- when starting docker-container the following env variables to be supplied to create the database:
POSTGRES_HOST= 'postgres'
POSTGRES_PORT= '5432'
POSTGRES_DB= 'somedatabasename'
POSTGRES_USER= 'psqluser'
POSTGRES_PASSWORD= 'strongpassword777'

- install django-environ `pip install django-environ`

- Export enviroment variable `export DATABASE_URL=postgres://psqluser:strongpassword777@127.0.0.1:5432/somedatabasename`

- open settings.py and amend the following settings:

# settings.py ------------------------------------------------------------------------------

import environ
env = environ.Env()

# PostgreSQL

DATABASES = {"default": env.db("DATABASE_URL")}   # we use this settings here if we supply DATABASE_URL in enviroment variables

# settings.py ------------------------------------------------------------------------------

- run: python manage.py migrate  ->  python manage.py runserver  ->  to see that all works well.

