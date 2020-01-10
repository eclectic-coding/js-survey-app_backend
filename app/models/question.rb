class Question < ApplicationRecord
  belongs_to :survey, optional: true

end
