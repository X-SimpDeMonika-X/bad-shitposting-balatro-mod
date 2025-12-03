
SMODS.Joker{ --prenerf Miku
    key = "prenerfmiku",
    config = {
        extra = {
            hand_size_increase = '39',
            clubsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'prenerf Miku',
        ['text'] = {
            [1] = '{C:attention}+39{} Hand Size',
            [2] = '{C:red}+39{} Mult per {C:clubs}Club{} in deck',
            [3] = '{C:inactive}(Currently {C:red}+#1#{}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 39,
    rarity = "badshit_omega",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()) * 39}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()) * 39
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(39)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-39)
    end
}