# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    set_current_user(false)
    set_todo
  end

  private

  def set_todo
    @todo_list = Array.new

    if @user.blank?
      @todo_list.append(["Finish creating your account ->", new_user_path])
      return
    end

    if @user.education_infos.length == 0
      @todo_list.append(["Fill out your education information ->", new_education_info_path])
    end

  end

end
