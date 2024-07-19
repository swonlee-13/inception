from flask import Flask, render_template, request
import random

app = Flask(__name__)

excuses = [
    "My pet dinosaur ate my homework",
    "I was abducted by aliens... again",
    "I'm on a secret mission to save the world",
    "My invisible friend hid my keys",
    "I'm allergic to Mondays",
    "My coffee hasn't kicked in yet",
    "I'm too busy being awesome",
    "My unicorn needed an emergency horn polishing",
    "I got lost in a time vortex",
    "My robot assistant went rogue",
    "I was busy inventing a new color",
    "My pet rock ran away",
    "I'm recovering from a zombie apocalypse drill",
    "My teleportation device malfunctioned",
    "I was trapped in a Netflix binge-watching loop"
]

@app.route('/', methods=['GET', 'POST'])
def get_excuse():
    if request.method == 'POST':
        custom_excuse = request.form.get('custom_excuse')
        if custom_excuse:
            excuses.append(custom_excuse)
    
    excuse = random.choice(excuses)
    return render_template('excuse.html', excuse=excuse, excuse_count=len(excuses))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9090, debug=True)