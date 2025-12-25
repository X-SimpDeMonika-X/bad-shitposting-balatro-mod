
SMODS.Seal {
    key = 'veryrealpurpleseal',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            odds = 5,
            odds2 = 2
        }
    },
    badge_colour = HEX('9c6ec9'),
    loc_txt = {
        name = 'very real purple seal',
        label = 'very real purple seal',
        text = {
            [1] = '{C:green}1 in 5{} chance of creating a{C:edition}soul{}when discarded',
            [2] = '{C:green}1 in 2{} chance of being {C:red}destroyed{} when discarded'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "holo1", per = 2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if SMODS.pseudorandom_probability(card, 'group_0_7ebd7957', 1, card.ability.seal.extra.odds, 'j_badshit_veryrealpurpleseal', false) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', key = 'c_soul'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_ab118b6c', 1, card.ability.seal.extra.odds2, 'j_badshit_veryrealpurpleseal', false) then
                    SMODS.calculate_effect({remove = true}, card)
                end
            end
        end
    }