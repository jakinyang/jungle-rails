require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "Validates that user has password and password_confirmation fields" do
      expect(User.create(first_name: 'John', last_name: 'Cena', email: 'johncena@wwe.org', password: nil, password_confirmation: nil).valid?).to be false
    end
    it "Validates that user password and password_confirmation fields match" do
      expect(User.create(first_name: 'John', last_name: 'Cena', email: 'johncena@wwe.org', password: '123', password_confirmation: '321').valid?).to be false
    end
    it "Validates that email field is unique" do
      @user1 = User.create(first_name: 'John', last_name: 'Cena', email: 'johncena@wwe.org', password: '123', password_confirmation: '123')
      expect(User.create(first_name: 'Guy', last_name: 'Fierri', email: 'johncena@wwe.org', password: '321', password_confirmation: '321').valid?).to be false
    end
    it "Validates first_name field is present" do
      expect(User.create(first_name: nil, last_name: 'Cena', email: 'johncena@wwe.org', password: '123', password_confirmation: '123').valid?).to be false
    end
    it "Validates last_name field is present" do
      expect(User.create(first_name: "John", last_name: nil, email: 'johncena@wwe.org', password: '123', password_confirmation: '123').valid?).to be false
    end
    it "Validates email field is present" do
      expect(User.create(first_name: 'John', last_name: 'Cena', email: nil, password: '123', password_confirmation: '123').valid?).to be false
    end
    it "Validates password field is at least 8 characters" do
      expect(User.create(first_name: 'John', last_name: 'Cena', email: nil, password: '123', password_confirmation: '123').valid?).to be false
    end
  end
end
