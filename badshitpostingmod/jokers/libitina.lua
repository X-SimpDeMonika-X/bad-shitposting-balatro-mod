
SMODS.Joker{ --libitina
    key = "libitina",
    config = {
        extra = {
            markot = 1,
            chips0 = 66.6,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'libitina',
        ['text'] = {
            [1] = '{C:blue}+66.6{} chips{} {}',
            [2] = 'create a {C:blue}hanged man{} when using a {C:green}consumable{}',
            [3] = 'each {C:purple}hanged man{} used increases {X:red,C:white}x1.5{} Mult',
            [4] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive}){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.markot}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if not (context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_hanged_man') then
                return {
                    func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', key = 'c_hanged_man'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_hanged_man' then
                return {
                    func = function()
                        card.ability.extra.markot = (card.ability.extra.markot) + 1.5
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 66.6,
                extra = {
                    Xmult = card.ability.extra.markot
                }
            }
        end
    end
}