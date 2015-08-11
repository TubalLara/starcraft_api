class PlayersController < ApplicationController
	def show
		matches_won = Match.where(winner_id: params[:id])
		matches_lost = Match.where(loser_id: params[:id])
		percent_wins = (100 / (matches_won.count + matches_lost.count)) * matches_won.count
		percent_loses = (100 / (matches_won.count + matches_lost.count)) * matches_lost.count
		percent ={:win_percent => percent_wins, :lose_percent => percent_loses}
		faction_zerg_wins = (matches_won.where(winner_faction: 'zerg')).count
		faction_protoss_wins = (matches_won.where(winner_faction: 'protoss')).count
		faction_terran_wins = (matches_won.where(winner_faction: 'terran')).count
		faction_zerg_loses = (matches_won.where(loser_faction: 'zerg')).count
		faction_protoss_loses = (matches_won.where(loser_faction: 'protoss')).count
		faction_terran_loses = (matches_won.where(loser_faction: 'terran')).count
		percent_zerg_wins = (100 / (faction_zerg_wins + faction_zerg_loses)) * faction_zerg_wins
		percent_zerg_loses = (100 / (faction_zerg_wins + faction_zerg_loses)) * faction_zerg_loses
		percent_zerg ={:win_zerg => percent_zerg_wins, :lose_zerg => percent_zerg_loses}
		percent_factions = {:zerg => percent_zerg}

		


		win_lose = {:wins => matches_won,:lost=> matches_lost, :percentage => percent, :percentage_factions => percent_factions}		
		render json: win_lose, status: 201
	end
end
