#!/usr/local/bin/pypy
# -*- coding: utf-8 -*-

from Queue import Queue
import random

def gcd ( a , b ):
    while b != 0: a, b = b, a % b
    return a

def isprime(n): return rabin_miller(n)

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

product = lambda x, y: x * y


""" TESTED n UP TO 23000000 """
n = 2

while True:

	# By the fundamental theorem of arithmetic, the product 
	# of all prime factors MUST equal to original number.
	if reduce(product, primeFactorization(n) ) != n:
		print "primeFactors failed @:", n
		break
	if n % 50000 == 0: print n
	n+=1 












