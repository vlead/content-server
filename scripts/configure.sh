#!/bin/bash
echo "server {" > /etc/nginx/sites-enabled/cs
echo "    location / {" >> /etc/nginx/sites-enabled/cs
echo "        proxy_pass http://127.0.0.1:8000;" >> /etc/nginx/sites-enabled/cs
echo "        proxy_set_header Host \$host;" >> /etc/nginx/sites-enabled/cs
echo "        proxy_set_header X-Real-IP \$remote_addr;" >> /etc/nginx/sites-enabled/cs
echo "    }" >> /etc/nginx/sites-enabled/cs
echo "}" >> /etc/nginx/sites-enabled/cs
echo "import sys, os" > /var/www/content-server/wsgi.py
echo "from runtime.rest.app import create_app" >> /var/www/content-server/wsgi.py
echo "from runtime.config import app_config as config" >> /var/www/content-server/wsgi.py
echo "application = create_app(config)" >> /var/www/content-server/wsgi.py
echo "if __name__ == '__main__':" >> /var/www/content-server/wsgi.py
echo "    application.run(host='0.0.0.0')" >> /var/www/content-server/wsgi.py