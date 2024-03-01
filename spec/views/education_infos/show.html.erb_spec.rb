# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('education_infos/show', type: :view) do
  before do
    assign(:education_info, EducationInfo.create!(
                              Semester: 'Spring',
                              Grad_Year: 2024,
                              university_id: create_university('Texas A&M').id,
                              user_id: create_user.id,
                              Degree_Type: 'Bachelors'
                            )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Spring/))
    expect(rendered).to(match(/2024/))
    expect(rendered).to(match(/Texas A&amp;M/))
    expect(rendered).to(match(/Bachelors/))
  end
end
