
SMODS.Joker{ --CANIO+
    key = "canio",
    config = {
        extra = {
            source_rank_type = 'all',
            source_ranks = '{}',
            target_rank = '"face_cards"',
            chips = 1,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'CANIO+',
        ['text'] = {
            [1] = 'All cards are considered figures.',
            [2] = 'When you destroy a figure, you get {X:red,C:white}X2{} multipliers and {X:chips,C:white}x1{} chips.',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#2# {} and {X:blue,C:white}#1#{}{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "badshit_omega",
    blueprint_compat = false,
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
        
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.chips = (card.ability.extra.chips) + 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.mult = (card.ability.extra.mult) + 2
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.chips,
                extra = {
                    Xmult = card.ability.extra.mult
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_badshit_canio")) then
        return 14
    end
    return original_id
end
