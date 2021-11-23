require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'student validation' do
    it 'should not create an student' do
      expect(Student.create(username: 'myname')).to_not be_valid
    end

    describe 'student validation' do
      it 'should create a new student' do
        expect(Student.create(username: 'myname2', password: 'mypassword2')).to be_valid
      end
    end
  end
end
