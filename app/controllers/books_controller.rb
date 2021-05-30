class BooksController < ApplicationController
  def index
    @books = if query.present?
               Book.search(query).records
             else
               Book.all
             end
  end

  private

  def query
    @query ||= params[:query]
  end
end
