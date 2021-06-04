class Book < ApplicationRecord
  include BookSearch::Engine
  include Elasticsearch::Model::Callbacks
  validates :isbn, presence: true
end
