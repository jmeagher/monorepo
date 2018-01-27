// Trivial unit test to make sure the basics are working

/**
 * Simple example of fibonacci since that seems to be what all
 * rust examples use.
 */
pub fn fibonacci(n: i32) -> u64 {
  if n < 2 {
    return n as u64;
  } else {
    return fibonacci(n-1) + fibonacci(n-2)
  }
}

#[cfg(test)]
mod tests {
	use fibonacci;

	#[test]
	fn fib_test() {
		assert_eq!(1, fibonacci(1));
		assert_eq!(1, fibonacci(2));
		assert_eq!(2, fibonacci(3));
		assert_eq!(3, fibonacci(4));
		assert_eq!(5, fibonacci(5));
    let series : Vec<u64> =
      vec![0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144];
    for (i, series) in series.iter().enumerate() {
       assert_eq!(*series, fibonacci(i as i32));
		}
	}

	#[test]
	fn should_pass() {
		assert!(1 == 1);
	}

	#[test]
	#[should_panic]
	fn should_fail() {
		assert!(1 == 0);
	}
}
