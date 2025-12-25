
SMODS.Enhancement {
    key = 'thegreenpowercard',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'The green power Card',
        text = {
            [1] = 'This card retrigeres {C:attention}5{} more times',
            [2] = '{C:inactive}( why are you green? ){}'
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
    weight = 1,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.extra.retrigger_times = 5
        end
    end
}