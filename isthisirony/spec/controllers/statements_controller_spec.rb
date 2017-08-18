require 'rails_helper'
require 'support/factories/statement_factory.rb'

RSpec.describe StatementsController, type: :controller do

  force_json!

  let!(:statement) { FactoryGirl.create(:statement) }

  describe "#index" do
    it "should succeed" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "should create a statement" do
      expect { 
        post :create, :params => { :statement => { :body => "is this statement irony?" } }
      }.to change {
        Statement.count
      }.by(1)
    end
  end

  describe "#show" do
    it "should succeed" do
      get :show, :params => { id: statement.id }
      expect(response.status).to eq(200)
    end  

    it "should return a statement" do
      get :show, :params => { id: statement.id }

      json_response = JSON.parse(response.body)

      expect(json_response["body"]).to eq("its like rain when you're already late.")
    end
  end
end
