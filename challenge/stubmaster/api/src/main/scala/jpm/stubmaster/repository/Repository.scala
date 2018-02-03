package jpm.stubmaster.repository


import akka.actor.{Actor, ActorLogging}
import akka.pattern.pipe
import com.datastax.driver.core.Session
import scala.concurrent.Future

import jpm.stubmaster.model.Venue

object VenueAccess {
  case class VenueList()
  case class GetVenue(uuid: String)

  case class VenueNotFound(uuid: String)
}

class VenueAccess(cassandra: Session) extends Actor with ActorLogging {
  import VenueAccess._
  implicit val ec = context.dispatcher

  override def receive: Receive = {
    case VenueList =>
      venues() pipeTo sender()
    case GetVenue(uuid) =>
      val _sender = sender()
      venue(uuid).foreach {
        case Some(venue) => _sender ! venue
        case None => _sender ! VenueNotFound(uuid)
      }
  }

  def venues(): Future[Seq[Venue]] = {
    Future{Seq()}
  }

  def venue(uuid: String): Future[Option[Venue]] = {
    Future{null}
  }
}