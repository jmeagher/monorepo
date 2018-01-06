package jpm.restapi

import com.twitter.finagle.http.{Request, Response}
import com.twitter.finatra.http.{Controller, HttpServer}
// import com.twitter.finatra.http.filters.{CommonFilters, LoggingMDCFilter, TraceIdMDCFilter}
import com.twitter.finatra.http.routing.HttpRouter

object HelloWorldServerMain extends HelloWorldServer

class HelloWorldServer extends HttpServer {

  override def configureHttp(router: HttpRouter) {
//    router
      // .filter[LoggingMDCFilter[Request, Response]]
      // .filter[TraceIdMDCFilter[Request, Response]]
//      .filter[CommonFilters]
//      .add[HelloWorldController]
  }
}

//class HelloWorldController extends Controller {

  //get("/hi") { request: Request =>
  //  // info("hi")
  //  "Hello " + request.params.getOrElse("name", "unnamed")
  //}
//}