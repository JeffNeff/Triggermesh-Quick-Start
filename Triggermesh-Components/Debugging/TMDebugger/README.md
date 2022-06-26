# TMDebugger

TMDebugger is a component that aims to allow the user to more effectively debug Triggermesh components.


## First time use

Start by applying the provided manifest `./tmdebugger.yaml` to your cluster. (**Note:** If deploying in a namespace other than `default` you will need to update the manifest.)

```
kubectl apply -f tmdebugger.yaml
```


Now retrieve the public address of the TMDebugger service.

```
