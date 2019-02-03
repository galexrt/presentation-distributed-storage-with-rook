#!/bin/bash

echo '1) disk fails'
echo '* We have a directory, so not applicable.'
read

echo '2) remove disk from node'
echo 'Demo case:'
echo '* We have a directory, so not applicable.'
read

echo '3) mark out osd. `ceph osd out osd.1`'
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') -- ceph osd out osd.1
read

echo '4) remove from crush map. `ceph osd crush remove osd.1`'
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') -- ceph osd crush remove osd.1
read

echo '5) delete caps. `ceph auth del osd.1`'
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') -- ceph auth del osd.1
read

echo '6) delete the deployment `kubectl delete deployment -n rook-ceph rook-ceph-osd-1`'
echo 'kubectl delete deployment -n rook-ceph rook-ceph-osd-1'
read

echo '7) remove osd. `ceph osd rm osd.1`'
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') -- ceph osd rm osd.1
read

echo '8) delete osd data dir on node `rm -rf /var/lib/rook/osd1`'
echo 'ssh root@116.203.74.130 "rm -rf /var/lib/rook/osd1"'
read

echo '9) edit the osd configmap `kubectl edit configmap -n rook-ceph rook-ceph-osd-NODENAME-config`'
echo '9a) edit out the config section pertaining to your osd id (1) and underlying device.'
echo 'Demo case:'
echo '* NODENAME = my-cluster-worker-03'
echo
echo 'kubectl edit configmap -n rook-ceph rook-ceph-osd-my-cluster-worker-03-config'
read

echo '10) check health of your cluster `ceph -s; ceph osd tree`'
read
