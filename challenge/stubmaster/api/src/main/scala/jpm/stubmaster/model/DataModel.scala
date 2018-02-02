package jpm.stubmaster.model

import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport
import spray.json.DefaultJsonProtocol


object ModelJsonSupport extends SprayJsonSupport with DefaultJsonProtocol {
      //import DefaultJsonProtocol._

      implicit val venueFormat = jsonFormat3(Venue)
}

final case class Venue (
    val uuid: String,
    val name: String,
    val city: String
)
