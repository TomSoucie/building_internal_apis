require 'rails_helper'
=begin
As API user
When I visit '/api/v1/items'
Then I should receive a 200 response
And the body contain JSON response
And the JSON should be structured
=end

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    raw_items = JSON.parse(response.body)
    raw_item = raw_items.first
    # byebug

    expect(raw_items.count).to eq(3)
    expect(raw_item).to have_key("name")
    expect(raw_item["name"]).to be_a String
    expect(raw_item).to have_key("description")
    expect(raw_item["description"]).to be_a String
    expect(raw_item["description"]).to_not be_a Integer
  end

  it "sends a single item" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/#{item.id}"

    # byebug
    expect(response).to be_success

    raw_item = JSON.parse(response.body)

    expect(raw_item["id"]).to eq(id)
    expect(raw_item).to have_key("name")
    expect(raw_item["name"]).to be_a String
    expect(raw_item).to have_key("description")
    expect(raw_item["description"]).to be_a String
  end
end

context "POST /api/v1/items" do
  it "creates an item with valid params" do
    item_params = {
      name: "Super Mario Bros. 3",  
      description: "The best one"
    }
    expect {
    post "/api/v1/items", params: item_params
    }.to change { Item.count }.by(1)
    expect(response).to be_success
    # expect(response).to have_http_status(201)
  end
end
