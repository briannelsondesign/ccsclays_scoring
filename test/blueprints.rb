require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Sport.blueprint do
  name { "Sporting Clays" }
end

League.blueprint do
  name { "The Dominators" }
  sport
end
