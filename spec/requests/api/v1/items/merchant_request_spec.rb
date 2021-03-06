require 'rails_helper'

describe 'Items merchant' do
  it 'finds the merchant for an item' do
    merchant = create(:merchant, id: 1)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    returned_merchant = JSON.parse(response.body)

    expect(returned_merchant.class).to eq(Hash)
    expect(returned_merchant["id"]).to eq(merchant.id)
  end
end
