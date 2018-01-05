package jpm

import org.scalatest._

class JpmTest extends FlatSpec {
  "getIt" should "not explode" in {
    Jpm.getIt()
  }
}
