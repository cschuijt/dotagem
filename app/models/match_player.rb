class MatchPlayer
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :player_slot
  attribute :account_id
  attribute :kills
  attribute :deaths
  attribute :assists
  attribute :item_0
  attribute :item_1
  attribute :item_2
  attribute :item_3
  attribute :item_4
  attribute :item_5
  attribute :item_neutral
  attribute :backpack_0
  attribute :backpack_1
  attribute :backpack_2
  attribute :hero_damage
  attribute :hero_healing
  attribute :creeps_stacked
  attribute :denies
  attribute :gold
  attribute :gold_per_min
  attribute :hero_id
  attribute :level
  attribute :leaver_status
  attribute :permanent_buffs
  attribute :tower_damage
  attribute :xp_per_min

  def self.from_data(data)
    player = MatchPlayer.new
    player.attributes.each_pair do |k, _|
      player.send("#{k}=", data[k])
    end
    player
  end

  def gpm
    gold_per_min
  end

  def xpm
    xp_per_min
  end

  def is_radiant?
    player_slot < 128
  end

  def known?
    User.find_by(steam_id3: self.account_id).exists?
  end

  def persisted?
    false
  end
end
