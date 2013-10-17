# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  action     :string(50)       not null
#  subject    :string(50)       not null
#  desc       :string(50)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_name :string(255)
#

class Event < ActiveRecord::Base
  has_many :permission_events , :dependent => :destroy
  has_many :permissions  , :through => :permission_events

  attr_accessible :action, :subject , :desc , :model_name
end
