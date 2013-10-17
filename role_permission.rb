# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: role_permissions
#
#  id            :integer          not null, primary key
#  role_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RolePermission < ActiveRecord::Base
  belongs_to :role
  belongs_to :permission
  attr_accessible :role, :permission , :role_id , :permission_id
end
