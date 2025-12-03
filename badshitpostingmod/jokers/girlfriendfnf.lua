
SMODS.Joker{ --GirlFriend fnf
    key = "girlfriendfnf",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'GirlFriend fnf',
        ['text'] = {
            [1] = '{C:red}-1{} joker slot',
            [2] = '{C:inactive}dont buy this b###h{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1.4, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}