package jaeger

import (
	"github.com/uber/jaeger-client-go/config"
)

func JaegerInit(serviceName string) {
	// TODO: Something correct here that logs to Jaeger
	// metricsFactory := prometheus.New()
	tracer, closer, err := config.Configuration{
		ServiceName: serviceName,
	}.NewTracer(
	// config.Metrics(metricsFactory),
	)
	if tracer == nil {
		//something
	}
	if closer == nil {
		//something
	}
	if err == nil {
		// something
	}
}
