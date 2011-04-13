class Dream < ActiveRecord::Base
      validates_presence_of :dream
      validates_length_of :dream, :maximum => 500


  DREAM_TYPES = [
          #  Displayed    stored in db
	[ "Nightmare", "nightmare" ],
	[ "Adventure", "adventure" ],
	[ "Embarrassing", "embarrassing" ],
	[ "Flying", "flying" ],
	[ "Erotic", "erotic" ]
  ]

      validates_inclusion_of :category, :in => 
                DREAM_TYPES.map {|disp, value| value}


end
