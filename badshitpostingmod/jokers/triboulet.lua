
SMODS.Joker{ --TRIBOULET+
    key = "triboulet",
    config = {
        extra = {
            xmult0 = 2.5,
            pb_bonus_8a6206b1 = 50,
            xmult = 2.5,
            pb_bonus_dc2ede7d = 50,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'TRIBOULET+',
        ['text'] = {
            [1] = 'Kings and queens give {X:red,C:white}X2.5{} Multi and get {C:blue}50  Chips{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "badshit_omega",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["badshit_mycustom_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 50
                return {
                    Xmult = 2.5,
                    extra = {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card,
                        colour = G.C.CHIPS
                    }
                }
            elseif context.other_card:get_id() == 13 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 50
                return {
                    Xmult = 2.5
                }
            end
        end
    end
}