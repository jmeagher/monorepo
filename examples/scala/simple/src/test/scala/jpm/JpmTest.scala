package jpm

import org.scalatest._

class JpmTest extends FlatSpec {
  "test" should "not explode" in {
    Jpm.getNumber()
  }
}