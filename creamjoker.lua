
SMODS.Joker{ --Cream joker
    key = "creamjoker",
    config = {
        extra = {
            e = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cream joker',
        ['text'] = {
            [1] = 'gets {X:gold,C:white}X0.1{} Mult for each {C:diamonds}Spades or {C:diamonds}Clubs or Heart{} played',
            [2] = '{C:inactive}(Currently {}{X:attention,C:white} X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
            if (context.other_card:is_suit("Clubs") or context.other_card:is_suit("Spades") or context.other_card:is_suit("Hearts")) then
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