
SMODS.Joker{ --Bad draw of a joker
    key = "baddrawofajoker",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            odds3 = 6,
            odds4 = 8,
            odds5 = 40,
            mult0 = 4,
            mult = 16,
            mult2 = 32,
            mult3 = 64,
            emult0 = 4000
        }
    },
    loc_txt = {
        ['name'] = 'Bad draw of a joker',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance of get {C:red}4 Mult{}',
            [2] = '{C:green}1 in 4{} chance of get {C:red}16 Mult{}',
            [3] = '{C:green}1 in 6{} chance of get {C:red}32 Mult{}',
            [4] = '{C:green}1 in 8{} chance of get {C:red}64 Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = -4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_mycustom_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_badshit_baddrawofajoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_badshit_baddrawofajoker')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_badshit_baddrawofajoker')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_badshit_baddrawofajoker')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_badshit_baddrawofajoker')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_eea7b17e', 1, card.ability.extra.odds, 'j_badshit_baddrawofajoker', false) then
                    SMODS.calculate_effect({mult = 4}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_84c3e631', 1, card.ability.extra.odds2, 'j_badshit_baddrawofajoker', false) then
                    SMODS.calculate_effect({mult = 16}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_ec60544e', 1, card.ability.extra.odds3, 'j_badshit_baddrawofajoker', false) then
                    SMODS.calculate_effect({mult = 32}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_93446f8d', 1, card.ability.extra.odds4, 'j_badshit_baddrawofajoker', false) then
                    SMODS.calculate_effect({mult = 64}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_4_b32cf0d8', 1, card.ability.extra.odds5, 'j_badshit_baddrawofajoker', false) then
                    SMODS.calculate_effect({e_mult = 4000}, card)
                end
            end
        end
    end
}