require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
      it {should validate_presence_of :email}
      it {should allow_value("user@example.com").for(:email)}
      it {should_not allow_value("somevalue").for(:email)} 
      it { should validate_uniqueness_of(:email).case_insensitive }

      it { should validate_presence_of :password }
  end

  context "Associations" do
    it { should have_many :posts }
    it { should have_many :likes }
    it { should have_many :comments }
    it { should have_many :images }
  end
  
end





#   context "validations" do

#     should validate_presence_of(:email)
# #    should allow_value("user@example.com").for(:email)
# #   should_not allow_value("not-an-email").for(:email)

#   end

#     #it { should validate_presence_of :password }

#     #it { should validate_uniqueness_of(:email) }

#     # it "User is invalid without an unique email" do
#       # user1 = User.create(email: "same@email.com",
#               # password: "samepasscode")
#       # user2 = User.new(email: "same@email.com",
#               # password: "anything")
#       # expect(user2).to_not be_valid  
#     # end 
    
#     # Associations tests 
#     # rspec matchers
#     # factorybot
#     # betterrspec
#     # let and let! 
    
#   context "Associations" do
#     it { should have_many :posts }
#     it { should have_many :likes }
#     it { should have_many :comments }
#     #it { should have_many }


#   end
