
SMODS.Joker{ --Chara
    key = "chara",
    config = {
        extra = {
            n = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Chara',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of round is a single {C:attention}9{},',
            [2] = 'destroy it and create a {C:attention}random joker{}',
            [3] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = "badshit_unrare",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.full_hand) == to_big(1) and context.other_card:get_id() == 9) then
                context.other_card.should_destroy = true
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}