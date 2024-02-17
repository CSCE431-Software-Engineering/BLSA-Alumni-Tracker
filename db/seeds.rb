# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{practice_area: "Star Wars" }, {practice_area: "Lord of the Rings" }])
#   Character.createpractice_area: "Luke", movie: movies.first)



practice_areas = [
  {practice_area: "Corporate Law" },
  {practice_area: "Criminal Law" },
  {practice_area: "Family Law" },
  {practice_area: "Intellectual Property Law" },
  {practice_area: "Environmental Law" }
]

# Create Practice Areas
practice_areas.each do |area|
  PracticeArea.create!(area)
end
