SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {63,64,105,80,34,41,9,4,3,56,20,10,52,87,16,47,83,42,48,19,91,61,18,65,5,22,30,38,67,99,66,84,23,50,2,88,103,36,29,13,95,96,68,92,15,81,76,8,102,43,71,69,26,74,11,44,60,59,24,27,98,6,40,93,100,82,46,72,79,86,54,31,89,97,94,25,1,17,7,57,58,45,51,75,37,35,39,85,33,77,104,73,14,90,49,53,70,21,55,12,101,28,78,32,62}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {4,22,19,25,17,20,26,14,21,9,8,23,7,2,16,15,13,27,18,12,10,5,11,28,3,1,29,6,24}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {1,4,3,7,8,2,9,5,6}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {2,1,6,3,4,5}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local editionIndexList = {1}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {5,6,1,2,4,3}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {3,2,1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "badshit_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "badshit_badshit_jokers",
    cards = {
        ["j_badshit__5"] = true,
        ["j_badshit_angrybird"] = true,
        ["j_badshit_blackjoker"] = true,
        ["j_badshit_blueprintbutlegendary"] = true,
        ["j_badshit_bluerjoker"] = true,
        ["j_badshit_boyfriendfnf"] = true,
        ["j_badshit_buffnatsuki"] = true,
        ["j_badshit_casualjoker"] = true,
        ["j_badshit_cat"] = true,
        ["j_badshit_catjoker"] = true,
        ["j_badshit_chad"] = true,
        ["j_badshit_chaostheory"] = true,
        ["j_badshit_creamjoker"] = true,
        ["j_badshit_cryptidthejoker"] = true,
        ["j_badshit_deepbluejoker"] = true,
        ["j_badshit_deluxrixardones"] = true,
        ["j_badshit_door"] = true,
        ["j_badshit_drjoker"] = true,
        ["j_badshit_enchantmenttable"] = true,
        ["j_badshit_evoluciondrunkard"] = true,
        ["j_badshit_evolutionjoker"] = true,
        ["j_badshit_evolutionjollyjoker"] = true,
        ["j_badshit_evolutionlustjoker"] = true,
        ["j_badshit_evolutionspacejoker"] = true,
        ["j_badshit_gaster"] = true,
        ["j_badshit_greenerjoker"] = true,
        ["j_badshit_greyjoker"] = true,
        ["j_badshit_grostree"] = true,
        ["j_badshit_hahafunnynumber"] = true,
        ["j_badshit_iluminaestellamagnetisadaepinosaempradorasuprema"] = true,
        ["j_badshit_itsgoononclock"] = true,
        ["j_badshit_j"] = true,
        ["j_badshit_jimbothegreaterjoker"] = true,
        ["j_badshit_jokevil"] = true,
        ["j_badshit_jollythejoi"] = true,
        ["j_badshit_legendarybrainstorm"] = true,
        ["j_badshit_limajoker"] = true,
        ["j_badshit_magentajoker"] = true,
        ["j_badshit_misterr"] = true,
        ["j_badshit_newjoker"] = true,
        ["j_badshit_newjoker2"] = true,
        ["j_badshit_orangejoker"] = true,
        ["j_badshit_purplejoker"] = true,
        ["j_badshit_ralsei"] = true,
        ["j_badshit_redjoker"] = true,
        ["j_badshit_remasterjoker"] = true,
        ["j_badshit_rixardones"] = true,
        ["j_badshit_savepoint"] = true,
        ["j_badshit_thejerker"] = true,
        ["j_badshit_unfunnyjoker"] = true,
        ["j_badshit_wearenumberone"] = true,
        ["j_badshit_whatthefuck"] = true,
        ["j_badshit_whitejoker"] = true,
        ["j_badshit_wildcard"] = true,
        ["j_badshit_xtalegaster"] = true,
        ["j_badshit_yellowjoker"] = true
    },
})

SMODS.ObjectType({
    key = "badshit_mycustom_jokers",
    cards = {
        ["j_badshit_baddrawofaevolutionjoker"] = true,
        ["j_badshit_baddrawofajoker"] = true,
        ["j_badshit_brainprintakamispapiswe"] = true,
        ["j_badshit_canio"] = true,
        ["j_badshit_chicot"] = true,
        ["j_badshit_helper"] = true,
        ["j_badshit_peakeo"] = true,
        ["j_badshit_theonlyway"] = true,
        ["j_badshit_triboulet"] = true,
        ["j_badshit_yorick"] = true,
        ["j_badshit_yuri"] = true
    },
})

SMODS.ObjectType({
    key = "badshit_woman_jokers",
    cards = {
        ["j_badshit_balachichis"] = true,
        ["j_badshit_brownjoker"] = true,
        ["j_badshit_chara"] = true,
        ["j_badshit_cyanjoker"] = true,
        ["j_badshit_esti"] = true,
        ["j_badshit_girlfriendfnf"] = true,
        ["j_badshit_hatsunejiku"] = true,
        ["j_badshit_jenny"] = true,
        ["j_badshit_libitina"] = true,
        ["j_badshit_monika"] = true,
        ["j_badshit_natsuki"] = true,
        ["j_badshit_pinkjoker"] = true,
        ["j_badshit_prenerfmiku"] = true,
        ["j_badshit_sayori"] = true,
        ["j_badshit_stonejokercopy"] = true,
        ["j_badshit_susiesidea"] = true,
        ["j_badshit_transjoker"] = true,
        ["j_badshit_yongjokera"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end