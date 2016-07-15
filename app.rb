require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require("pg")
# require("pry")

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  erb(:index)
end

get("/stylists/new") do
  erb(:stylist_form)
end
#
# post("/stylists") do
#   name = params.fetch("name")
#   stylist = Stylist.new({:name => name, :id => nil})
#   stylist.save()
#   erb(:success)
# end
#
# get('stylists') do
#   @stylists = Stylist.all()
#   erb(:stylists)
# end
#
# get("/stylists/:id") do
#   @stylist = Stylist.find(params.fetch("id")).to_i())
#   erb(:stylist)
# end
