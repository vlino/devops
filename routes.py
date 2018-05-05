from web_app import app, cache

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route("/")
def hello_world():
    count = get_hit_count()
    return "<h1 style='color:blue'>Hello World! {} times.\n</h1>".format(count)
