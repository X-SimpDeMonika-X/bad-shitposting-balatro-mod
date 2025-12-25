
SMODS.Edition {
    key = 'plasma',
    shader = 'booster',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    in_shop = true,
    weight = 20,
    extra_cost = 4,
    apply_to_float = false,
    badge_colour = HEX('e01ab5'),
    sound = { sound = "explosion_release1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = true,
    loc_txt = {
        name = 'PLASMA',
        label = 'PLASMA',
        text = {
            [1] = '{C:tarot}balance the Chip and Mult{}{E:1}{}'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            SMODS.calculate_effect({balance = true}, card)
        end
    end
}