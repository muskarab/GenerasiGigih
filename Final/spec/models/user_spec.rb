require_relative '../../models/user'

describe User do
    describe "#valid?" do
        context "with all atributes" do
            it "should return true" do
                user = User.new('id', 'username', 'password')
                expect(user.valid?).to eq(true)
            end
        end
    end
end