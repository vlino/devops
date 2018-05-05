from web_app import app

import time
import redis

cache = redis.Redis(host='devops_redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                #raise exc
                exit(1)
            retries -= 1
            #time.sleep(0.5)

@app.route("/")
def hello_world():
    count = get_hit_count()
    return "<h1 style='color:blue'>Hello World! {} times.</h1>\n".format(count)
