class Pokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  #TODO: move any db calls and repetitive code from the resepective controllers to the models and make them methods. We love fat models. -jc
  
end
