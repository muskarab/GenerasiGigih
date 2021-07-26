require_relative './wli'

describe Wli do
    it "contains 0 names will print no one" do
        wli = Wli.new([])
        likes = wli.likes
        expect(likes).to eq("no one likes this")
    end

    it "contains 1 names will print like whit s" do
        wli = Wli.new(['Peter'])
        likes = wli.likes
        expect(likes).to eq("Peter likes this")
    end

    it "contains 2 names will print like without s" do
        wli = Wli.new(['Jacob', 'Alex'])
        likes = wli.likes
        expect(likes).to eq("Jacob and Alex like this")
    end

    it "contains 3 names will print like without s" do
        wli = Wli.new(['Max', 'Jhon', 'Mark'])
        likes = wli.likes
        expect(likes).to eq("Max, Jhon and Mark like this")
    end

    it "contains 4 names will print only 2 names and like without s" do
        wli = Wli.new(['Ucup', 'Asep', 'Ujang', 'Ajeng'])
        likes = wli.likes
        expect(likes).to eq("Ucup, Asep, Ujang and Ajeng like this")
    end
end