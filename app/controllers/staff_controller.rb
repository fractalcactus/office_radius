# frozen_string_literal: true

require_relative '../services/process_staff'
class StaffController < ApplicationController
  def index
    # TODO: add filtering, where you add the params grabbed:
    # max distance
    # A -> Z or Z -> A
    @value = params[:value] || 500
    @staff = ProcessStaff.process('/Users/gabrielleyoung/Documents/office_radius/app/services/staff_list.json')
  end

  def within_radius
    @max = params[:max]
  end
end
