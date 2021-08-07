class User
    attr_reader :id, :username, :password

    def initialize(id, username, password)
        @id = id
        @username = username
        @password = password
    end

    def valid?
        return false if @id.nil?
        return false if @username.nil?
        return false if @password.nil?
        true
    end
end