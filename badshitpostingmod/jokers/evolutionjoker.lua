
SMODS.Joker{ --Evolution Joker
    key = "evolutionjoker",
    config = {
        extra = {
            mult0 = 6,
            chips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Evolution Joker',
        ['text'] = {
            [1] = '{C:red}+6{} Mult, cards in hand give {C:blue}+2 {}Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1.05, 
        h = 95 * 1.05
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["badshit_badshit_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 6
            }
        end
        if context.cardarea == G.hand and not context.end_of_round  then
            return {
                chips = 2
            }
        end
    end
}