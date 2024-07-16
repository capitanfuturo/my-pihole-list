.DEFAULT_GOAL := help

##help: @ This help
help:
	@fgrep -h "##" $(MAKEFILE_LIST)| sort | fgrep -v fgrep | tr -d '##'  | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

##pihole-adlist-builder: @ Run pihole adlist builder tool image
pihole-adlist-builder:
	docker compose build
	docker compose run --rm pihole-adlist-builder

##build: @ update list
build:
	sh update-list.sh