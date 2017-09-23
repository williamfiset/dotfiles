#!/usr/local/bin/pypy
# -*- coding: utf-8 -*-

''' Known to work phi method '''
def isprime(n):
  if n < 2: return False
  elif n in (2, 3): return True
  elif n % 2 == 0 or n % 3 == 0: return False
  root = int(n**0.5)+1
  for f in xrange( 5, root, 6):
    if n % f == 0 or n % (f+2) == 0:
      return False
  return True

# Returns the factors of a given number, unsorted.
def getDistinctPrimeFactors(n):
	l = []
	for f in xrange(2, int(n**0.5)+1):
		if n % f == 0:
			c = n / f
			if c is not f:
				if isprime(f): l.append(f)
				if isprime(c): l.append(c)
			else:
				if isprime(f): l.append(f)
	return list(set(l))

def phi_original(n):
	if isprime(n): return n-1
	phi = n
	for p in getDistinctPrimeFactors(n):
		phi -= (phi/p)
	return phi


from Queue import Queue
import random
def gcd ( a , b ):
    while b != 0: a, b = b, a % b
    return a
def rabin_miller(p):
    if(p<2): return False
    if(p!=2 and p%2==0): return False
    s=p-1
    while(s%2==0): s>>=1
    for _ in xrange(10):
        a=random.randrange(p-1)+1
        temp=s
        mod=pow(a,temp,p)
        while(temp!=p-1 and mod!=1 and mod!=p-1):
            mod=(mod*mod)%p
            temp=temp*2
        if(mod!=p-1 and temp%2==0): return False
    return True

def pollard_rho(n):
    if(n%2==0): return 2;
    x=random.randrange(2,1000000)
    c=random.randrange(2,1000000)
    y=x
    d=1
    while(d==1):
        x=(x*x+c)%n
        y=(y*y+c)%n
        y=(y*y+c)%n
        d=gcd(x-y,n)
        if(d==n): break;
    return d;

''' Tested up to 23000000 '''
def primeFactorization(n):
	if n <= 0: raise ValueError("Fucked up input, n <= 0")
	elif n == 1: return []
	queue = Queue()
	factors=[]
	queue.put(n)
	while(not queue.empty()):
		l=queue.get()
		if(isprime(l)):
			factors.append(l)
			continue
		d=pollard_rho(l)
		if(d==l):queue.put(l)
		else:
			queue.put(d)
			queue.put(l/d)
	return factors

def phi_new(n):

	if rabin_miller(n): return n-1
	phi = n
	for p in set(primeFactorization(n)):
		phi -= (phi/p)
	return phi


x = 1
while True:

	if phi_original(x) != phi_new(x):
		print "Broke at:", x
		break

	if x % 50000 == 0: print x
	x += 1

















