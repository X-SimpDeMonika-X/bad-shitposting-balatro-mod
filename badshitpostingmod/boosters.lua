
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
                
                
                SMODS.Booster {
                    key = 'mega_mega_arcana_pack',
                    loc_txt = {
                        name = "MEGA Mega Arcana Pack",
                        text = {
                            [1] = 'Choose {C:attention}3{} of up to {C:attention}8{} {C:tarot}Tarot{} cards to be used immediately'
                        },
                        group_name = "MEGA Mega Arcana Pack"
                    },
                    config = { extra = 8, choose = 3 },
                    cost = 10,
                    weight = 0.25,
                    atlas = "CustomBoosters",
                    pos = { x = 4, y = 0 },
                    draw_hand = true,
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        local weights = {
                            2.85,
                            0.25,
                            1
                        }
                        local total_weight = 0
                        for _, weight in ipairs(weights) do
                            total_weight = total_weight + weight
                        end
                        local random_value = pseudorandom('badshit_mega_mega_arcana_pack_card') * total_weight
                        local cumulative_weight = 0
                        local selected_index = 1
                        for j, weight in ipairs(weights) do
                            cumulative_weight = cumulative_weight + weight
                            if random_value <= cumulative_weight then
                                selected_index = j
                                break
                            end
                        end
                        if selected_index == 1 then
                            return {
                                set = "Tarot",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_arcana_pack"
                            }
                        elseif selected_index == 2 then
                            return {
                                key = "c_soul",
                                set = "Spectral",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_arcana_pack"
                            }
                        elseif selected_index == 3 then
                            return {
                                key = "c_thesoul",
                                set = "Tarot",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_arcana_pack"
                            }
                        end
                    end,
                    particles = function(self)
                        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                            timer = 0.015,
                            scale = 0.2,
                            initialize = true,
                            lifespan = 1,
                            speed = 1.1,
                            padding = -1,
                            attach = G.ROOM_ATTACH,
                            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                            fill = true
                        })
                        G.booster_pack_sparkles.fade_alpha = 1
                        G.booster_pack_sparkles:fade(1, 0)
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'mega_mega_celestial_pack',
                    loc_txt = {
                        name = "MEGA Mega Celestial Pack",
                        text = {
                            [1] = 'Choose {C:attention}3{} of up to {C:attention}8{} {C:planet}Planet{} cards to be used immediately'
                        },
                        group_name = "MEGA Mega Celestial Pack"
                    },
                    config = { extra = 8, choose = 3 },
                    cost = 10,
                    weight = 0.25,
                    atlas = "CustomBoosters",
                    pos = { x = 5, y = 0 },
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        local weights = {
                            1.8,
                            0.1
                        }
                        local total_weight = 0
                        for _, weight in ipairs(weights) do
                            total_weight = total_weight + weight
                        end
                        local random_value = pseudorandom('badshit_mega_mega_celestial_pack_card') * total_weight
                        local cumulative_weight = 0
                        local selected_index = 1
                        for j, weight in ipairs(weights) do
                            cumulative_weight = cumulative_weight + weight
                            if random_value <= cumulative_weight then
                                selected_index = j
                                break
                            end
                        end
                        if selected_index == 1 then
                            return {
                                set = "Planet",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_celestial_pack"
                            }
                        elseif selected_index == 2 then
                            return {
                                key = "c_black_hole",
                                set = "Tarot",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_celestial_pack"
                            }
                        end
                    end,
                    particles = function(self)
                        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                            timer = 0.015,
                            scale = 0.2,
                            initialize = true,
                            lifespan = 1,
                            speed = 1.1,
                            padding = -1,
                            attach = G.ROOM_ATTACH,
                            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                            fill = true
                        })
                        G.booster_pack_sparkles.fade_alpha = 1
                        G.booster_pack_sparkles:fade(1, 0)
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'mega_spectral_pack_copy',
                    loc_txt = {
                        name = "Mega Spectral Pack Copy",
                        text = {
                            [1] = 'Choose {C:attention}3{} of up to {C:attention}7{} {C:spectral}Spectral{} cards to be used immediately'
                        },
                        group_name = "Mega Spectral Pack Copy"
                    },
                    config = { extra = 7, choose = 3 },
                    cost = 11,
                    weight = 0.25,
                    atlas = "CustomBoosters",
                    pos = { x = 6, y = 0 },
                    draw_hand = true,
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        local weights = {
                            2.75,
                            0.15,
                            0.1
                        }
                        local total_weight = 0
                        for _, weight in ipairs(weights) do
                            total_weight = total_weight + weight
                        end
                        local random_value = pseudorandom('badshit_booster_card') * total_weight
                        local cumulative_weight = 0
                        local selected_index = 1
                        for j, weight in ipairs(weights) do
                            cumulative_weight = cumulative_weight + weight
                            if random_value <= cumulative_weight then
                                selected_index = j
                                break
                            end
                        end
                        if selected_index == 1 then
                            return {
                                set = "Spectral",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_booster"
                            }
                        elseif selected_index == 2 then
                            return {
                                key = "c_soul",
                                set = "Spectral",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_booster"
                            }
                        elseif selected_index == 3 then
                            return {
                                key = "c_thesoul",
                                set = "Tarot",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_booster"
                            }
                        end
                    end,
                    particles = function(self)
                        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                            timer = 0.015,
                            scale = 0.2,
                            initialize = true,
                            lifespan = 1,
                            speed = 1.1,
                            padding = -1,
                            attach = G.ROOM_ATTACH,
                            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                            fill = true
                        })
                        G.booster_pack_sparkles.fade_alpha = 1
                        G.booster_pack_sparkles:fade(1, 0)
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'mega_mega_buffoon_pack',
                    loc_txt = {
                        name = "MEGA Mega Buffoon Pack",
                        text = {
                            [1] = 'Choose {C:attention}3{} of up to {C:attention}7{} Joker cards',
                            [2] = '{C:inactive}( may have {}{C:legendary}Legendary{} {C:inactive}jokers ){}'
                        },
                        group_name = "MEGA Mega Buffoon Pack"
                    },
                    config = { extra = 7, choose = 3 },
                    cost = 10,
                    weight = 0.25,
                    atlas = "CustomBoosters",
                    pos = { x = 7, y = 0 },
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        local weights = {
                            0.1,
                            2.8
                        }
                        local total_weight = 0
                        for _, weight in ipairs(weights) do
                            total_weight = total_weight + weight
                        end
                        local random_value = pseudorandom('badshit_mega_mega_buffoon_pack_card') * total_weight
                        local cumulative_weight = 0
                        local selected_index = 1
                        for j, weight in ipairs(weights) do
                            cumulative_weight = cumulative_weight + weight
                            if random_value <= cumulative_weight then
                                selected_index = j
                                break
                            end
                        end
                        if selected_index == 1 then
                            return {
                                set = "Joker",
                                rarity = "Legendary",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_buffoon_pack"
                            }
                        elseif selected_index == 2 then
                            return {
                                set = "Joker",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "badshit_mega_mega_buffoon_pack"
                            }
                        end
                    end,
                    particles = function(self)
                        -- No particles for joker packs
                        end,
                    }
                    