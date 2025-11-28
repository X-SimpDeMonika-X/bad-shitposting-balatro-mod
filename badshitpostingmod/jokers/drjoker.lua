
SMODS.Joker{ --Dr joker
    key = "drjoker",
    config = {
        extra = {
            mult0 = 10,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Dr joker',
        ['text'] = {
            [1] = 'all {C:hearts}Heart{} card gives {C:red}+10 Mult {}',
            [2] = 'all other cards give  {C:red}+1 Mult {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    mult = 10
                }
            elseif not (context.other_card:is_suit("Hearts")) then
                return {
                    mult = 1
                }
            end
        end
    end
}