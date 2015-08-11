class MatchesController < ApplicationController
	def index
		 
		matches_wins = Match.where(winner_id: params[:id])
		
		#matches = Player.joins('INNER JOIN matches ON players.id = matches.winner_id')
		#matches = Match.joins('INNER JOIN players ON players.id = matches.winner_id')
		render json: matches, status: 201
	end

	def rank_factions
		factions = Match.where(winner_faction: params[:faction])
		losers = Match.where(loser_faction: params[:faction])
		percent = (100 / (factions.count + losers.count)) * factions.count
		win_lose = {:wins => factions,:lost=> losers, :percentage => percent}
		render json: win_lose, status: 201
	end
end
