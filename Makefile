install:
	kustomize build . | kubectl apply --context=nuc2 -f -

build: build-avahi build-caddy

build-avahi:
	cd avahi/docker && docker build -t ghcr.io/coderanger/avahi:latest .
	cd avahi/docker && docker push ghcr.io/coderanger/avahi:latest

build-caddy:
	cd caddy/docker && docker build -t ghcr.io/coderanger/caddy-discord:latest .
	cd caddy/docker && docker push ghcr.io/coderanger/caddy-discord:latest
