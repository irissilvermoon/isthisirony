require 'rails_helper'
require 'support/factories/statement_factory.rb'

RSpec.describe StatementsController, type: :controller do
  let!(:statement) { FactoryGirl.create(:statement) }


  describe "#new" do
  end

  describe "#index" do
    it "should succeed" do
      get :index
      response.should be_success
    end
  end

  describe "#create" do
    it "should create a statement" do
      expect { 
        post :create, :params => { :statement => { :statement => "is this statement irony?" } }
      }.to change {
        Statement.count
      }.by(1)
    end
  end

  describe "#show" do

  end
end
