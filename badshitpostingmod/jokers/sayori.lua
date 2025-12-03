
SMODS.Joker{ --sayori
    key = "sayori",
    config = {
        extra = {
            mult = 0,
            chips0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'sayori',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips',
            [2] = 'Gets {C:red}+15{} Multi for each hanged man used',
            [3] = '{C:inactive}(Currently {C:red}+#1#{}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 10,
                extra = {
                    mult = card.ability.extra.mult
                }
            }
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_hanged_man' then
                return {
                    func = function()
                        card.ability.extra.mult = (card.ability.extra.mult) + 15
                        return true
                    end
                }
            end
        end
    end
}