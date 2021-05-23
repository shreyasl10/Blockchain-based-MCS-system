from flask import Flask, request, render_template, redirect, url_for
import json
import time
import random
import string
# Flask constructor
app = Flask(__name__, template_folder="Templates")

# A decorator used to tell the application
# which URL is associated function

result = {}

starttime = 0


@app.route('/')
def client():
    with open("time.json") as test:
        d = json.load(test)
    seconds = time.time()*1000 - d["time"]
    if d["time"] != 0 and seconds < 270000:
        with open("output.json") as test_file:
            data = json.load(test_file)
        return data
    if d["time"] != 0 and (seconds >= 270000 and seconds < 300000):
        return {"message": "NULL"}
    if seconds >= 300000:
        output = ''.join(random.choices(
            string.ascii_uppercase+string.digits, k=10))
        result = {"message": str(output)}
        with open("output.json", "w") as c:
            json.dump(result, c)
        t = time.time()*1000
        start = {"time": t}
        with open("time.json", "w") as c:
            json.dump(start, c)
        return result


if __name__ == '__main__':
    app.run()
