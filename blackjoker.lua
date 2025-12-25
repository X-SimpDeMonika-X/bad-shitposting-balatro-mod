
SMODS.Joker{ --Black joker
    key = "blackjoker",
    config = {
        extra = {
            e = 1
        }
    },
    loc_txt = {
        ['name'] = 'Black joker',
        ['text'] = {
            [1] = 'cards without suit add {X:black,C:white}X0.15{} Mult to this joker',
            [2] = '{C:inactive}(Currently {}{X:black,C:white} X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
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
        
        return {vars = {card.ability.extra.e}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds")) or not (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs"))) then
                card.ability.extra.e = (card.ability.extra.e) + 0.15
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.e
            }
        end
    end
}