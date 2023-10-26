docker run \
  -e VAULT_RAFT_NODE_ID="node_root" \
  hashicorp/vault
  -config /etc/vault/${CONFIG_FILE_TO_USE}

VAULT_RAFT_NODE_ID="node_i"

docker run -p 8200:8200 -e NODE_ID=1 -e NODE_TYPE=root --cap-add=IPC_LOCK vault server