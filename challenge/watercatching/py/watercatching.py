

def caughtCount(values):
    """Returns the count of squares that would be filled by water falling from above.
       Pass in an array of ints and the count will be returned.
    """
    
    # There's no where for the water to be caught, it'll spill off the sides
    if len(values) < 3:
        return 0

    non_endpoint_max = max(values[1:-1])

    # If nothing in the middle is higher than the endpoints
    # then this is a simple scan and count case
    if non_endpoint_max <= values[0] and non_endpoint_max <= values[-1]:
        return _simple_count(values)

    # Find the max in the middle and split on it. Process each side separately
    pivot = values.index(non_endpoint_max, 1)
    return caughtCount(values[0:pivot+1]) + caughtCount(values[pivot:])


def _simple_count(values):
    """This only works for a U shaped array where nothing is higher than either endpoint"""
    fill_to = min([values[0], values[-1]])
    return sum([fill_to - v for v in values[1:-1]])
    
