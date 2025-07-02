--[[local taxman = {
	key = "taxman",
	name = "wrt-Taxman",
		
	unlocked = true,
	discovered = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
		
	atlas = "joke_one",
	config = {extra = {money = 9, Xmult = 3}},
	gameset_config = {
		modest = { extra = {money = 7, Xmult = 2}},
	},
	
	pos = {x = 2, y = 1},
	rarity = 3,
	cost = 10,
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.money, card.ability.extra.Xmult}}
	end,
	
	in_pool = function(self)
		if G.GAME.stake >= 8 then
			return true
		else
			return false
		end
	end
}]]

local watercooler = {
	key = "watercooler",
	name = "wrt-Watercooler",
		
	unlocked = false,
	discovered = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
		
	atlas = "joke_one",
	config = {extra = {Xmult = 13}},
	
	soul_pos = {x = 4, y = 1},
	pos = {x = 3, y = 1},
	rarity = 4,
	cost = 26,
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.Xmult}}
	end,
	
	calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
				colour = G.C.RED,
				x_mult = card.ability.extra.Xmult
			}
		end
		
        if context.forcetrigger then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
				colour = G.C.RED,
				x_mult = card.ability.extra.Xmult
			}
		end
	end
}

return {
	name = "Misc. Jokers",
	items = {
		--taxman,
		watercooler
	},
}