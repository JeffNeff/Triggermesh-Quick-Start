#!/bin/bash
export KNATIVE_VERSION=v1.5.0
export TRIGGERMESH_VERSION=v1.18.1
echo "Setting up knative serving"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-crds.yaml

kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-core.yaml

sleep 5

echo "Setting up kourier"
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-${KNATIVE_VERSION}/kourier.yaml

sleep 10

# Setup Knative DOMAIN DNS
INGRESS_HOST=$(kubectl -n kourier-system get service kourier -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
if [ -z $INGRESS_HOST ]; then INGRESS_HOST=$(kubectl -n kourier-system get service kourier -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'); fi
while [ -z $INGRESS_HOST ]; do
  sleep 5
  INGRESS_HOST=$(kubectl -n kourier-system get service kourier -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  if [ -z $INGRESS_HOST ]; then INGRESS_HOST=$(kubectl -n kourier-system get service kourier -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'); fi
done

if [ "$INGRESS_HOST" == "localhost" ]; then INGRESS_HOST=127.0.0.1; fi

KNATIVE_DOMAIN=$INGRESS_HOST.sslip.io
kubectl patch configmap -n knative-serving config-domain -p "{\"data\": {\"$KNATIVE_DOMAIN\": \"\"}}"


kubectl --namespace kourier-system get service kourier

kubectl get pods -n knative-serving

kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-default-domain.yaml

echo "Setting up eventing"
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/eventing-crds.yaml

kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/eventing-core.yaml

kubectl get pods -n knative-eventing

kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/in-memory-channel.yaml

kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/mt-channel-broker.yaml

# Install Triggermesh
echo "Setting up Triggermesh"
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/download/${TRIGGERMESH_VERSION}/triggermesh-crds.yaml
kubectl wait --for=condition=Established --all crd
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/download/${TRIGGERMESH_VERSION}/triggermesh.yaml
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n triggermesh

echo "done.."
