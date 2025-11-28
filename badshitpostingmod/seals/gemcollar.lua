
SMODS.Seal {
    key = 'gemcollar',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult0 = 6,
            mult = 8,
            mult2 = 28,
            mult3 = 26,
            mult4 = 4,
            mult5 = 14,
            mult6 = 16,
            mult7 = 20,
            mult8 = 24,
            mult9 = 22,
            mult10 = 10,
            mult11 = 18,
            mult12 = 12
        }
    },
    badge_colour = HEX('58d558'),
    loc_txt = {
        name = 'Gem collar',
        label = 'Gem collar',
        text = {
            [1] = 'The cards give{C:red} {C:red}+2{} Mult{} according to their rank.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 3 then
            return {
                mult = 6
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 4 then
            return {
                mult = 8
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 14 then
            return {
                mult = 28
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 13 then
            return {
                mult = 26
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 2 then
            return {
                mult = 4
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 7 then
            return {
                mult = 14
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 8 then
            return {
                mult = 16
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 10 then
            return {
                mult = 20
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 12 then
            return {
                mult = 24
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 11 then
            return {
                mult = 22
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 5 then
            return {
                mult = 10
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 9 then
            return {
                mult = 18
            }
        end
        if context.main_scoring and context.cardarea == G.play and card:get_id() == 6 then
            return {
                mult = 12
            }
        end
    end
}