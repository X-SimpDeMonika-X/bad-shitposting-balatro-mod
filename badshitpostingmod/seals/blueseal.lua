
SMODS.Seal {
    key = 'blueseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    badge_colour = HEX('1E90FF'),
    loc_txt = {
        name = 'Metal Seal',
        label = 'Metal Seal',
        text = {
            [1] = 'gives {X:red,C:white}X1.5{} Mult if is in hand'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                Xmult = 1.5
            }
        end
    end
}