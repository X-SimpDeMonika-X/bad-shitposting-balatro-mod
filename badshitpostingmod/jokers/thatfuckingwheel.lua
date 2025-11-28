
SMODS.Joker{ --That fucking wheel
    key = "thatfuckingwheel",
    config = {
        extra = {
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'That fucking wheel',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X2{} Mult every',
            [2] = 'time a {C:attention} the wheel of fortune{} triggers',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.undefined
            }
        end
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_wheel_of_fortune' and (G.GAME.pool_flags.badshit_custom_flag or false)) then
                return {
                    func = function()
                        card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 2
                        return true
                    end
                }
            end
        end
    end
}