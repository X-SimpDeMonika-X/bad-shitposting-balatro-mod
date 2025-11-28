
SMODS.Joker{ --Yuri
    key = "yuri",
    config = {
        extra = {
            chipslol = 0
        }
    },
    loc_txt = {
        ['name'] = 'Yuri',
        ['text'] = {
            [1] = 'Joker gets {C:blue}+19{} Chips for each {C:spades}spades{} played',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipslol}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                card.ability.extra.chipslol = (card.ability.extra.chipslol) + 10
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chipslol
            }
        end
    end
}