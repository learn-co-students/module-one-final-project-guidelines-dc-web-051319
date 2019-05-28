require_relative '../lib/api_communicator'
require_relative '../config/environment.rb'
require 'pry'

Card.delete_all
# test = get_trap_cards_from_api
#
get_trap_cards_from_api.each do |trapcard|
  Card.new(name: trapcard["name"], type: trapcard["type"], desc: trapcard["desc"], race: trapcard["race"])
end
# atk: nil, def: nil, level: nil, archetype: nil a
binding.pry

0
  # create_table "cards", force: :cascade do |t|
  #   t.string  "name"
  #   t.string  "type"
  #   t.text    "desc"
  #   t.integer "atk"
  #   t.integer "def"
  #   t.integer "level"
  #   t.string  "race"
  #   t.string  "attribute"
  #   t.string  "archetype"
  #   t.integer "deck_id"
  # end
