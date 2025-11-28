
SMODS.Joker{ --Comediant
    key = "comediant",
    config = {
        extra = {
            xmult0 = 50,
            odds = "9999",
            no = 0,
            start_dissolve = 0
        }
    },
    loc_txt = {
        ['name'] = 'Comediant',
        ['text'] = {
            [1] = '{X:red,C:white}X50{} Mult',
            [2] = '{C:green}#1# in 9999{} chance this card is',
            [3] = 'destroyed at the end of round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.badshit_gros_michel_extinct
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_badshit_comediant') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 50
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9acfd6c7', 1, card.ability.extra.odds, 'j_badshit_comediant', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}