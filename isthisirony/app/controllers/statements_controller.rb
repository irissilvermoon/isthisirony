class StatementsController < ApplicationController

  def index
    @statements = Statement.all 
  end

  def new 
    @statement = Statement.build
  end

  def show
    
  end
end
