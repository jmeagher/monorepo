package jpm.stubmaster.api

import akka.actor.ActorSystem
import akka.event.{LoggingAdapter, Logging}
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.stream.{ActorMaterializer, Materializer}
import com.typesafe.config.Config
import com.typesafe.config.ConfigFactory
import scala.concurrent.ExecutionContextExecutor
import jpm.stubmaster.model.Venue


trait Service {
  implicit val system: ActorSystem
  implicit def executor: ExecutionContextExecutor
  implicit val materializer: Materializer

  import jpm.stubmaster.model.ModelJsonSupport._

  def config: Config
  val logger: LoggingAdapter

  val routes = {
    logRequestResult("stubmaster-api") {
      pathSingleSlash { get { complete {
        // Eventually get rid of this
        "Hello World!"
      } } } ~
      pathPrefix("venue") {
        complete(Seq[Venue]())
      }
    }
  }
}

object ApiServerMain extends App with Service {
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