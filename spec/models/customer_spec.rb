require 'rails_helper'

describe Customer, type: :model do
  describe 'instance methods' do
    describe '#name' do
      it 'returns true when the name is Mia' do
        task = Customer.create!(id: 1, first_name: 'Mia', last_name: 'Anderson', in_usa: true, created_at: nil, updated_at: nil)

        expect(task.name?).to be(true)
      end
    end
  end
end