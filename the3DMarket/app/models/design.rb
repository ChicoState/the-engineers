class Design < ActiveRecord::Base
  belongs_to :user
  belongs_to :license
  has_many   :bookmarks
end
