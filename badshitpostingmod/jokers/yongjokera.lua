
SMODS.Joker{ --Yong joker a
    key = "yongjokera",
    config = {
        extra = {
            hands0 = 1,
            xmult0 = 2.5,
            music_rin = 0,
            permanent = 0
        }
    },
    loc_txt = {
        ['name'] = 'Yong joker a',
        ['text'] = {
            [1] = 'Set hands to {C:clubs}1{}',
            [2] = '{C:attention}All {}cards that score give {X:red,C:white}x2.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("music_rin")
                    
                    return true
                end,
            }))
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                    
                    G.GAME.round_resets.hands = 1
                    ease_hands_played(1 - G.GAME.current_round.hands_left)
                    
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 2.5
            }
        end
    end
}