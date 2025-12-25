
SMODS.Seal {
    key = 'heartseal',
    pos = { x = 3, y = 0 },
    badge_colour = HEX('FF4500'),
    loc_txt = {
        name = 'Heart Seal',
        label = 'Heart Seal',
        text = {
            [1] = 'The Carts turns into {C:hearts}heart{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = false,
    discovered = true,
    no_collection = false,
    sound = { sound = "button", per = -1.5, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            assert(SMODS.change_base(card, "Hearts", nil))
            return {
                message = "Card Modified!"
            }
        end
    end
}