# app.rb

require "sinatra"

set :bind, "0.0.0.0"

$counter = 0

get "*" do
  $counter += 1
  if $counter > 3
    raise "Whoops, something is wrong.. wonder where this goes"
  end
  
  "[v3] Hello Kubernetes!\n"
end

