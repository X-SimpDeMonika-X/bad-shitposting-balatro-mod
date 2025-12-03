
SMODS.Joker{ --Jolly Wee Joker 
    key = "jollyweejoker",
    config = {
        extra = {
            jolly = 8
        }
    },
    loc_txt = {
        ['name'] = 'Jolly Wee Joker ',
        ['text'] = {
            [1] = 'add {C:blue}+8{} Mult to this joker if played hand contains a {C:blue}Pair{}',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{}{})'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 0.6, 
        h = 95 * 0.6
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.jolly}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Pair"]) then
                card.ability.extra.jolly = (card.ability.extra.jolly) + 8
                return {
                    message = "jolly up",
                    extra = {
                        mult = card.ability.extra.jolly
                    }
                }
            else
                return {
                    mult = card.ability.extra.jolly
                }
            end
        end
    end
}