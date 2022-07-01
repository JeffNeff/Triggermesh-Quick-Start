# UNTESTED!!!
# Triggermesh Quick Start

Quickly install Triggermesh on a fresh AKS cluster for development and testing purposes, and then get up to speed with a step-by-step introduction to the individual Triggermesh components.



## Microsoft !  OK TESTED
### Prerequisites

- Microsoft Azure Aks cluster.

### Install Triggermesh
Clone or download this repository.

- switch kubectl context to Aks cluster
```cmd
kubectl config set-context --current --namespace=<AKS_cluster_name>
```

Open a terminal within the `./Install/Microsoft` folder.

Run the following:
```cmd
./Microsoft.sh
```

**Note** you may need to run `chmod +x ./Microsoft.sh` before executing.

## Next steps.

Check out the `./Next-Steps` dirctory for a structured introduction to Triggermesh components.

Or, if you are a Kubernetes master, jump right in by checking out the `./Triggermesh-Components` directory and start playing right away!
