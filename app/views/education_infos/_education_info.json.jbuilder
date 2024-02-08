json.extract! education_info, :id, :semester, :grad_year, :university, :degree_type, :created_at, :updated_at
json.url education_info_url(education_info, format: :json)
