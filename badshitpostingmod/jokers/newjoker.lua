
SMODS.Joker{ --New Joker
    key = "newjoker",
    config = {
        extra = {
            odds = "10",
            mult0 = 100,
            text = 0
        }
    },
    loc_txt = {
        ['name'] = 'New Joker',
        ['text'] = {
            [1] = 'A {C:blue}custom{} joker with {C:red}unique{} effects.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_badshit_newjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    message = "+100 Mult"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_14f20c13', 1, card.ability.extra.odds, 'j_badshit_newjoker', false) then
                            SMODS.calculate_effect({mult = 100}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "for real this time", colour = G.C.WHITE})
                        end
                        return true
                    end
                }
            end
        end
    end
}