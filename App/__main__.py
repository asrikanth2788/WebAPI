from gevent.pywsgi import WSGIServer
from WebApp.app import app

if __name__ == '__main__':
    http_server = WSGIServer(('0.0.0.0', 8080), app)
    http_server.serve_forever()
