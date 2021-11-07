class Comment < ApplicationRecord
    belongs_to :Log, optional: true
end
