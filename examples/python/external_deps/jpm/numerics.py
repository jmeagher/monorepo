import pandas

def compute_something():
  # Do something that's just enough to make sure pandas is really impored and available
  nums = range(1,100)
  sqs  = [n*n for n in nums]
  data = list(zip(nums, sqs))
  df = pandas.DataFrame(data = data, columns = ['num', 'square'])
  return df.num.mean()

