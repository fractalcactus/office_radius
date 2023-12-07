# frozen_string_literal: true

require_relative '../services/process_staff'
describe 'ProcessStaff' do
  describe '::process' do
    it 'returns an array of Staff objects ordered by name and filtered by those within the max distance to the office' do
      result = ProcessStaff.process(2.0,'/Users/gabrielleyoung/Documents/office_radius/app/spec/staff_list_spec.json') # TODO: get relative filepath
      expect(result).to eq [
        {
          'id' => 2,
          'name' => 'Anna',
          'role' => 'Human Quality Agent',
          'location' => {
            'latitude' => -41.2920728,
            'longitude' => 174.7748162
          }
        },
        {
          'id' => 1,
          'name' => 'Bob',
          'role' => 'Direct Metrics Facilitator',
          'location' => {
            'latitude' => -41.294,
            'longitude' => 174.77481621
          }
        }
      ]
    end
  end
end
