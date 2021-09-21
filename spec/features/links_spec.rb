require 'rails_helper'

RSpec.describe 'Test navigation links' do
  before :each do
    Student.create(username: 'myname', password: 'mypassword')
  end

  it 'Send student to the all subjects page' do
    visit v1_subjects_path
    expect(current_path).to eql(v1_subjects_path)
  end

  it 'Should not send student to the clockings page' do
    visit v1_subjects_path
    expect(current_path).not_to eql(v1_clockings_path)
  end
end
