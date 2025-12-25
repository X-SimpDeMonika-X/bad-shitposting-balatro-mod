
SMODS.Joker{ --Cryptid the joker
    key = "cryptidthejoker",
    config = {
        extra = {
            emult0 = 3,
            odds = 4,
            levels0 = -1
        }
    },
    loc_txt = {
        ['name'] = 'Cryptid the joker',
        ['text'] = {
            [1] = '{X:planet,C:white}^3{} Mult',
            [2] = '{C:green}1 in 4 {}chances of dropping 1 level from the {C:money}hand played{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_badshit_cryptidthejoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    e_mult = 3
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c11972a1', 1, card.ability.extra.odds, 'j_badshit_cryptidthejoker', false) then
                            local target_hand = (context.scoring_name or "High Card")
                            level_up_hand(card, target_hand, true, -1)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}