#!/usr/local/bin/pypy
# -*- coding: utf-8 -*-

# def isprime(n):
#     return rabin_miller(n)

import random
from Queue import Queue

# Tested up to 500 million
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


# Known working isprime method
def isprime(n):
  
  if n < 2: return False
  elif n in (2, 3): return True
  elif n % 2 == 0 or n % 3 == 0: return False

  root = int(n**0.5)+1
  
  for f in xrange( 5, root, 6):
    if n % f == 0 or n % (f+2) == 0:
      return False
  
  return True

# Tested n up to 500m
n = 0
while True:
	if rabin_miller(n) != isprime(n):
		print "rabin_miller failed at:", n
		break
	if n % 500000 == 0: print n
	n += 1




