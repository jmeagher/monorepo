import unittest
from jpm import jpmlib

class MyTest(unittest.TestCase):
  def test_basic(self):
    self.assertEquals(1, jpmlib.getIt())

if __name__ == '__main__':
  unittest.main()
