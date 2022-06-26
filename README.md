# Triggermesh Quick Install
Quickly install Triggermesh on a fresh cluster for development and testing purposes.

## Docker Desktop
### Prerequisites

- Docker Desktop with Kubernetes enabled.

### Install Triggermesh
Clone or download this repository.

Open a terminal within the `./Install/DockerDesktop` folder.

Run the following:
```
./DockerDesktop.sh
```

**Note** you may need to run `chmod +x ./DockerDesktop.sh` before executing.


## Google Cloud !!UNTESTED!!
### Prerequisites

- Google Cloud Kubernetes Engine running with a cluster and the proper kube .config credentials and context set.

### Install Triggermesh
Clone or download this repository.

Open a terminal within the `./Install/GoogleCloud` folder.

Run the following:
```
./GoogleCloud.sh
```

**Note** you may need to run `chmod +x ./GoogleCloud.sh` before executing.

## Minikube !!UNTESTED!!
### Prerequisites

- Minikube running with a cluster and the proper kube .config credentials and context set.
- A second window with `minikube tunnel` running.

### Install Triggermesh
Clone or download this repository.

Open a terminal within the `./Install/Minikube` folder.

Run the following:
```
./Minikube.sh
```

**Note** you may need to run `chmod +x ./Minikube.sh` before executing.

## Microsoft Azure AKS !!UNTESTED!!
### Prerequisites

- Microsoft Azure AKS with a cluster and the proper kube .config credentials and context set.

### Install Triggermesh
Clone or download this repository.

Open a terminal within the `./Microsoft/Microsoft` folder.

Run the following:
```
./Microsoft.sh
```

**Note** you may need to run `chmod +x ./Microsoft.sh` before executing.


## Next steps.

Check out the `./Next-Steps` dirctory for a structured introduction to Triggermesh components.

Or, if you are a Kubernetes master, jump right in by checking out the `./Triggermesh-Components` directory and start playing right away!


## Known issues / FAQ

- There seems to be a problem with Docker Desktop not releasing port 31080 after tearing down/restarting the cluster.
    Fix: Restart your computer.
