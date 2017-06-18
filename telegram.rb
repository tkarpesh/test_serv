require 'telegrammer'
require 'yaml'
require 'rest-client'
require 'active_support/core_ext/object/blank'
require 'pry'

def to_hasz(obj)
  obj.to_hash.select { |_, v| v.present? }
end

config = YAML.load_file('config/secrets.yml')['development']['telegram']

Telegrammer::Bot.new(config['token']).get_updates do |message|
  if message
    message = to_hasz(message)
    [:from, :chat].each { |key| message[key] = to_hasz(message[key]) }

    RestClient.post("http://localhost:3000/#{config['path']}", message: message)
  end
end
