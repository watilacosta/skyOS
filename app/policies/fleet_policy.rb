# frozen_string_literal: true

class FleetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.can?(Fleet, :read)
  end

  def create?
    @user.can?(Fleet, :create)
  end

  def destroy?
    @user.can?(Fleet, :destroy)
  end

  def update?
    @user.can?(Fleet, :update)
  end

  def permitted_attributes
    if @user.can?(Fleet, :create) || @user.can?(Fleet, :update)
      [
        :image, :airline_id, :icao, :name, :short_name, :description,
        :remove_image, repaints_attributes: %i[id _destroy name file]
      ]
    else
      []
    end
  end
end
