```yaml
storage:
  useAllNodes: true
  useAllDevices: false
  deviceFilter:
  location:
  config:
    # storeType: bluestore
    osdsPerDevice: "1"
    directories:
    - path: /rook/storage-dir
    nodes:
    - name: "172.17.4.101"
      directories: # specific directories to use for storage can be specified for each node
      - path: "/rook/storage-dir"
      resources:
        limits:
          cpu: "500m"
          memory: "1024Mi"
        requests:
          cpu: "500m"
          memory: "1024Mi"
    - name: "172.17.4.201"
      devices: # specific devices to use for storage can be specified for each node
      - name: "sdb"
      - name: "nvme01" # multiple osds can be created on high performance devices
        config:
          osdsPerDevice: "5"
      config:
        storeType: filestore
    - name: "172.17.4.301"
      deviceFilter: "^sd."
```
