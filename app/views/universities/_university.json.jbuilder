# frozen_string_literal: true

json.extract!(university, :id, :created_at, :updated_at)
json.url(university_url(university, format: :json))
