SMODS.Rarity {
    key = "omega",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('136390'),
    loc_txt = {
        name = "OMEGA"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "cat",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.012,
    badge_colour = HEX('7a553a'),
    loc_txt = {
        name = "cat"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "unrare",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.003,
    badge_colour = HEX('aac32e'),
    loc_txt = {
        name = "Unrare"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}