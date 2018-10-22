# Kubeless Demo

Short demo for my serverless talk

## Requirements
* Running demo k8s cluster -> put `kubeconfig` in this directory
* Run `install-kubeless.sh` on your demo k8s cluster

## Commands

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
