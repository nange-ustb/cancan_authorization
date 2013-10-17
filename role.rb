# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  level      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  attr_accessible :name , :level ,:permission_ids
  has_many :permissions , :through => :role_permissions
  has_many :role_permissions , :dependent => :destroy
  has_many :administrator_roles , :dependent => :destroy
  has_many :administrators  , :through => :administrator_roles

  validates :name , :uniqueness => true ,  :presence => true , :allow_blank => false
  validates :level , :presence => true , :allow_blank => false

  BASE_LEVEL = { "管理员" => "common" ,  "超级管理员" => "superman" }

  scope :search , lambda{|params|
    name_str = params[:name].present? ? params[:name].strip : ""
    where{
      conds = []
      conds << ( name =~ ("%" + name_str +"%") ) if params[:name].present?
      conds.inject{| conds_total , con |  conds_total &= con }
    }
  }
end
