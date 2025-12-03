
SMODS.Joker{ --WHO IS MIKE ?!
    key = "whoismike",
    config = {
        extra = {
            mod_probability0 = 4,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'WHO IS MIKE ?!',
        ['text'] = {
            [1] = 'QUADRUPLE all {C:attention}listed{} {C:green}probabilities{}',
            [2] = '(ex: {C:green}1 in 3{} -> {C:green}4 in 3{})'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (4)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}