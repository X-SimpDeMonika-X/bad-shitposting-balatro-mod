
SMODS.Consumable {
    key = 'themegahermit',
    set = 'omega_consumebles',
    pos = { x = 8, y = 2 },
    config = { 
        extra = {
            currentmoney = 0   
        } 
    },
    loc_txt = {
        name = 'The mega hermit',
        text = {
            [1] = '{X:edition,C:red}^2${}',
            [2] = '{C:inactive}This reminds me of something...{}'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars * G.GAME.dollars
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(G.GAME.dollars).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}