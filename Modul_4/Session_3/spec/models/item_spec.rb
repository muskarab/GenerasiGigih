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

        # context 'with no price ' do
        #     it 'should return false with nil price' do
        #         item = Item.new('id', 'name', nil, 'category')
        #         expect(item.valid?).to eq(false)
        #     end
        # end
    end

    
end