require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'user1', email: 'user1@mail.com', password: 'password')
  end
  before { subject.save }

  it 'name should be valid' do
    subject.name = 'user'
    expect(subject).to be_valid
  end

  it "email shouldn't be empty" do
    subject.email = ''
    expect(subject).to_not be_valid
  end
end
