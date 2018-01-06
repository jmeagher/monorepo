package jpm

// Minimal thing to make sure the maven dependency setup is working
import com.twitter.finatra.http.HttpServer
import com.twitter.finatra.http.routing.HttpRouter

object Jpm extends App {
  def getNumber() = System.currentTimeMillis()
  println(s"This is from the JPM app with scala version ${util.Properties.versionString}. The number is ${getNumber()}")
}
