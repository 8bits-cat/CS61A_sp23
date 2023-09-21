def div(n):
    def by_primes(k):
        i = 2
        while i <= n:
            if k % i == 0:
                return True
            i += 1
        return False
    return by_primes
