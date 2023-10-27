# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(username: "admin", password: "123412341234", email: "admin@admin.admin", address: "adminstreet", telnr: "12344321", role: :admin)

Package.create(sender: "sender1", recipient: "recipient1", content: "content1", weight: "weight1", destination: "destination1")