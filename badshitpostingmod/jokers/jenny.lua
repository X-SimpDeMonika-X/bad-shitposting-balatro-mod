
SMODS.Joker{ --Jenny
    key = "jenny",
    config = {
        extra = {
            source_rank_type = 'face_cards',
            source_ranks = '{}',
            target_rank = '"Q"'
        }
    },
    loc_txt = {
        ['name'] = 'Jenny',
        ['text'] = {
            [1] = 'Figure cards are considered queens'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_woman_jokers"] = true },
    
    calculate = function(self, card, context)
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

    if next(SMODS.find_card("j_badshit_jenny")) then
        if original_id >= 11 and original_id <= 13 then return 14 end
    end
    return original_id
end
