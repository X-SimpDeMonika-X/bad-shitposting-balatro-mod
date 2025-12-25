
SMODS.Enhancement {
    key = 'invisiblecard',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            xchips0 = 2.5,
            xmult0 = 2.5,
            odds = 3
        }
    },
    loc_txt = {
        name = 'invisible card',
        text = {
            [1] = '{X:tarot,C:white}x2.5{} Chips and Mult',
            [2] = '{C:green}1 en 3{} chance to destroy always score'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 0.5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            return {
                x_chips = 2.5,
                extra = {
                    Xmult = 2.5
                }
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_7c5215ff', 1, card.ability.extra.odds, 'j_badshit_invisiblecard', false) then
                        context.other_card.should_destroy = true
                        card.should_destroy = true
                        
                    end
                    return true
                end
            }
        end
    end
}