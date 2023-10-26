function config() {
  echo "Creating $VAULT_CONFIG_DIR/node_$1.hcl"
  
  case "$1" in
  1)
    tee $VAULT_CONFIG_DIR/node_$1.hcl - <<EOF
storage "raft" {
  path = "/vault/file"
  node_id = "node_$1"
}

listener "tcp" {
  address     = "127.0.0.$1:8200"
  tls_disable = true
  /*
  tls_cert_file = "/etc/vault.d/ssl/tls.crt"
  tls_key_file = "/etc/vault.d/ssl/tls.key"
  tls_client_ca_file = "/etc/vault.d/ssl/tls_ca.pem"
  tls_cipher_suites = "TLS_TEST_128_GCM_SHA256,
                      TLS_TEST_128_GCM_SHA256,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384"
  */
}

api_addr = "http://127.0.0.$1:8200"
cluster_addr = "http://127.0.0.$1:8201"
EOF
    ;;
  2)
    tee $VAULT_CONFIG_DIR/node_$1.hcl - <<EOF
storage "raft" {
  path = "/vault/file"
  node_id = "node_$1"
  
  retry_join 
  {
    leader_api_addr = "http://127.0.0.1:8200"
    /*
    leader_ca_cert_file = "/etc/vault.d/ssl/tls_ca.pem"
    leader_client_cert_file = "/etc/vault.d/ssl/tls.crt"
    leader_client_key_file = "/etc/vault.d/ssl/tls.key"
    */
  }
  retry_join
  {
    leader_api_addr = "http://127.0.0.3:8200"
    /*
    leader_ca_cert_file = "/etc/vault.d/ssl/tls_ca.pem"
    leader_client_cert_file = "/etc/vault.d/ssl/tls.crt"
    leader_client_key_file = "/etc/vault.d/ssl/tls.key"
    */
  }
}

listener "tcp" {
  address     = "127.0.0.$1:8200"
  tls_disable = true
  /*
  tls_cert_file = "/etc/vault.d/ssl/tls.crt"
  tls_key_file = "/etc/vault.d/ssl/tls.key"
  tls_client_ca_file = "/etc/vault.d/ssl/tls_ca.pem"
  tls_cipher_suites = "TLS_TEST_128_GCM_SHA256,
                      TLS_TEST_128_GCM_SHA256,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384"
  */
}

api_addr = "http://127.0.0.$1:8200"
cluster_addr = "http://127.0.0.$1:8201"
EOF
    ;;
  3)
    tee $VAULT_CONFIG_DIR/node_$1.hcl - <<EOF
storage "raft" {
  path = "/vault/file"
  node_id = "node_$1"
  
  retry_join
  {
    leader_api_addr = "http://127.0.0.1:8200"
    /*
    leader_ca_cert_file = "/etc/vault.d/ssl/tls_ca.pem"
    leader_client_cert_file = "/etc/vault.d/ssl/tls.crt"
    leader_client_key_file = "/etc/vault.d/ssl/tls.key"
    */
  }
  retry_join 
  {
    leader_api_addr = "http://127.0.0.2:8200"
    /*
    leader_ca_cert_file = "/etc/vault.d/ssl/tls_ca.pem"
    leader_client_cert_file = "/etc/vault.d/ssl/tls.crt"
    leader_client_key_file = "/etc/vault.d/ssl/tls.key"
    */
  }
}

listener "tcp" {
  address     = "127.0.0.$1:8200"
  tls_disable = true
  /*
  tls_cert_file = "/etc/vault.d/ssl/tls.crt"
  tls_key_file = "/etc/vault.d/ssl/tls.key"
  tls_client_ca_file = "/etc/vault.d/ssl/tls_ca.pem"
  tls_cipher_suites = "TLS_TEST_128_GCM_SHA256,
                      TLS_TEST_128_GCM_SHA256,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384,
                      TLS_TEST20_POLY1305,
                      TLS_TEST_256_GCM_SHA384"
  */
}

api_addr = "http://127.0.0.$1:8200"
cluster_addr = "http://127.0.0.$1:8201"
EOF
    ;;
  *)
    echo "Error creating config: Please set NODE_ID."
    exit 1
  esac
}