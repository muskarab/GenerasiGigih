require_relative '../../models/user'

describe User do
    describe "#valid?" do
        context "with all atributes" do
            it "should return true" do
                user = User.new('id', 'username', 'password')
                expect(user.valid?).to eq(true)
            end
        end

        context "with no username" do
            it "should return false with nil username" do
                user = User.new('id', nil, 'password')
                expect(user.valid?).to eq(false)
            end
        end

        context "with no password" do
            it "should return false with nil pasword" do
                user = User.new('id', 'username', nil)
                expect(user.valid?).to eq(false)
            end
        end
    end
end