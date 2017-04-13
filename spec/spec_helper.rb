require 'serverspec'
require 'net/ssh'
require 'pathname'
require 'yaml'
require 'net/ssh/proxy/command'

set :backend, :ssh

# Required as in this case we are not running as root
set :disable_sudo, true

host = ENV['TARGET_HOST']
options = Net::SSH::Config.for(host)

# Add the shared test suits
base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))
Dir[base_spec_dir.join('shared/**/*.rb')].sort.each{ |f| require f }
# Load in properties file
properties = YAML.load_file(base_spec_dir.join('../properties.yml'))

set :host,        options[:host_name] || host
set :ssh_options, options

options[:user] = properties[host]['user']
options[:password] = properties[host]['password']
if properties[host]['gateway']
  gateway = properties[host]['gateway']
  gateway_user = properties[gateway]['gateway_user']
  proxy = Net::SSH::Proxy::Command.new("ssh #{gateway_user}@#{gateway} nc %h %p")
  options[:proxy] = proxy
  options[:forward_agent]
end
