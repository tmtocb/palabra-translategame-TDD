# frozen_string_literal: true

class PalabraPolicy
  attr_reader :user, :palabra

  def initialize(user, palabra)
    @user = user
    @palabra = palabra
  end

  def update?
    palabra_belongs_to_user?
  end

  def edit?
    palabra_belongs_to_user?
  end

  def destroy?
    palabra_belongs_to_user?
  end

  private

  def palabra_belongs_to_user?
    user == palabra.user
  end
end
