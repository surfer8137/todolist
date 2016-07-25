require 'environments'
require 'flyml'

config = Flyml.config(root: File.join(File.dirname(__FILE__), env: Flyml.env = 'development')

development:
  host: dev.local
  port: 6379

test:
  host: test.local
  port: 6379

 
