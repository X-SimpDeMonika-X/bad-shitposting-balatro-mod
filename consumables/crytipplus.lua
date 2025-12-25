
SMODS.Consumable {
    key = 'crytipplus',
    set = 'omega_consumebles',
    pos = { x = 4, y = 2 },
    loc_txt = {
        name = 'CRYTIP PLUS',
        text = {
            [1] = 'Create {X:red,C:white}25{} copies of a selected {C:attention}card{}'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) == to_big(1) then
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) == to_big(1))
    end
}