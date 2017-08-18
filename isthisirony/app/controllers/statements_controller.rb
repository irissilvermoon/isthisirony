class StatementsController < ApplicationController
  def index
   @statements = Statement.all 
  end

  def create
    @statement = Statement.create(statement_params)

    head 201
  end

  def show
    @statement = Statement.find_by(params[:statement_id])

    render json: @statement
  end

  private

  def statement_params
    params.require(:statement).permit(:body)
  end

  def find_statement
    @statement = Statements.find(params[:id])  
  end
end
