# Nginx

VirtualHostとReverseProxyだけならApacheは要らない。

## INSTALL (Ubuntu)

    sudo aptitude install nginx
    sudo /etc/init.d/nginx start

## INSTALL (Mac)

    sudo port install nginx +dav
    sudo cp /opt/local/etc/nginx/nginx.conf.example /opt/local/etc/nginx/nginx.conf
    sudo cp /opt/local/etc/nginx/mime.types.example /opt/local/etc/nginx/mime.types
    sudo nginx

### /etc/nginx/sites-enabled/7kai.org

    proxy_set_header  X-Real-IP       $remote_addr;
    proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header  Host            $http_host;
    proxy_redirect    off;
    proxy_max_temp_file_size          0;
    
    server {
      listen      80;
      server_name www.7kai.org;
      rewrite ^ http://doc.7kai.org/Move permanent;
    }
    
    server {
      listen      80;
      server_name doc.7kai.org;
      location / { proxy_pass http://localhost:5000; }
    }

    server {
      listen      80;
      server_name blog.7kai.org;
      location / { proxy_pass http://localhost:5001; }
    }
