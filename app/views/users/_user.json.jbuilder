json.extract! user, :id, :First_Name, :Last_Name, :Middle_Name, :Profile_picture, :Email, :Phone_Number, :Current_Job, :Location, :Linkedin_Profile, :is_Admin, :created_at, :updated_at
json.url user_url(user, format: :json)
