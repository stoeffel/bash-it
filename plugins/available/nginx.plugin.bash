cite about-plugin
about-plugin 'manage your nginx service'

function nginx_reload() {
  about 'reload your nginx config'
  group 'nginx'

  FILE="${BOXEN_PATH}/data/nginx/nginx.pid"
  if [ -e $FILE ]; then
    echo "Reloading NGINX..."
    PID=`cat $BOXEN_PATH/data/nginx/nginx.pid`
    sudo kill -HUP $PID
  else
    echo "Nginx pid file not found"
    return 0
  fi
}

function nginx_stop() {
  about 'stop nginx'
  group 'nginx'

  FILE="${BOXEN_PATH}/data/nginx/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping NGINX..."
    PID=`cat $BOXEN_PATH/data/nginx/nginx.pid`
    sudo kill -INT $PID
  else
    echo "Nginx pid file not found"
    return 0
  fi
}

function nginx_start() {
  about 'start nginx'
  group 'nginx'

  FILE="${BOXEN_PATH}/homebrew/sbin/nginx"
  if [ -e $FILE ]; then
    echo "Starting NGINX..."
    sudo $BOXEN_PATH/homebrew/sbin/nginx
  else
    echo "Couldn't start nginx"
  fi
}

function nginx_restart() {
  about 'restart nginx'
  group 'nginx'

  FILE="${BOXEN_PATH}/data/nginx/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping NGINX..."
    PID=`cat $BOXEN_PATH/data/nginx/nginx.pid`
    sudo kill -INT $PID
    sleep 1
    echo "Starting NGINX..."
    sudo $BOXEN_PATH/homebrew/sbin/nginx
  else
    echo "Nginx pid file not found"
    return 0
  fi
}
