# frozen_string_literal: true

require 'rails_helper'
require 'views_helper'

RSpec.describe('education_infos/new', type: :view) do
  before do
    assign(:education_info, EducationInfo.new(
                              Semester: 'Spring',
                              Grad_Year: 2024,
                              university_id: create_university.id,
                              user_id: create_user.id,
                              Degree_Type: 'Bachelors'
                            )
    )
  end

  it 'renders new education_info form' do
    render

    assert_select 'form[action=?][method=?]', education_infos_path, 'post' do
      assert_select 'input[name=?]', 'education_info[Semester]'

      assert_select 'input[name=?]', 'education_info[Grad_Year]'

      assert_select 'select[name=?]', 'education_info[university_id]'

      assert_select 'input[name=?]', 'education_info[Degree_Type]'
    end
  end
end
