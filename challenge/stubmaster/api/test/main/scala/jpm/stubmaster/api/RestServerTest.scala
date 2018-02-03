package jpm.stubmaster.api

import akka.event.NoLogging
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._
import akka.http.scaladsl.model.ContentTypes._
import akka.http.scaladsl.model.StatusCodes._
import akka.http.scaladsl.testkit.ScalatestRouteTest
import akka.testkit.TestActorRef
import org.scalatest._
import scala.concurrent.Future

import jpm.stubmaster.model.Venue
import jpm.stubmaster.repository.VenueAccess

class TestVenueAccess extends VenueAccess(null) {
  override def venues() = {
    Future {
      Seq(Venue("1234", "Test Venue", "Test City"))
    }
  }
}


class ServiceSpec extends FlatSpec with Matchers with ScalatestRouteTest with Service {
  override def testConfigSource = "akka.loglevel = DEBUG"
  override def config = testConfig
  override val logger = NoLogging

  override def venues = TestActorRef[TestVenueAccess](new TestVenueAccess)

  "/venue/" should "respond with a list of venues" in {
    Get(s"/venue/") ~> routes ~> check {
      status shouldBe OK
      contentType shouldBe `application/json`
      responseAs[String] shouldBe """[{"uuid":"1234","name":"Test Venue","city":"Test City"}]"""
    }
  }
}