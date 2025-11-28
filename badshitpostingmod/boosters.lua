
SMODS.Booster {
    key = 'leyendari_pack',
    loc_txt = {
        name = "LEYENDARI PACK",
        text = {
            [1] = 'Choose 1 of 3 {C:legendary}Legendary{} jokers'
        },
        group_name = "badshit_boosters"
    },
    config = { extra = 3, choose = 1 },
    cost = 25,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'pack',
    group_key = "badshit_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            rarity = "Legendary",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "badshit_leyendari_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("e700ff"))
        ease_background_colour({ new_colour = HEX('e700ff'), special_colour = HEX("6200ff"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'buffoon_pack_1',
        loc_txt = {
            name = "Girl pack Copy Copy",
            text = {
                [1] = 'Choose {C:attention}1{} of up to {C:attention}2{} Female Joker cards'
            },
            group_name = "Girl pack Copy Copy"
        },
        config = { extra = 2, choose = 1 },
        cost = 5,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "badshit_woman_jokers",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "badshit_buffoon_pack_1"
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("7b0ae0"))
            ease_background_colour({ new_colour = HEX('7b0ae0'), special_colour = HEX("4f6adc"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'buffoon_pack_3',
            loc_txt = {
                name = " Jumbo Girl pack",
                text = {
                    [1] = 'Choose {C:attention}1{} of up to {C:attention}4{} Female Joker cards'
                },
                group_name = " Jumbo Girl pack"
            },
            config = { extra = 4, choose = 1 },
            cost = 7,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                return {
                    set = "badshit_woman_jokers",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "badshit_buffoon_pack_3"
                }
            end,
            ease_background_colour = function(self)
                ease_colour(G.C.DYN_UI.MAIN, HEX("0ae033"))
                ease_background_colour({ new_colour = HEX('0ae033'), special_colour = HEX("8ddc4f"), contrast = 2 })
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'buffoon_pack_2',
                loc_txt = {
                    name = "Mega Girl pack",
                    text = {
                        [1] = 'Choose {C:attention}2{} of up to {C:attention}5{} Female Joker cards'
                    },
                    group_name = "Mega Girl pack"
                },
                config = { extra = 5, choose = 2 },
                cost = 9,
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "badshit_woman_jokers",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "badshit_buffoon_pack_2"
                    }
                end,
                ease_background_colour = function(self)
                    ease_colour(G.C.DYN_UI.MAIN, HEX("e00aa6"))
                    ease_background_colour({ new_colour = HEX('e00aa6'), special_colour = HEX("ff0089"), contrast = 2 })
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                