from web_app import app

@app.route("/")
def hello_world():
    return "<h1 style='color:blue'>Hello World!</h1>"
