local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'RNGAI SML Builders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI SML Hi Pri',
        PlatoonTemplate = 'T3SACUEngineerBuilderRNG',
        Priority = 700,
        BuilderConditions = {
            { UCBC, 'BuildOnlyOnLocation', { 'LocationType', 'MAIN' } },
            { EBC, 'GreaterThanEconIncome', { 7.0, 600.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.10, 0.90 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuiltRNG', { 1, categories.NUKE * categories.STRUCTURE}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.STRUCTURE * categories.NUKE * (categories.TECH3 + categories.EXPERIMENTAL) }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 15,
                BuildClose = false,
                AdjacencyCategory = categories.STRUCTURE * categories.SHIELD,
                AvoidCategory = categories.STRUCTURE * categories.NUKE,
                maxUnits = 1,
                maxRadius = 20,
                LocationType = 'LocationType',
                BuildStructures = {
                    'T3StrategicMissile',
                },
            }
        }
    },
    Builder {
        BuilderName = 'RNGAI SML Low Pri',
        PlatoonTemplate = 'T3SACUEngineerBuilderRNG',
        Priority = 500,
        BuilderConditions = {
            { UCBC, 'BuildOnlyOnLocation', { 'LocationType', 'MAIN' } },
            { EBC, 'GreaterThanEconIncome', { 9.0, 800.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.40, 0.90 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuiltRNG', { 1, categories.NUKE * categories.STRUCTURE}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.STRUCTURE * categories.NUKE * (categories.TECH3 + categories.EXPERIMENTAL) }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 4, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                BuildClose = false,
                AdjacencyCategory = categories.STRUCTURE * categories.SHIELD,
                AvoidCategory = categories.STRUCTURE * categories.NUKE,
                maxUnits = 1,
                maxRadius = 20,
                LocationType = 'LocationType',
                BuildStructures = {
                    'T3StrategicMissile',
                },
            }
        }
    },
}
BuilderGroup {
    BuilderGroupName = 'RNGAI Strategic Artillery Builders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI T3 Artillery Hi Pri',
        PlatoonTemplate = 'T3SACUEngineerBuilderRNG',
        Priority = 600,
        DelayEqualBuildPlattons = {'Artillery', 20},
        BuilderConditions = {
            { UCBC, 'BuildOnlyOnLocation', { 'LocationType', 'MAIN' } },
            { UCBC, 'CheckBuildPlatoonDelay', { 'Artillery' }},
            { EBC, 'GreaterThanEconTrendRNG', { 2.0, 200.0 } },
            { EBC, 'GreaterThanEconIncome', { 8.0, 700.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.15, 0.95 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuiltRNG', { 1, categories.STRUCTURE * categories.ARTILLERY * categories.TECH3 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.STRUCTURE * categories.ARTILLERY * categories.TECH3 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 15,
                AdjacencyCategory = categories.STRUCTURE * categories.SHIELD,
                AvoidCategory = categories.STRUCTURE * categories.ARTILLERY * categories.TECH3,
                maxUnits = 1,
                maxRadius = 20,
                BuildStructures = {
                    'T3Artillery',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'RNGAI T3 Artillery Lo Pri',
        PlatoonTemplate = 'T3SACUEngineerBuilderRNG',
        Priority = 600,
        DelayEqualBuildPlattons = {'Artillery', 20},
        BuilderConditions = {
            { UCBC, 'BuildOnlyOnLocation', { 'LocationType', 'MAIN' } },
            { UCBC, 'CheckBuildPlatoonDelay', { 'Artillery' }},
            { EBC, 'GreaterThanEconTrendRNG', { 2.0, 200.0 } },
            { EBC, 'GreaterThanEconIncome', { 8.0, 700.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.30, 0.95 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuiltRNG', { 1, categories.STRUCTURE * categories.ARTILLERY * categories.TECH3 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 15,
                AdjacencyCategory = categories.STRUCTURE * categories.SHIELD,
                AvoidCategory = categories.STRUCTURE * categories.ARTILLERY * categories.TECH3,
                maxUnits = 1,
                maxRadius = 20,
                BuildStructures = {
                    'T3Artillery',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Strategic Formers',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'RNGAI SML Former',
        PlatoonTemplate = 'T3NukeRNG',
        Priority = 400,
        InstanceCount = 10,
        FormRadius = 10000,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanArmyPoolWithCategory', { 0, categories.STRUCTURE * categories.NUKE * (categories.TECH3 + categories.EXPERIMENTAL) } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI SML Merger',
        PlatoonTemplate = 'AddToSMLPlatoonRNG',
        Priority = 500,
        InstanceCount = 10,
        FormRadius = 10000,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanArmyPoolWithCategory', { 0, categories.STRUCTURE * categories.NUKE * (categories.TECH3 + categories.EXPERIMENTAL) } },
        },
        BuilderData = {
            PlatoonPlan = 'NUKEAIRNG',
            Location = 'LocationType'
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T3 Artillery Former',
        PlatoonTemplate = 'T3ArtilleryStructure',
        Priority = 500,
        InstanceCount = 10,
        FormRadius = 10000,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanArmyPoolWithCategory', { 0, categories.STRUCTURE * categories.ARTILLERY * (categories.TECH3 + categories.EXPERIMENTAL) } },
        },
        BuilderType = 'Any',
    },
}