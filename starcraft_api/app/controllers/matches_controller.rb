class MatchesController < ApplicationController
	def index
		player_params = 
		matches = Match.where(winner_id: params[:id])
		#matches = Player.joins('INNER JOIN matches ON players.id = matches.winner_id')
		#matches = Match.joins('INNER JOIN players ON players.id = matches.winner_id')
		render json: matches, status: 201
	end
end
