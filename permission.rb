# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  validates :name,:presence => true, :allow_blank => false
  validates :category,:presence => true, :allow_blank => false

  attr_accessible  :name , :category,:permission_events_attributes
  has_many :role_permissions , :dependent => :destroy
  has_many :roles  , :through => :role_permissions

  has_many :permission_events , :dependent => :destroy
  has_many :events  , :through => :permission_events

  BASE_CATEGORY = { "网站信息管理类" => "site_manager" , "其他信息管理" => "other_manager" }

  accepts_nested_attributes_for :permission_events , :allow_destroy => true

end
