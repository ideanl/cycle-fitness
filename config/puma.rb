threads 1,2
workers 9
preload_app!
bind "unix://#{Dir.pwd}/tmp/sockets/puma.socket"
daemonize true
pidfile "#{Dir.pwd}/tmp/pids/puma.pid"
state_path "#{Dir.pwd}/tmp/pids/puma.state"
stdout_redirect "#{Dir.pwd}/log/puma.log", "#{Dir.pwd}/log/puma-error.log", true

on_worker_boot do 
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
