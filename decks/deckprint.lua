
SMODS.Back {
    key = 'deckprint',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Deckprint',
        text = {
            [1] = 'Create a {C:common}blueprint{} at select the blind',
            [2] = '{C:inactive} (there\'s no way you\'ll lose this one).',
            [3] = '{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_blueprint' })
                    if new_joker then
                    end
                    return true
                end
            }))
        end
    end,
    
}