
SMODS.Enhancement {
    key = 'bonuscard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            repetitions = 1,
            chips0 = 64
        }
    },
    loc_txt = {
        name = 'Mario Kard ',
        text = {
            [1] = '{C:blue}+128{} Chips'
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
        if context.main_scoring and context.cardarea == G.play then
            for i = 1, 1 do
                SMODS.calculate_effect({chips = 64}, card)
            end
        end
    end
}