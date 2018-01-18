package jpm.restapi

// Mostly based on https://github.com/theiterators/akka-http-microservice
// and https://github.com/akka/akka-http/blob/master/akka-http-tests/src/main/java/akka/http/javadsl/server/examples/petstore/PetStoreExample.java

import akka.actor.ActorSystem
import akka.event.{LoggingAdapter, Logging}
import akka.http.scaladsl.Http
import akka.http.scaladsl.client.RequestBuilding
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._
import akka.http.scaladsl.marshalling.ToResponseMarshallable
import akka.http.scaladsl.model.{HttpResponse, HttpRequest}
import akka.http.scaladsl.model.StatusCodes._
import akka.http.scaladsl.server.Directives._
import akka.http.scaladsl.unmarshalling.Unmarshal
import akka.stream.{ActorMaterializer, Materializer}
import akka.stream.scaladsl.{Flow, Sink, Source}
import com.typesafe.config.Config
import com.typesafe.config.ConfigFactory
import java.io.IOException
import scala.concurrent.{ExecutionContextExecutor, Future}
import scala.math._
import spray.json.DefaultJsonProtocol


// class HelloWorldController extends Controller {

//   get("/hi") { request: Request =>
//     info("hi")
//     "Hello " + request.params.getOrElse("name", "unnamed")
//   }
// }


trait Service {
  implicit val system: ActorSystem
  implicit def executor: ExecutionContextExecutor
  implicit val materializer: Materializer

  def config: Config
  val logger: LoggingAdapter

  val routes = {
    logRequestResult("akka-http-microservice") {
      pathSingleSlash { get { complete {
        logger.debug("Hello")
        "Hello World!"
      } } } ~
      pathPrefix("hi") { parameters('name.?) { name => complete {
        val theName = name.getOrElse("unnamed")
        logger.debug(s"Hi $theName")
        s"Hello $theName"
      } } }
    }
  }
}

object RestServerMain extends App with Service {
  override implicit val system = ActorSystem()
  override implicit val executor = system.dispatcher
  override implicit val materializer = ActorMaterializer()

  override val config = ConfigFactory.load("application.conf")
  override val logger = Logging(system, getClass)

  println("Server startup")
  logger.debug("Server startup")
  Http().bindAndHandle(routes, "0.0.0.0", 8080)
  println("Server stopping")
  logger.debug("Server stopping")
}