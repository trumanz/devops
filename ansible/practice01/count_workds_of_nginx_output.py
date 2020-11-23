#!/usr/bin/env python
import requests 
from html.parser import HTMLParser


class MLStripper(HTMLParser):
    def __init__(self):
        super().__init__()
        self.reset()
        self.strict = False
        self.convert_charrefs= True
        self.text = StringIO()
    def handle_data(self, d):
        self.text.write(d)
    def get_data(self):
        return self.text.getvalue()

if __name__ == '__main__':
    URL = "127.0.0.1"
    r = requests.get(url = URL) 
    html = r.html()
    s = MLStripper()
    s.feed(html)
    data = s.get_data()
    words = data.split()
    print(sorted(words))
