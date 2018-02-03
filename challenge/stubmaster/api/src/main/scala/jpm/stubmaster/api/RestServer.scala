package jpm.stubmaster.api

import akka.actor.{ActorRef, ActorSystem}
import akka.event.{LoggingAdapter, Logging}
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.pattern.ask
import akka.stream.{ActorMaterializer, Materializer}
import akka.util.Timeout
import com.typesafe.config.{Config, ConfigFactory}
import scala.concurrent.ExecutionContextExecutor

import jpm.stubmaster.model.Venue
import jpm.stubmaster.repository.VenueAccess

trait Service {
  implicit val system: ActorSystem
  implicit def executor: ExecutionContextExecutor
  implicit val materializer: Materializer

  import scala.concurrent.duration._
  implicit def requestTimeout = Timeout(5 seconds)

  import jpm.stubmaster.model.ModelJsonSupport._

  def config: Config
  val logger: LoggingAdapter

  def venues: ActorRef

  val routes = {
    logRequestResult("stubmaster-api") {
      pathSingleSlash { get { complete {
        // Eventually get rid of this
        "Hello World!"
      } } } ~
      pathPrefix("venue") {
        complete {
          println(s"Here are the venues:  $venues")
          (venues ? VenueAccess.VenueList).mapTo[Seq[Venue]]
        }
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

  override def venues = null

  println("Server startup")
  logger.debug("Server startup")
  Http().bindAndHandle(routes, "0.0.0.0", 8080)
  println("Server stopping")
  logger.debug("Server stopping")
}