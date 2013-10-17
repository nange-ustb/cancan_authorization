# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: administrator_affiliates
#
#  id               :integer          not null, primary key
#  administrator_id :integer
#  affiliate_id     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AdministratorAffiliate < ActiveRecord::Base
  belongs_to :administrator
  belongs_to :affiliate
  # attr_accessible :title, :body
end
