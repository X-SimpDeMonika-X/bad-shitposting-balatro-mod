
SMODS.Joker{ --Cool joker
    key = "cooljoker",
    config = {
        extra = {
            xmult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Cool joker',
        ['text'] = {
            [1] = 'Jokers each give {X:red,C:white}X1.2{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.other_joker  then
            return {
                Xmult = 1.2
            }
        end
    end
}