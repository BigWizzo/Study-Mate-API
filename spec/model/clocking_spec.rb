require 'rails_helper'

RSpec.describe Clocking, type: :model do
  describe 'topic validation' do
    it 'should not create a new clocking without a topic' do
      expect(Clocking.create(details: 'details', duration: 2, student_id: 1, subject_id: 1)).to_not be_valid
    end
  end

  describe 'details validation' do
    it 'should not create a new clocking without a details' do
      expect(Clocking.create(topic: 'topic', duration: 2, student_id: 1, subject_id: 1)).to_not be_valid
    end
  end

    describe 'duration validation' do
      it 'should not create a new clocking without a duration' do
        expect(Clocking.create(topic: 'topic', details: 'details', student_id: 1, subject_id: 1)).to_not be_valid
      end
    end

    describe 'student_id validation' do
      it 'should not create a new clocking without a student_id' do
        expect(Clocking.create(topic: 'topic', details: 'details', duration: 2, subject_id: 1)).to_not be_valid
      end
    end
    describe 'subject_id validation' do
      it 'should not create a new clocking without a subject_id' do
        expect(Clocking.create(topic: 'topic', details: 'details', duration: 2, student_id: 1)).to_not be_valid
      end
    end
end
