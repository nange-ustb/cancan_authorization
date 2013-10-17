# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: administrator_roles
#
#  id               :integer          not null, primary key
#  administrator_id :integer
#  role_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AdministratorRole < ActiveRecord::Base
  belongs_to :administrator
  belongs_to :role
  attr_accessible :administrator_id, :role_id
end
