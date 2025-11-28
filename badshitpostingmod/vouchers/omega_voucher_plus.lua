
SMODS.Voucher {
    key = 'omega_voucher_plus',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            odds = 5
        } 
    },
    loc_txt = {
        name = 'OMEGA VOUCHER PLUS',
        text = {
            [1] = '{C:green}1 in 5 chances {}of Create an {C:enhanced}Omega Joker{} at end of the ante'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 35,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'omega_voucher'},
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
        end
    end
}