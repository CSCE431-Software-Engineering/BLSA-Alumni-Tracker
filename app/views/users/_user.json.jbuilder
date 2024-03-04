# frozen_string_literal: true

# does this file need to be manually updated?

json.extract!(user, :id, :First_Name, :Last_Name, :Middle_Name, :Profile_Picture, :Email, :Phone_Number, :Current_Job, :firm_type_id, :Location, :Linkedin_Profile,
              :is_Admin, :created_at, :updated_at
)
json.url(user_url(user, format: :json))
