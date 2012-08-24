class Organization < ActiveRecord::Base
            attr_accessible :active, :billing_address1, :billing_address2, :billing_city, :billing_country, :billing_state, :billing_street_name, :name, :account_name, :type, :url, :logo, :cloud_identity_attributes, :cloud_app_attributes
  has_attached_file :logo

  has_many :users

  has_one :cloud_identity, :foreign_key  => 'org_id'
  accepts_nested_attributes_for :cloud_identity, :update_only => true

  has_one :cloud_app, :foreign_key  => 'org_id'
  accepts_nested_attributes_for :cloud_app, :update_only => true

  
  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
