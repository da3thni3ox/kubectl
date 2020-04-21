FROM alpine:3.11.5
RUN apk add --update curl \ 
	&&  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl \
	&& kubectl version --client
