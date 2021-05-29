class Book < ApplicationRecord
  include BookSearch::Engine
  validates :isbn, presence: true
end
