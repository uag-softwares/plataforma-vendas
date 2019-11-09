class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Produto, Comentario]
    if user.present?
      can :manage, Comentario, usuario_id: user.id
      can :manage, [Item, Pedido]
      if user.admin?
        can :manage, :all
      end
    end
  end
end
