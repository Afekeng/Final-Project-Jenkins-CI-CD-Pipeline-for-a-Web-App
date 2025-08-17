import os
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    message = os.getenv("WELCOME_MESSAGE,", "welcome to my app")
    return render_template("index.html", message=message)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)

