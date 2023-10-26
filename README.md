# Nodes

All Vault clusters consist of three nodes, in one of the following configurations:
- **Master cluster:** One root node and two children nodes.
- **Subordinate cluster:** Three children nodes.

The root node is the one responsible for auto-unsealing the other two.
A **master cluster** is responsible for unsealing all subordinate clusters.

All clusters are configured for HA with integrated storage (Raft).

# File structure

All working Vault files are located in the `/vault` directory:

- Storage in the `/vault/raft` directory.
- Configs in the `/vault/config` directory.
- Logs in the `/vault/logs` directory.
- Files in the `/vault/files` directory.
- And the binary being `/vault/vault`.
