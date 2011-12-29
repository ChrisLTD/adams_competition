class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :letter, DocumentUploader
end
