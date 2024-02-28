# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

firm_types = [
  {firm_type: "Government"},
  {firm_type: "Solo"},
  {firm_type: "Small"},
  {firm_type: "Medium"},
  {firm_type: "Big Law"},
  {firm_type: "In-house"},
  {firm_type: "N/A"}
]

firm_types.each do |type|
  FirmType.create!(type)
end
