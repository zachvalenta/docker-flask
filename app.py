from flask import Flask

app = Flask(__name__)

@app.route('/healthcheck')
def index():
    return "app running", 200
