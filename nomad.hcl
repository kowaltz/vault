variable "vault_raft_node_id" {
  type = string
  default = "vrnid"
}

task "vault" {
  driver = "docker"

  config {
    image = "https://hub.docker.com/r/hashicorp/vault:1.15"

    args = [
      "-e", "VAULT_RAFT_NODE_ID=\"node_root\"",
      "-config", var.vault_raft_node_id,
    ]

    ports = ["http"]
  }
}