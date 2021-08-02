require_relative '../../models/item'
require_relative '../../db/db_connector'

describe Item do
    describe '#valid?' do
      context 'with all atribites' do
            it 'should return true' do
                item = Item.new('id', 'name', 'price', 'category')
                expect(item.valid?).to eq(true)
            end
        end

        context 'with no price ' do
            it 'should return false with nil price' do
                item = Item.new('id', 'name', nil, 'category')
                expect(item.valid?).to eq(false)
            end
        end

        context 'with no name ' do
            it 'should return false with nil price' do
                item = Item.new('id', nil, 'price', 'category')
                expect(item.valid?).to eq(false)
            end
        end

        context 'with no category ' do
            it 'should return false with nil price' do
                item = Item.new('id', 'name', 'price', nil)
                expect(item.valid?).to eq(false)
            end
        end
    end

    describe '#save' do
        context 'valid input' do
            it 'should save data to db' do
                item = Item.new('id', 'name', 'price', 'category')
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO items(name, price) VALUES ('#{item.name}', #{item.price})")
                item.save
            end
        end
    end

    describe '#create_new_item(name, price, category_id)' do
        context 'with valid input' do
            it 'should save data to db and return true' do
                item = Item.create_new_item('name', 'price', 1)
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO items(name, price) VALUES('#{item.name}', #{item.price})")
                # expect(mock_client).to be_truthy
            end
        end
    end
end