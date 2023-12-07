# frozen_string_literal: true

require_relative "../services/process_staff"
class StaffController < ApplicationController
  def index;end;

  def within_radius
    @max = params[:max].to_f || 500.0
    @staff = ProcessStaff.process(@max, Rails.root.join("app","services","staff_list.json").to_s)
  end
end
