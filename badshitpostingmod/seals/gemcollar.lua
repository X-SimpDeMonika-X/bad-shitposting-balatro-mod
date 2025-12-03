
SMODS.Seal {
    key = 'gemcollar',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            currentscoringchips = 0
        }
    },
    badge_colour = HEX('58d558'),
    loc_txt = {
        name = 'Gem collar',
        label = 'Gem collar',
        text = {
            [1] = 'The cards give {C:blue}the current Chips{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {hand_chips}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = hand_chips
            }
        end
    end
}