
SMODS.Voucher {
    key = 'omega_voucher',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'OMEGA VOUCHER',
        text = {
            [1] = 'Create an {C:enhanced}Omega Joker{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 30,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
    end
}