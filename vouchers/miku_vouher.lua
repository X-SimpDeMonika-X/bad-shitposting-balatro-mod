
SMODS.Voucher {
    key = 'miku_vouher',
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'Miku Vouher',
        text = {
            [1] = 'When a blind boss is selected',
            [2] = 'increases consumable slots by {C:attention}+1{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.blind.boss then
                return {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                            return true
                        end
                    }))
                    
                }
            end
        end
    end
}