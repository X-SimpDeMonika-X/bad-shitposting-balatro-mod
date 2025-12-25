
SMODS.Joker{ --Brown joker
    key = "brownjoker",
    config = {
        extra = {
            e = 1
        }
    },
    loc_txt = {
        ['name'] = 'Brown joker',
        ['text'] = {
            [1] = 'gets {X:edition,C:white}X0.1{}{} Mult for eachn diamon or Spades{}  played',
            [2] = '{C:inactive}(Currently {} {X:edition,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
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
    pools = { ["badshit_woman_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.e}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Spades")) then
                card.ability.extra.e = (card.ability.extra.e) + 0.1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.e
            }
        end
    end
}