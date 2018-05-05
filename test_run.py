import unittest
import web_app

class HelloWorldTestCase(unittest.TestCase):

    def test_one(self):
        self.app = web_app.app.test_client()
        rv = self.app.get('/')
        #print(rv.data)
        assert(b'Hello World!' in rv.get_data())
        #self.failUnless(b'Hello World!' in rv.data)

def main():
    unittest.main()

if __name__ == '__main__':
    main()

