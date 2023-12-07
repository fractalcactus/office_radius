# frozen_string_literal: true

require_relative "../services/process_staff"
class StaffController < ApplicationController
  def index
  end

  def within_radius
    @max = params[:max].to_f || 500.0
    @staff = ProcessStaff.process(@max, "/Users/gabrielleyoung/Documents/office_radius/app/services/staff_list.json")
  end
end
