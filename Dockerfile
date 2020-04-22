FROM alpine:3.11.5
MAINTAINER d3thni3ox
ENV KUBE_CA_CERT ""
ENV KUBE_ENDPOINT 127.0.0.1
ENV K8S_CLUSTER_NAME my_cluster_name
ENV K8S_DEPLOY_USER user_k8s_cluster
ENV KUBE_ADMIN_CERT ""
ENV KUBE_ADMIN_KEY ""

ENV KUBECONFIG_SAVED=/root/.kube/config
RUN mkdir ~/.kube
RUN apk add --update curl \ 
	&&  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]
