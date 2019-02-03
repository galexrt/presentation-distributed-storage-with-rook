#!/bin/bash

echo '(1 adding a "new" node, in this case the master node which is tainted'
read
kubectl taint nodes --all node-role.kubernetes.io/master-

echo '(2 wait for discover and agent daemon pods to start on node'
echo 'kubectl get -n rook-ceph-system po'
read

echo '3) restart the operator (currently needed though automation for that is on the way)'
read
kubectl delete -n rook-ceph-system pod -l app=rook-ceph-operator --wait=false
sleep 3
kubectl get -n rook-ceph-system pod -l app=rook-ceph-operator
read

echo '3) wait for the operator to start the rook-ceph-osd-prepare Job for the new node'
read
kubectl get -n rook-ceph pod -l app=rook-ceph-osd-prepare -o wide
read

echo '4) run `ceph osd tree` to see the new node added and the OSD being up after a bit more time'
read
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') -- ceph osd tree
