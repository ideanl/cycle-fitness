# Magic command. bundle exec unicorn_rails -c config/unicorn.rb -D
#
# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/sin"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/sin/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/sin/log/unicorn.log"
stdout_path "/var/www/sin/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.fitness.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30

