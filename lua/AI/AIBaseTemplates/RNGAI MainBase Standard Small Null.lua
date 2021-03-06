--[[
    File    :   /lua/AI/AIBaseTemplates/RNGAI MainBase Standard.lua
    Author  :   relentless
    Summary :
        Main Base template
]]

BaseBuilderTemplate {
    BaseTemplateName = 'RNGStandardMainBaseTemplate Small Null',
    Builders = {
        -- ACU MainBase Initial Builder --
        'RNGAI Initial ACU Builder Small',
        'RNGAI Engineer Expansion Builders Small',
        'RNGAI ACU PD1',
        'RNGAI ENG PD1',

        -- ACU Other Builders --
        'RNGAI ACU Build Assist',
        'RNGAI ACU Structure Builders',
        --'RNGAI Test PD',
        'RNGAI ACU Enhancements Gun',
        'RNGAI ACU Enhancements Tier',
        'RNGAI Engineer Builder',
        'RNGAI Factory Builder Sea',
        'RNGAI Land Upgrade Builders',
        'RNGAI Land AA 2',
        'RNGAI T1 Assist Builders',
        'RNGAI T2 Assist Builders',
        --Strategic Builders
        'RNGAI SML Builders',
        'RNGAI Strategic Artillery Builders',
        'RNGAI Strategic Formers',
        'RNGAI Experimental Builders',
        'RNGAI Experimental Formers',
        'RNGAI Gate Builders',
        'RNGAI SACU Builder',
        'RNGAI SMD Builders',
        'RNGAI Shield Builder',
        'RNGAI Shields Upgrader',

        -- Mass Building
        'RNGAI Mass Builder',
        -- Energy Building
        'RNGAI Energy Builder',

        -- Sea Unit Builders
        'RNGAI Sea Builders T1',
        'RNGAI Sea Formers',
        'RNGAI Mass Hunter Sea Formers',
 
        -- Air Factory Formers --
        'RNGAI Air Upgrade Builders',

        -- Air Unit Builders --
        'RNGAI ScoutAirBuilder',
        'RNGAI Air Builder T1',
        'RNGAI Air Builder T2',
        'RNGAI Air Builder T3',
        'RNGAI TransportFactoryBuilders',

        -- Air Unit Formers --
        'RNGAI ScoutAirFormer',
        'RNGAI Air Platoon Builder',
        'RNGAI Air Response Formers T1',
        'RNGAI Null Land Response Formers',

        -- Land Unit Builders --
        --'RNGAI Null TankLandBuilder',
        -- Land Unit Formers --
        --'RNGAI Null Land FormBuilders',
        
    },
    NonCheatBuilders = {
    },
    BaseSettings = {
        EngineerCount = {
            Tech1 = 20,
            Tech2 = 9,
            Tech3 = 6,
            SCU = 3,
        },
        FactoryCount = {
            Land = 15,
            Air = 5,
            Sea = 1,
            Gate = 1,
        },
        MassToFactoryValues = {
            T1Value = 4,
            T2Value = 11,
            T3Value = 19,
        },

    },
    ExpansionFunction = function(aiBrain, location, markerType)
        return -1
    end,
    FirstBaseFunction = function(aiBrain)
        local personality = ScenarioInfo.ArmySetup[aiBrain.Name].AIPersonality
        local mapSizeX, mapSizeZ = GetMapSize()
        if personality == 'RNGStandardnull' and mapSizeX < 1000 and mapSizeZ < 1000 or personality == 'RNGStandardnullcheat' and mapSizeX < 1000 and mapSizeZ < 1000 then
            --LOG('* AI-RNG: ### M-FirstBaseFunction '..personality)
            --LOG('* AI-RNG: Map size is small', mapSizeX, mapSizeZ)
            return 1000, 'RNGStandardnull'
        end
        return -1
    end,
}