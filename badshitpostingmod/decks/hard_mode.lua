
SMODS.Back {
    key = 'hard_mode',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 3.1
        },
        no_interest = true,
    },
    loc_txt = {
        name = 'hard mode',
        text = {
            [1] = 'You don\'t earn interest.',
            [2] = '{X:attention,C:white}X3{} blind size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 3.1
                return true
            end
        }))
    end
}