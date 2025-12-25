
SMODS.Consumable {
    key = 'blackholeplus',
    set = 'omega_consumebles',
    pos = { x = 5, y = 2 },
    loc_txt = {
        name = 'Black Hole Plus',
        text = {
            [1] = '{C:attention}+5{} levels to ALL hands',
            [2] = '{C:inactive}(creates 5 black holes because I\'m too lazy to code that){}'
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
        for i = 1, 5 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Spectral', key = 'c_black_hole'})                            
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
        
        if created_consumable then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
        end
        return true
    end,
    can_use = function(self, card)
        return true
    end
}