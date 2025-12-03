
SMODS.Joker{ --PERKEO+
    key = "peakeo",
    config = {
        extra = {
            s = 0,
            repetitions = 1,
            text = 0
        }
    },
    loc_txt = {
        ['name'] = 'PERKEO+',
        ['text'] = {
            [1] = 'makes a {C:legendary}negative{} copy of {C:legendary}currenty ante{} consumables at the end of shop'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 32,
    rarity = "badshit_omega",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
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
        
        return {vars = {card.ability.extra.s}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_card = copy_card(card_to_copy)
                                    copied_card:set_edition("e_negative", true)
                                    copied_card:add_to_deck()
                                    G.consumeables:emplace(copied_card)
                                    
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "COPY =)", colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            end
        end
        if context.end_of_round and context.game_over and context.main_eval  then
            return {
                message = "noob lmao + get good"
            }
        end
    end
}