# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{practice_area: "Star Wars" }, {practice_area: "Lord of the Rings" }])
#   Character.createpractice_area: "Luke", movie: movies.first)



practice_areas = [
    {practice_area: "Dispute Resolution"},
    {practice_area: "Agriculture Law"},
    {practice_area: "Business Law"},
    {practice_area: "Civil Litigation"},
    {practice_area: "Commercial Law"},
    {practice_area: "Criminal Law and Procedure"},
    {practice_area: "Energy Law"},
    {practice_area: "Environmental Law"},
    {practice_area: "Estate Planning"},
    {practice_area: "Family Law"},
    {practice_area: "General Practice"},
    {practice_area: "Health Law"},
    {practice_area: "Immigration Law"},
    {practice_area: "IP and Technology Law"},
    {practice_area: "Oil and Gas Law"},
    {practice_area: "Real Estate Law"},
    {practice_area: "Water Law"},
    {practice_area: "Workplace Law"},
    {practice_area: "N/A"}
]

# Create Practice Areas
practice_areas.each do |area|
  PracticeArea.create!(area)
end

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
