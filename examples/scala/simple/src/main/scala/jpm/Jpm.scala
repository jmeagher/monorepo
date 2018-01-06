package jpm

object Jpm extends App {
  def getNumber() = System.currentTimeMillis()
  println(s"This is from the JPM app with scala version ${util.Properties.versionString}. The number is ${getNumber()}")
}
