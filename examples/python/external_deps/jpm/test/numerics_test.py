import unittest
from jpm import numerics
 
class MyTest(unittest.TestCase):
  def test_basic(self):
    self.assertEquals(50, numerics.compute_something())

if __name__ == '__main__':
  unittest.main()
