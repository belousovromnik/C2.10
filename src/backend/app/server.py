import time

import bottle
from bottle import route, run, template, static_file, error, Bottle, response
import os

abs_app_dir_path = os.path.dirname(os.path.realpath(__file__))
abs_views_path = os.path.join(abs_app_dir_path, 'views')
bottle.TEMPLATE_PATH.insert(0, abs_views_path)


def create_app():
    app = Bottle()
    app.config.load_config('sse_server.conf')

    app.config.setdefault('server', 'paste')
    app.config.setdefault('host', 'localhost')
    app.config.setdefault('port', 8090)

    return app


app = create_app()


@app.route('/')
@app.route('/index')
@app.route('/index/')
@app.route('/home')
@app.route('/home/')
def home():
    return template('index')


@app.route('/stat/')
@app.route('/stat')
def stat():
    return template('stat')


@app.route('/words')
def word_spammer():
    content_type = "text/event-stream"
    cache_control = "no-cache"
    response.headers['Access-Control-Allow-Origin'] = '*'

    words = ['one', 'two', 'three', 'four', 'five', 'six', 'seven']
    for word in words:
        yield 'data: %s\n\n' % word
        time.sleep(2)


if __name__ == "__main__":
    run(
        app=app,
        server='cherrypy'
    )
