package etcd

import (
	"etcd_mate/pkg/config"
	"etcd_mate/pkg/path"
	"etcd_mate/pkg/util"
	"github.com/paas-mate/gutil"
	"go.uber.org/zap"
)

func Start() {
	startEtcd()
}

func startEtcd() {
	if config.DeployType == "stand-alone" {
		stdout, stderr, err := gutil.CallScript(path.EtcdStartScript)
		util.Logger().Info("output is ", zap.String("stdout", stdout), zap.String("stderr", stderr))
		util.Logger().Error("run start prom scripts failed ", zap.Error(err))
	} else if config.DeployType == "pseudo" {
		stdout, stderr, err := gutil.CallScript(path.EtcdStartPseudoScript)
		util.Logger().Info("output is ", zap.String("stdout", stdout), zap.String("stderr", stderr))
		util.Logger().Error("run start prom scripts failed ", zap.Error(err))
	}
}
