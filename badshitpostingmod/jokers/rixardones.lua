
SMODS.Joker{ --RIXARDONES
    key = "rixardones",
    config = {
        extra = {
            COOL = 1
        }
    },
    loc_txt = {
        ['name'] = 'RIXARDONES',
        ['text'] = {
            [1] = 'Adds a {X:red,C:white}X0.25{} Mult for almost every action in the game',
            [2] = 'now it adds {X:red,C:white}X#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 67,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 4
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.COOL, localize((G.GAME.current_round.rank_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.rank_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
        G.GAME.current_round.rank_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    card.ability.extra.COOL = (card.ability.extra.COOL) + 0.25
                    return true
                end
            }
        end
        if context.post_trigger  then
            return {
                func = function()
                    card.ability.extra.COOL = (card.ability.extra.COOL) + 0.25
                    return true
                end
            }
        end
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.COOL
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.COOL), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.COOL
            }
        end
    end
}