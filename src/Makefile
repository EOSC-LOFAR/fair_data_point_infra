VOS_USER = dba
VOS_PASS = dba
VOS_PORT = 1111
VOS_SHARE = /tmp/share
VOS_EXE = isql $(VOS_PORT) $(VOS_USER) $(VOS_PASS) verbose=off errors=stdout
VOS_NAME = virtuoso
VOS_IMAGE = candygene/docker-virtuoso
FDP_NAME = fdp
FDP_IMAGE = nlesc/odex-fairdatapoint:lofar
DATA_DIR = data
SRC_DIR = src

.PHONY:
	all
	pull-vos-image
	pull-fdp-image
	pull-images
	start-vos-srv
	start-fdp-srv
	show-containers
	sleep
	start-srv
	rm-vos-srv
	rm-fdp-srv
	rm-images
	install-pkgs
	import-rdf
	post-install
	clean

all: pull-images start-srv install-pkgs import-rdf post-install

pull-vos-image:
	docker pull $(VOS_IMAGE)

pull-fdp-image:
	docker pull $(FDP_IMAGE)

pull-images: pull-vos-image pull-fdp-image

start-vos-srv:
	docker run --name $(VOS_NAME) -v "$(PWD):$(VOS_SHARE)" -p 8890:8890 -d $(VOS_IMAGE)

start-fdp-srv:
	docker run --name $(FDP_NAME) -p 8080:8080 -d $(FDP_IMAGE)

show-containers:
	docker ps -a

sleep:
	sleep 10

start-srv: start-vos-srv start-fdp-srv sleep show-containers

rm-vos-srv:
	docker rm -f $(VOS_NAME) || exit 0

rm-fdp-srv:
	docker rm -f $(FDP_NAME) || exit 0

rm-srv: rm-vos-srv rm-fdp-srv

rm-images:
	docker system prune -f -a

install-pkgs:
	docker exec $(VOS_NAME) $(VOS_EXE) $(SRC_DIR)/install_pkgs.sql

import-rdf:
	sed -i.org "s:__DATA_DIR__:$(DATA_DIR):" import_rdf.sql
	docker exec $(VOS_NAME) $(VOS_EXE) $(SRC_DIR)/import_rdf.sql
	docker exec $(VOS_NAME) $(VOS_EXE) $(SRC_DIR)/sponge_rdf.sql

post-install:
	docker exec $(VOS_NAME) $(VOS_EXE) $(SRC_DIR)/post_install.sql

clean: rm-srv rm-images
