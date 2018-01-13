import unittest

from watercatching import caughtCount

class MyTest(unittest.TestCase):
    def _run_it(self, test_values, expected):
        self.assertEquals(expected, caughtCount(test_values))

    def test_empty(self):
        self._run_it([], 0)

    def test_flat(self):
        self._run_it([1], 0)
        self._run_it([1, 1, 1], 0)
    
    def test_sloper(self):
        self._run_it([0,1,2], 0)
        self._run_it([2,1,0], 0)
        self._run_it([1,2,1], 0)

    def test_U_shape(self):
        self._run_it([1, 0, 1], 1)
        self._run_it([2, 0, 1], 1)
        self._run_it([1, 0, 2], 1)
        self._run_it([1, 0, 0, 0, 0, 1], 4)
        self._run_it([2, 0, 1, 0, 2], 5)

    def test_W_shape(self):
        self._run_it([1, 0, 1, 0, 1], 2)
        self._run_it([1, 0, 2, 0, 1], 2)
        self._run_it([2, 0, 2, 0, 1], 3)
        self._run_it([1, 0, 2, 0, 2], 3)
    
    def test_M_shape(self):
        self._run_it([0, 2, 1, 2, 0], 1)

if __name__ == '__main__':
  unittest.main()
