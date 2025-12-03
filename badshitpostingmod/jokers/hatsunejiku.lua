
SMODS.Joker{ --Hatsune Jiku
    key = "hatsunejiku",
    config = {
        extra = {
            hand_size_increase = '3',
            clubsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hatsune Jiku',
        ['text'] = {
            [1] = '{C:attention}+3{} Hand Size',
            [2] = '{C:red}+9{} Mult per {C:clubs}Club{} in deck',
            [3] = '{C:inactive}(Currently {C:red}+#1#{}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()) * 9}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()) * 9
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(3)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-3)
    end
}