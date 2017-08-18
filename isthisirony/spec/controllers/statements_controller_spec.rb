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
    it 'should render show' do
      get :show, :params => { :id => statement.id }
      expect(response).to render_template("show")
    end
  end
end
