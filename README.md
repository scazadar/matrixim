run:

docker run -d -p 8008:8008 -p 8448:8448 -e SERVERNAME=yyy.com -v /path/to/data:/etc/matrixim scazadar/matrixim

change path to database (and other settings) in the config to /etc/matrixim/db/homeserver.db:

vim /path/to/data/homeserver.yaml


reCAPTCHA:

https://developers.google.com/recaptcha/

TURN Config (audio&video call):

# pwgen -s 64 1

/path/to/data/turnserver.conf:
lt-cred-mech
use-auth-secret
static-auth-secret=PWGEN
realm=turn.myserver.org

/path/to/data/homeserver.yaml
turn_uris: [ "turn:localhost:3478?transport=udp", "turn:localhost:3478?transport=tcp" ]
turn_shared_secret: PWGEN
turn_user_lifetime: 86400000
turn_allow_guests: True

add users:
docker exec -ti container /bin/sh -c "/register_new_user.sh"
