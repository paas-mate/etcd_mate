package path

import (
	"os"
	"path/filepath"
)

// etcd
var (
	EtcdHome = os.Getenv("ETCD_HOME")
)

// mate
var (
	EtcdMatePath           = filepath.FromSlash(EtcdHome + "/mate")
	EtcdScripts            = filepath.FromSlash(EtcdMatePath + "/scripts")
	EtcdStartScript        = filepath.FromSlash(EtcdScripts + "/start-etcd-stand-alone.sh")
	EtcdStartPseudoScript  = filepath.FromSlash(EtcdScripts + "/start-etcd-pseudo.sh")
	EtcdStartClusterScript = filepath.FromSlash(EtcdScripts + "/start-etcd-cluster.sh")
)
