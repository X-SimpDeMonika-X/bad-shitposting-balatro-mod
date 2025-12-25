
SMODS.Enhancement {
    key = 'papercard',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            odds = 8,
            odds2 = 15,
            dollars0 = 1.5,
            emult0 = 3
        }
    },
    loc_txt = {
        name = 'Paper Card',
        text = {
            [1] = '{C:green}1 in 8 {}chance of giving {X:money,C:white}X1.5{} {C:money}money{}',
            [2] = '{C:green}1 in 20{} chance of giving {X:planet,C:white}^3{} {C:red}Mult{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 0.25,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_f29943f8', 1, card.ability.extra.odds, 'j_badshit_papercard', false) then
                SMODS.calculate_effect({
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars * 1.5
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5), colour = G.C.MONEY})
                        return true
                    end}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_4124bc50', 1, card.ability.extra.odds2, 'j_badshit_papercard', false) then
                    SMODS.calculate_effect({e_mult = 3}, card)
                end
            end
        end
    }