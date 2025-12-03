
SMODS.Joker{ --Juggler but cooler
    key = "jugglerbutcooler",
    config = {
        extra = {
            hand_size_increase = '10'
        }
    },
    loc_txt = {
        ['name'] = 'Juggler but cooler',
        ['text'] = {
            [1] = '{C:orange}+10{} hand size'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(10)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-10)
    end
}