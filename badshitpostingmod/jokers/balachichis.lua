
SMODS.Joker{ --Balachichis
    key = "balachichis",
    config = {
        extra = {
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Balachichis',
        ['text'] = {
            [1] = 'Each {C:orange}Queen{} held in hand gives {X:red,C:white}X2{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 12 then
                return {
                    Xmult = 2
                }
            end
        end
    end
}