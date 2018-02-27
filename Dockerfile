FROM		ubuntu
RUN		apt update && \
		apt install -y build-essential python2.7-dev \ 
		libffi-dev python-pip python-setuptools sqlite3 \
		libssl-dev libjpeg-dev libxslt1-dev git libevent-dev
RUN		git clone https://github.com/coturn/coturn.git /opt/coturn
RUN		cd /opt/coturn && \
		./configure && \
		make && \
		make install
RUN		pip install --upgrade pip && \
		pip install --upgrade setuptools && \
		pip install https://github.com/matrix-org/synapse/tarball/master
COPY		./entrypoint.sh /entrypoint.sh
COPY		./register_new_user.sh /register_new_user.sh
ENTRYPOINT	["/entrypoint.sh"]
