
SMODS.Joker{ --MONIKA
    key = "monika",
    config = {
        extra = {
            Xmult = 1,
            repetitions0 = 1,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'MONIKA',
        ['text'] = {
            [1] = 'retriggers all scoring cards and get a hangman at the end of hand',
            [2] = 'Gains {X:red,C:white}X0.5{} Mult for each card destroyed',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Xmult}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                repetitions = 1,
                message = localize('k_again_ex'),
                extra = {
                    Xmult = card.ability.extra.Xmult
                }
            }
        end
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.Xmult = (card.ability.extra.Xmult) + 0.5
                    return true
                end,
                message = "deleted"
            }
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', edition = 'e_negative', key = 'c_hanged_man'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "just monika", colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}