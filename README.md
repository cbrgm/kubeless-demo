# Kubeless Demo

Short demo for my serverless talk

## Requirements
* Running demo k8s cluster -> put `kubeconfig` in this directory
* Run `install-kubeless.sh` on your demo k8s cluster

## Python demo

```
kubeless function deploy hello --from-file python/test.py --handler test.hello --runtime python2.7
```

```
kubectl proxy &
curl -L --data '{"content": ""}'   --header "Content-Type:application/json"   localhost:8001/api/v1/namespaces/default/services/hello:http-function-port/proxy/
```

## Golang demo

```
kubeless function deploy isprime --from-file prime.go --dependencies gopkg.toml  --handler func.IsPrime --runtime go1.10
```

```
kubeless function ls
```

```
kubeless function call isprime --data "3"
kubeless function call isprime --data "42"
```
