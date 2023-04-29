class HomeController < ApplicationController
    def index
      if(current_user)
        current_user.balance = 1000
        current_user.game_wins = 0
        current_user.games_played = 0
        current_user.rounds_played = 0
        current_user.round_wins = 0
        current_user.save
      end
    end
    

  end