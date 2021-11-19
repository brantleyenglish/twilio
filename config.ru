require 'bundler/setup'
Bundler.require(:default)

require_relative "intercept.rb"

map "/" do
    run MyApp
end
