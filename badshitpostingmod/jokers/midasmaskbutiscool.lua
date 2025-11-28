
SMODS.Joker{ --Midas Mask but is cool
    key = "midasmaskbutiscool",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Midas Mask but is cool',
        ['text'] = {
            [1] = 'All played {C:orange}face{} cards become {C:orange}Cooler Gold{} cards when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
                context.other_card:set_ability(G.P_CENTERS.m_badshit_coolergoldcard)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}