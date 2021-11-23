require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'description validation' do
    it 'should not create a new clocking without a description' do
      expect(Subject.create(title: 'title', student_id: 1)).to_not be_valid
    end
  end

  describe 'title validation' do
    it 'should not create a new clocking without a title' do
      expect(Subject.create(description: 'description', student_id: 1)).to_not be_valid
    end
  end

  describe 'student_id validation' do
    it 'should not create a new clocking without a student_id' do
      expect(Subject.create(title: 'title', description: 'description')).to_not be_valid
    end
  end
end
