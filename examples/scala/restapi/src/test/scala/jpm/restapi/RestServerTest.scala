package jpm.restapi

import akka.event.NoLogging
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._
import akka.http.scaladsl.model.ContentTypes._
import akka.http.scaladsl.model.{HttpResponse, HttpRequest}
import akka.http.scaladsl.model.StatusCodes._
import akka.http.scaladsl.testkit.ScalatestRouteTest
import akka.stream.scaladsl.Flow
import org.scalatest._


class ServiceSpec extends FlatSpec with Matchers with ScalatestRouteTest with Service {
  override def testConfigSource = "akka.loglevel = WARNING"
  override def config = testConfig
  override val logger = NoLogging

  "Service" should "respond to the root path" in {
    Get(s"/") ~> routes ~> check {
      status shouldBe OK
      contentType shouldBe `text/plain(UTF-8)`
      responseAs[String] shouldBe "Hello World!"
    }
  }

  "/hi" should "respond when no name is passed in" in {
    Get(s"/hi") ~> routes ~> check {
      status shouldBe OK
      contentType shouldBe `text/plain(UTF-8)`
      responseAs[String] shouldBe "Hello unnamed"
    }
  }

  "/hi" should "respond when a name is passed in" in {
    Get(s"/hi?name=testing") ~> routes ~> check {
      status shouldBe OK
      contentType shouldBe `text/plain(UTF-8)`
      responseAs[String] shouldBe "Hello testing"
    }
  }
}