# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
      return unless user.present? 
      if user.admin?
        can :manage, :all
      else
        #can :create, Order
        #can :read, Order do |order, token|
        #  order.user == user || order.token && token == order.token
        #end
        #can :update, Order do |order, token|
        #  order.user == user || order.token && token == order.token
        #end
        unless user.roles.blank?
          events = Event.joins{permissions.roles.administrators}.where{{administrators.id => user.id}}.select("action,subject")
          for e in events
            begin
              actions = e.action.split(',').map(&:to_sym)
              actions.each do |action|
                subject = begin
                            e.subject.camelize.constantize
                          rescue
                            e.subject.underscore.to_sym
                          end
                can action, subject
              end
            rescue => e
              Rails.logger.info "#{e.action}"
              Rails.logger.info "#{e.subject}"
            end
          end
        end

      end
    end
end
