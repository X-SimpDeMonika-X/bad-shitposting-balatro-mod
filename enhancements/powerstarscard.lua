
SMODS.Enhancement {
    key = 'powerstarscard',
    pos = { x = 8, y = 0 },
    config = {
        extra = {
            CCCCC = 1,
            echips0 = 2
        }
    },
    loc_txt = {
        name = 'Power Stars Card',
        text = {
            [1] = 'When in hand, it increases by {X:chips,C:white}x1.25{} Chips',
            [2] = 'when played, it increases by {X:chips,C:white}x2{} Chips',
            [3] = 'if it reaches {X:chips,C:white}x20{} chips, it gives {X:enhanced,C:white}^2{} Chips',
            [4] = '{C:inactive}(currently{} {X:chips,C:white} X#1#{} {C:inactive}){}'
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
    weight = 0.01,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.CCCCC}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.CCCCC = (card.ability.extra.CCCCC) + 2
            return {
                x_chips = card.ability.extra.CCCCC
            }
        end
        if context.cardarea == G.hand and context.main_scoring then
            return {
                func = function()
                    card.ability.extra.CCCCC = (card.ability.extra.CCCCC) + 1.25
                    return true
                end
            }
        end
        if context.main_scoring and context.cardarea == G.play and to_big((card.ability.extra.CCCCC or 0)) >= to_big(20) then
            return {
                e_chips = 2
            }
        end
    end
}