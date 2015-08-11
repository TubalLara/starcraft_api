class PlayersController < ApplicationController
	def show
		matches_won = Match.where(winner_id: params[:id])
		matches_lost = Match.where(loser_id: params[:id])
		percent_wins = (100 / (matches_won.count + matches_lost.count)) * matches_won.count
		percent_loses = (100 / (matches_won.count + matches_lost.count)) * matches_lost.count
		percent ={:win_percent => percent_wins, :lose_percent => percent_loses}
		win_lose = {:wins => matches_won,:lost=> matches_lost, :percentage => percent}		
		render json: win_lose, status: 201
	end
end
