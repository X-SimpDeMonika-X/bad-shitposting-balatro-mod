
SMODS.Enhancement {
    key = 'steelcard',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            xmult0 = 5
        }
    },
    loc_txt = {
        name = 'Titanium Card',
        text = {
            [1] = '{X:red,C:white}X5{} Mult while this card stays in hand'
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
    weight = 5,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                Xmult = 5
            }
        end
    end
}