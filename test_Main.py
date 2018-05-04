import unittest
from Main import HelloWorld

# Here's our "unit".
#class HelloWorld:
#    msg = ""
# 
#    def __init__(self, msg):
#        self.msg = msg
#
#    def helloWorld(self):
#        return "Hello World"
#
#    def sayHelloWorld(self):
#        return "Hello World, my message to you is " + self.msg
#
#    def saidHelloWorld(self, msg):
#        return "Hello World, my message to you is " + msg
#
#hello = HelloWorld("look")
#print hello.helloWorld()
#
# Here's our "unit tests".
class HelloWorldTests(unittest.TestCase):

    def testOne(self):
        # create virtual objects
        hello = HelloWorld("look")
         
        # call methods owned by virtual objects
        self.failUnless(hello.helloWorld() == "Hello World")

def main():
    unittest.main()

if __name__ == '__main__':
    main()
