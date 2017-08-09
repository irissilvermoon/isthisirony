require 'rails_helper'
require 'support/factories/statement_factory.rb'

RSpec.describe StatementsController, type: :controller do
  let!(:statement) { FactoryGirl.create(:statement) }


  describe "#new" do
    it 'successfully renders new' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "#index" do
    it "should succeed" do
      get :index
      expect(response).to be_success
    end

    it "should return a list of statements" do
      #pending
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
    it 'should return a statement' do
      get :show, :id => statement.id
      expect(response).to render_template("show")
    end
  end
end
