require './db/mysql_connector.rb'

class Order
    attr_accessor :reference_no, :customer_name, :date, :items

    def initialize(param)
        @reference_no = param[:reference_no]
        @customer_name = param[:category_name]
        @date = param[:date]
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("INSERT INTO orders(reference_no, customer_name, date) values('#{reference_no}', '#{customer_name}', '#{date}')")
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false id @date.nil?
        true
    end
    
end