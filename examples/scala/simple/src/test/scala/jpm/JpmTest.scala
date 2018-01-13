package jpm

import org.scalatest._

class JpmTest extends FlatSpec {
  "test" should "not explode" in {
    val start = System.currentTimeMillis()
    assert(start <= Jpm.getNumber())
  }
}