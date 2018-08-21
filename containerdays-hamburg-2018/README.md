# containerdays-hamburg-2018

The demo files used at ContainerDays Hamburg 2018 "Distributed storage with Rook" talk.

These files are for Rook v0.7.

## Block Storage

### Busybox

Simple busybox Deployment with a PVC, the PV is attached to `/data`.

### Elasticsearch

Starts an Elasticsearch instance.

## Shared Filesystem

As an example application GitLab is used, to demonstrate to simplicity to be able to scale the application

### GitLab

The manifests can be found here: [GitHub galexrt/kubernetes-manifests - master /gitlab](https://github.com/galexrt/kubernetes-manifests/tree/master/gitlab).

## Example Cluster

See [`cluster/rook-cluster.yaml`](/cluster/rook-cluster.yaml).
