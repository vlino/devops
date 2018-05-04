class HelloWorld:
    msg = ""
 
    def __init__(self, msg):
        self.msg = msg

    def helloWorld(self):
        return "Hello World"

    def sayHelloWorld(self):
        return "Hello World, my message to you is " + self.msg

    def saidHelloWorld(self, msg):
        return "Hello World, my message to you is " + msg

hello = HelloWorld("look")
print hello.helloWorld()