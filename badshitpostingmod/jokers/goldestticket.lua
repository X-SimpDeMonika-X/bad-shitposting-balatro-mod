
SMODS.Joker{ --Goldest Ticket
    key = "goldestticket",
    config = {
        extra = {
            dollars0 = 12
        }
    },
    loc_txt = {
        ['name'] = 'Goldest Ticket',
        ['text'] = {
            [1] = 'Played {C:orange}Cooler Gold{} cards earn {C:money}$12{} when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_badshit_coolergoldcard"] == true then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 12
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(12), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}