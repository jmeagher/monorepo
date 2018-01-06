package jpm

// Minimal thing to make sure the maven dependency setup is working
import com.twitter.finagle.http.Request
import com.twitter.finatra.http.HttpServer
import com.twitter.finatra.http.routing.HttpRouter
import com.twitter.server.TwitterServer

object Jpm extends App {
  def getNumber() = System.currentTimeMillis()
  println(s"This is from the JPM app with scala version ${util.Properties.versionString}. The number is ${getNumber()}")
}
