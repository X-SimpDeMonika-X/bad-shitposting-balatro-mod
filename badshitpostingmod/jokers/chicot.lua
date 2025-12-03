
SMODS.Joker{ --CHICOT+
    key = "chicot",
    config = {
        extra = {
            repetitions = 3,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'CHICOT+',
        ['text'] = {
            [1] = '{C:attention}50% chance of winning the blind{}',
            [2] = 'Disables the boss blinds {X:red,C:white}3{} times'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1.25, 
        h = 95 * 1.25
    },
    cost = 30,
    rarity = "badshit_omega",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_mycustom_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_badshit_chicot') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                for i = 1, 3 do
                    SMODS.calculate_effect({func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "fuck you", colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_8e57e016', 1, card.ability.extra.odds, 'j_badshit_chicot', true) then
                    G.E_MANAGER:add_event(Event({
                        blocking = false,
                        func = function()
                            if G.STATE == G.STATES.SELECTING_HAND then
                                G.GAME.chips = G.GAME.blind.chips
                                G.STATE = G.STATES.HAND_PLAYED
                                G.STATE_COMPLETE = true
                                end_round()
                                return true
                            end
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "fuck you", colour = G.C.ORANGE})
                end
            end
        end
    end
}