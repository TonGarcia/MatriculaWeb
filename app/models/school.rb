class School < ApplicationRecord
  belongs_to :user
  has_many :users
  attr_accessor :coord

  def coordinator
    return self.coord if self.coord
    _coordinator = self.users.where(role: Role.where(name: :coordinator)).take
    self.coord = _coordinator
    if _coordinator.nil?
      u = User.new
      u.full_name = 'sem coordenador'
      self.coord = u
    else
      self.coord = _coordinator
    end

    self.coord
  end
end
