class StatementsController < ApplicationController

  def index
   @statements = Statement.all 
  end

  def create
    @statement = Statement.create(statement_params)
  end

  def show
    
  end

  private

  def statement_params
    params.require(:statement).permit(:statement)
  end

  def find_statement
    @statement = Statements.find(params[:id])  
  end
end
