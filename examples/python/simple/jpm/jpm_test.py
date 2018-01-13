import unittest
import jpm

class MyTest(unittest.TestCase):
  def test_basic(self):
    self.assertEquals(1, jpm.getIt())


if __name__ == '__main__':
  unittest.main()
