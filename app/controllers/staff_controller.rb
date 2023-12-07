require_relative "../services/process_staff"
class StaffController < ApplicationController
  def index
    # TODO: add filtering, where you add the params grabbed:
    # max distance
    # A -> Z or Z -> A
    @staff = ProcessStaff.process("/Users/gabrielleyoung/Documents/office_radius/app/services/staff_list.json")
  end
end
