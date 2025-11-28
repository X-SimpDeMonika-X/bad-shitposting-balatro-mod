
SMODS.Joker{ --YORICK+
    key = "yorick",
    config = {
        extra = {
            MULTI = 23,
            MULTI_value = 0
        }
    },
    loc_txt = {
        ['name'] = 'YORICK+',
        ['text'] = {
            [1] = 'This joker gets {X:red,C:white}X23{} Mult for each {C:blue}last hand{} played',
            [2] = '{C:inactive}(Currently {X:red,C:white}X#1#{}){}',
            [3] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "badshit_omega",
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
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MULTI}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) == to_big(1) then
                card.ability.extra.MULTI = (card.ability.extra.MULTI) + 23
                return {
                    Xmult = card.ability.extra.undefined
                }
            elseif not (to_big(G.GAME.current_round.hands_left) == to_big(1)) then
                return {
                    Xmult = card.ability.extra.MULTI
                }
            end
        end
    end
}