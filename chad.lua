
SMODS.Joker{ --CHAD
    key = "chad",
    config = {
        extra = {
            repetitions0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'CHAD',
        ['text'] = {
            [1] = 'Retrigger first {C:attention}played{} card used in scoring {X:money,C:white}10{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = 10,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}