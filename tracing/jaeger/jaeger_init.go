package jaeger

import (
	"log"

	opentracing "github.com/opentracing/opentracing-go"
	jaegercfg "github.com/uber/jaeger-client-go/config"
)

// Init initializes things required for use of Jaeger for open tracing.
// For details about the configuration options see https://github.com/jaegertracing/jaeger-client-go#environment-variables
func Init() error {
	cfg, err := jaegercfg.FromEnv()
	if err != nil {
		// parsing errors might happen here, such as when we get a string where we expect a number
		log.Printf("Could not parse Jaeger env vars: %s", err.Error())
		return err
	}
	tracer, closer, err := cfg.NewTracer()
	if err != nil {
		log.Printf("Could not initialize jaeger tracer: %s", err.Error())
		return err
	}
	defer closer.Close()

	opentracing.SetGlobalTracer(tracer)
	return nil
}
