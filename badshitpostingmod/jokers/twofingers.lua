
SMODS.Joker{ --Two Fingers 
    key = "twofingers",
    config = {
        extra = {
            reduction_value = '3'
        }
    },
    loc_txt = {
        ['name'] = 'Two Fingers ',
        ['text'] = {
            [1] = 'All {C:attention}Flushes{} and {C:attention}Straights{} can be made with 2 cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements reduced by 3
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements restored
    end
}


local smods_four_fingers_ref = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_badshit_twofingers")) then
        return 2
    end
    return smods_four_fingers_ref()
end