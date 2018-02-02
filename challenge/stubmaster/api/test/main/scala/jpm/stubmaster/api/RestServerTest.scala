package jpm.stubmaster.api

import akka.event.NoLogging
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._
import akka.http.scaladsl.model.ContentTypes._
import akka.http.scaladsl.model.StatusCodes._
import akka.http.scaladsl.testkit.ScalatestRouteTest
import org.scalatest._


class ServiceSpec extends FlatSpec with Matchers with ScalatestRouteTest with Service {
  override def testConfigSource = "akka.loglevel = DEBUG"
  override def config = testConfig
  override val logger = NoLogging

  "/venue/" should "respond with a list of venues" in {
    Get(s"/venue/") ~> routes ~> check {
      status shouldBe OK
      contentType shouldBe `application/json`
      responseAs[String] shouldBe "[]"
    }
  }
}