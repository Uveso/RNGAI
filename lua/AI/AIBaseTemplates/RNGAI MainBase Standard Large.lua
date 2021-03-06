--[[
    File    :   /lua/AI/AIBaseTemplates/RNGAI MainBase Standard.lua
    Author  :   relentless
    Summary :
        Main Base template
]]

BaseBuilderTemplate {
    BaseTemplateName = 'RNGStandardMainBaseTemplate Large',
    Builders = {
        -- ACU MainBase Initial Builder --
        'RNGAI Initial ACU Builder Large',

        -- Economy Builder --
        'RNGAI Energy Builder',
        'RNGAI Mass Builder',
        'RNGAI Hydro Builder',
        --'RNGAI ExtractorUpgrades',

        -- Land Unit Builders T1 --
        'RNGAI Engineer Builder',
        'RNGAI ScoutLandBuilder',
        'RNGAI TankLandBuilder',
    },
    NonCheatBuilders = {
    },
    BaseSettings = {
        EngineerCount = {
            Tech1 = 9,
            Tech2 = 3,
            Tech3 = 3,
            SCU = 2,
        },
        FactoryCount = {
            Land = 6,
            Air = 3,
            Sea = 0,
            Gate = 1,
        },
        MassToFactoryValues = {
            T1Value = 6,
            T2Value = 15,
            T3Value = 22.5,
        },

    },
    ExpansionFunction = function(aiBrain, location, markerType)
        return -1
    end,
    FirstBaseFunction = function(aiBrain)
        local mapSizeX, mapSizeZ = GetMapSize()
        if aiBrain.RNG and mapSizeX > 1000 and mapSizeZ > 1000 then
            --LOG('* AI-RNG: ### M-FirstBaseFunction '..personality)
            --LOG('* AI-RNG: Map size is large', mapSizeX, mapSizeZ)
            return 1000, 'RNGStandardMainBaseTemplate Large'
        end
        return -1
    end,
}