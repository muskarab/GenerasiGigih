require_relative '../../controllers/item_controller'
require_relative '../../db/db_connector'

describe ItemController do
    describe '#all_items' do
        context 'show all items' do
            it 'should show all items view' do
                controller = ItemController.new
                actual_view = controller.all_items
        
                items = Item.get_items_categories
                expected_view = ERB.new(File.read('./views/index.erb')).result(binding)
        
                expect(expected_view).to eq(actual_view)
            end
        end
    end

    describe '#create_item_form' do
        context 'show form to create items' do
            it 'should show form to create items' do
                controller = ItemController.new
                actual_view = controller.create_item_form
        
                categories = Category.get_all_categories
                expected_view = ERB.new(File.read('./views/create_item.erb')).result(binding)
        
                expect(expected_view).to eq(actual_view)
            end
        end
    end

    describe '#show_item' do
        context 'when given valid parameters' do
            it 'should show item and render show item page' do
                params = ({
                    'item_id' => '1',
                    'name' => 'name',
                    'price' => 'price',
                    'category_id' => '1'
                })
                controller = ItemController.new
                controller.show_item(params.item_id)
            end
        end
    end

    describe '#create_item' do
        context 'when given valid parameters' do
            it 'should save item and render items page' do
                params = ({
                    'name' => 'name',
                    'price' => 'price',
                    'category_id' => '1'
                })
                controller = ItemController.new
                controller.create_item(params)
            end
        end
    end
end