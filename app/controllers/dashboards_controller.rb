# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    set_current_user(false)
    set_todo
  end

  private

  def set_todo
    @todo_list = []

    if @current_user.blank?
      @todo_list.append(['Finish creating your account ->', new_user_path])
      return
    end

    @todo_list.append(['Fill out your education information ->', new_education_info_path]) if @current_user.education_infos.empty?
  end
end
