import time
import redis

from flask import Flask
app = Flask(__name__)

cache = redis.Redis(host='redis', port=6379)

import routes
