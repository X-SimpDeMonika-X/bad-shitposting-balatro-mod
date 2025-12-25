
SMODS.Enhancement {
    key = 'multcard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            xmult0 = 1.9
        }
    },
    loc_txt = {
        name = 'Homosexual Mult Card',
        text = {
            [1] = '{X:red,C:white}X1.9{} Multi'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                Xmult = 1.9
            }
        end
    end
}