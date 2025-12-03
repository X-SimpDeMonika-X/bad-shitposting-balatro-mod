
SMODS.Joker{ --Buskin and Sock 
    key = "buskinandsock",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Buskin and Sock ',
        ['text'] = {
            [1] = 'Retrigger all played {C:orange}NOT face{} cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) or (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10)) then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}