
SMODS.Enhancement {
    key = 'goldcard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars0 = 9
        }
    },
    loc_txt = {
        name = 'Cooler Gold Card',
        text = {
            [1] = '{C:money}$9{} if this card is held in hand',
            [2] = 'at end of round'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1.5,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 9
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(9), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}