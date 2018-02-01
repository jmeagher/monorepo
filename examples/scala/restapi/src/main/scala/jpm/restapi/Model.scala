package jpm.restapi

import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport
import spray.json.DefaultJsonProtocol

object GreetingJsonSupport extends SprayJsonSupport with DefaultJsonProtocol {
   import DefaultJsonProtocol._
   implicit val requestFormat = jsonFormat2(GreetingRequest)
   implicit val responseFormat = jsonFormat1(GreetingResponse)
}

final case class GreetingRequest(greeting: String, name: String)
final case class GreetingResponse(fullGreeting: String)
