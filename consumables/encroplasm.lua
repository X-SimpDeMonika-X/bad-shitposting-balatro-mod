
SMODS.Consumable {
    key = 'encroplasm',
    set = 'omega_consumebles',
    pos = { x = 7, y = 2 },
    config = { 
        extra = {
            totaljokerslots = 0   
        } 
    },
    loc_txt = {
        name = 'ENCROPLASM',
        text = {
            [1] = '{C:blue}doubles{} the number of spaces for {C:attention}jokers{}'
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
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(G.jokers and G.jokers.config.card_limit or 0).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + #G.jokers and G.jokers.config.card_limit or 0
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}