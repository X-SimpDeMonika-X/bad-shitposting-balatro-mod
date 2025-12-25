
SMODS.Seal {
    key = 'nineseal',
    pos = { x = 4, y = 0 },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Nine Seal',
        label = 'Nine Seal',
        text = {
            [1] = 'creates a {C:attention}random joker{} when held in hand',
            [2] = '{C:red}self-destructs{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "negative", per = -9, vol = 0.4 },
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Destroyed!", colour = G.C.RED})
            return
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_destroy = false
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            card.should_destroy = true
            return {
                message = "9"
            }
        end
    end
}