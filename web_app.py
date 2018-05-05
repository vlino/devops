from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

#pip install Flask
#FLASK_APP=web_app.py flask run
