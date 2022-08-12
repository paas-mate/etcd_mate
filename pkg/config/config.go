package config

import "github.com/paas-mate/gutil"

// etcd config
var (
	DeployType string
)

func init() {
	DeployType = gutil.GetEnvStr("DeployType", "stand-alone")
}
