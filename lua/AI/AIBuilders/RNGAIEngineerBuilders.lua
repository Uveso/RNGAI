--[[
    File    :   /lua/AI/AIBaseTemplates/RNGAI MainBase Standard.lua
    Author  :   relentless
    Summary :
        Land Builders
]]

local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local MABC = '/lua/editor/MarkerBuildConditions.lua'

local AirDefenseScramble = function(self, aiBrain, builderManager)
    local myAirThreat = aiBrain.BrainIntel.SelfThreat.AntiAirNow
    local enemyAirThreat = aiBrain.EnemyIntel.EnemyThreatCurrent.Air
    if myAirThreat < enemyAirThreat then
        --LOG('Enable Air ASF Scramble Pool Builder')
        --LOG('My Air Threat '..myAirThreat..'Enemy Air Threat '..enemyAirThreat)
        return 650
    else
        --LOG('Disable Air ASF Scramble Pool Builder')
        --LOG('My Air Threat '..myAirThreat..'Enemy Air Threat '..enemyAirThreat)
        return 0
    end
end

BuilderGroup {
    BuilderGroupName = 'RNGAI Engineer Builder',
    BuildersType = 'FactoryBuilder',
    --[[Builder {
        BuilderName = 'RNGAI Factory Engineer Initial',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 1000, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'LessThanGameTimeSeconds', { 180 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.ENGINEER - categories.COMMAND } }, -- Build engies until we have 3 of them.
        },
        BuilderType = 'All',
    },]]
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Mass',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 750,
        BuilderConditions = {
            { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 180, -500, 0, 0, 'AntiSurface', 1}},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.ENGINEER } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 12, categories.ENGINEER - categories.COMMAND } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Power',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 775,
        BuilderConditions = {
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.ENGINEER } },
            { EBC, 'LessThanEnergyTrendRNG', { 20.0 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 12, categories.ENGINEER - categories.COMMAND } },
        },
        BuilderType = 'Land',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Large',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 600, -- low factory priority
        BuilderConditions = {
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'PoolLessAtLocation', {'LocationType', 1, categories.ENGINEER - categories.COMMAND }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.ENGINEER } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Expansion',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 750, -- low factory priority
        BuilderConditions = {
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 20, 2, 'AntiSurface' } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.ENGINEER * categories.TECH1 } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T2 Small',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 800, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH2 - categories.COMMAND } }, -- Build engies until we have 2 of them.
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH2}},
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T2 Medium',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 600, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 6, categories.ENGINEER * categories.TECH2 - categories.COMMAND } }, -- Build engies until we have 6 of them.
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH2}},
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T2 Large',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 400, -- low factory priority
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.7, 0.8} },
            { UCBC, 'PoolLessAtLocation', {'LocationType', 1, categories.ENGINEER - categories.COMMAND }},
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T3 Small',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 850, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 3, categories.ENGINEER * categories.TECH3 - categories.COMMAND } }, -- Build engies until we have 3 of them.
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH3}},
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T3 Medium',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 500, -- Top factory priority
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.10, 0.30 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 10, categories.ENGINEER * categories.TECH3 - categories.COMMAND } }, -- Build engies until we have 2 of them.
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH3}},
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T3 Excess',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 300, -- low factory priority
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH3}},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.80, 0.00}},
            { UCBC, 'PoolLessAtLocation', {'LocationType', 3, categories.ENGINEER * categories.TECH3 - categories.COMMAND }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 20, categories.ENGINEER * categories.TECH3 - categories.COMMAND } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Engineer Builder Expansion',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Expansion Count',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 920,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.ENGINEER - categories.COMMAND } }, -- Build engies until we have 2 of them.
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Expansion Mass',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 850,
        BuilderConditions = {
            { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 30, -500, 5, 0, 'AntiSurface', 1 }},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.4, 0.6} },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T1 Maintain',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 400, -- low factory priority
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.4, 0.6} },
            { UCBC, 'PoolLessAtLocation', {'LocationType', 1, categories.ENGINEER - categories.COMMAND }},
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T2 Expansion',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 450, -- low factory priority
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.9, 1.1} },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.ENGINEER * categories.TECH2 } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'RNGAI Factory Engineer T3 Small Expansion',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 500, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.FACTORY * categories.TECH3}},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.ENGINEER * categories.TECH3 } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
        },
        BuilderType = 'All',
    },
    
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Assist Builders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI T1 Engineer Assist Factory T2 Upgrade',
        PlatoonTemplate = 'T12EngineerAssistRNG',
        Priority = 500,
        InstanceCount = 8,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.FACTORY * categories.TECH2 * ( categories.LAND + categories.AIR ) , categories.STRUCTURE * categories.FACTORY * categories.TECH1 * ( categories.LAND + categories.AIR ) }},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.8, 1.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.07, 0.80 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssistUntilFinished = true,
                PermanentAssist = true,
                AssisteeType = categories.FACTORY,
                AssistRange = 80,
                BeingBuiltCategories = {categories.STRUCTURE * categories.LAND * categories.FACTORY * categories.TECH2},
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI T1 Engineer Assist Factory T3 Upgrade',
        PlatoonTemplate = 'T12EngineerAssistRNG',
        Priority = 550,
        InstanceCount = 8,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.FACTORY * categories.TECH3 * ( categories.LAND + categories.AIR ) , categories.STRUCTURE * categories.FACTORY * categories.TECH2 * ( categories.LAND + categories.AIR ) }},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.8, 1.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.07, 0.80 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssistUntilFinished = true,
                PermanentAssist = true,
                AssisteeType = categories.FACTORY,
                AssistRange = 80,
                BeingBuiltCategories = {categories.STRUCTURE * categories.LAND * categories.FACTORY * categories.TECH3, categories.STRUCTURE * categories.AIR * categories.FACTORY * categories.TECH3 },
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI Engineer Assist Artillery',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 500,
        InstanceCount = 8,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.ARTILLERY * categories.STRATEGIC}},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.8, 1.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.07, 0.80 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssistUntilFinished = true,
                PermanentAssist = true,
                AssisteeType = categories.STRUCTURE,
                AssistRange = 80,
                BeingBuiltCategories = {categories.STRUCTURE * categories.ARTILLERY * categories.STRATEGIC},
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI Assist Factory Air AA T123',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 0,
        PriorityFunction = AirDefenseScramble,
        InstanceCount = 12,
        BuilderConditions = {
            { UCBC, 'LocationFactoriesBuildingGreater', { 'LocationType', 0, categories.MOBILE * categories.AIR * categories.ANTIAIR - categories.BOMBER} },
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.8, 1.0 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.07, 0.80 } },
        },
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssisteeType = categories.FACTORY,
                AssistRange = 120,
                BeingBuiltCategories = {categories.AIR * categories.MOBILE * categories.ANTIAIR},                   
                PermanentAssist = true,
                AssistClosestUnit = false,                                       
                AssistUntilFinished = true,
                Time = 60,
            },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI Engineer Unfinished Structures',
        PlatoonTemplate = 'T1EngineerAssistRNG',
        Priority = 700,
        InstanceCount = 3,
        BuilderConditions = {
                { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
                { UCBC, 'UnfinishedUnits', { 'LocationType', categories.STRUCTURE * categories.FACTORY}},
                { EBC, 'GreaterThanEconStorageRatioRNG', { 0.07, 0.80}},
                { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.7, 1.0 }},
            },
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                BeingBuiltCategories = { categories.STRUCTURE * categories.FACTORY, categories.STRUCTURE },
                Time = 20,
            },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T1 Engineer Unfinished PGEN',
        PlatoonTemplate = 'T12EngineerAssistRNG',
        Priority = 560,
        InstanceCount = 5,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'UnfinishedUnits', { 'LocationType', categories.STRUCTURE * categories.ENERGYPRODUCTION}},
            { EBC, 'LessThanEnergyTrendRNG', { 50.0 }, true },
            },
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                BeingBuiltCategories = {categories.STRUCTURE * categories.ENERGYPRODUCTION},
                AssistClosestUnit = true,
            },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T123 Engineer Unfinished SMD',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 650,
        InstanceCount = 10,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.STRUCTURE * categories.DEFENSE * categories.ANTIMISSILE * categories.TECH3 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.DEFENSE * categories.ANTIMISSILE * categories.TECH3 }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.02, 0.60}},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                AssistClosestUnit = true,
                BeingBuiltCategories = { categories.STRUCTURE * categories.DEFENSE * categories.ANTIMISSILE * categories.TECH3},
                Time = 120,
            },
        }
    },
    
    Builder {
        BuilderName = 'RNGAI T123 Engineer Unfinished Experimental',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 540,
        InstanceCount = 16,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.EXPERIMENTAL * categories.MOBILE }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.10, 0.80}},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                AssistClosestUnit = true,
                BeingBuiltCategories = {categories.EXPERIMENTAL * categories.MOBILE},
                Time = 120,
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI T123 Engineer Unfinished Strategic',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 500,
        InstanceCount = 10,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.STRATEGIC }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.10, 0.80}},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                AssistClosestUnit = true,
                BeingBuiltCategories = {categories.STRUCTURE * categories.STRATEGIC},
                Time = 120,
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI T123 Engineer Unfinished Novax',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 500,
        InstanceCount = 10,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.EXPERIMENTAL * categories.ORBITALSYSTEM }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.10, 0.80}},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                AssistClosestUnit = true,
                BeingBuiltCategories = {categories.EXPERIMENTAL * categories.ORBITALSYSTEM},
                Time = 120,
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI T123 Engineer Unfinished PGEN',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 810,
        InstanceCount = 12,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 }, true },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.ENERGYPRODUCTION * (categories.TECH2 + categories.TECH3) }},

            { EBC, 'LessThanEnergyTrendRNG', { 100.0 }, true },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssistClosestUnit = false,
                AssisteeType = categories.STRUCTURE,
                BeingBuiltCategories = {categories.STRUCTURE * categories.ENERGYPRODUCTION},
                Time = 60,
            },
        }
    },
    Builder {
        BuilderName = 'RNGAI T123 Engineer Upgrade Mex',
        PlatoonTemplate = 'T123EngineerAssistRNG',
        Priority = 200,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { UCBC, 'HaveGreaterThanUnitsInCategoryBeingBuiltAtLocationRNG', { 'LocationType', 0, categories.STRUCTURE * categories.MASSEXTRACTION }},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.80, 0.90}},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistUntilFinished = true,
                AssistLocation = 'LocationType',
                AssisteeType = categories.STRUCTURE,
                AssistRange = 100,
                AssistClosestUnit = true,
                BeingBuiltCategories = {categories.STRUCTURE * categories.MASSEXTRACTION},
                Time = 60,
            },
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Engineering Support Builder',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI T2 Engineering Support UEF',
        PlatoonTemplate = 'UEFT2EngineerBuilderRNG',
        Priority = 500,
        BuilderConditions = {
            { MIBC, 'FactionIndex', { 1 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'ENGINEERSTATION' }},
            { EBC, 'GreaterThanEconIncome',  { 1, 10}},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.60, 0.85}},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.95, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = categories.FACTORY,
                BuildClose = true,
                FactionIndex = 1,
                BuildStructures = {
                    'T2EngineerSupport',
                },
            }
        }
    },
    Builder {
        BuilderName = 'RNGAI T2 Engineering Support Cybran',
        PlatoonTemplate = 'CybranT2EngineerBuilderRNG',
        Priority = 500,
        BuilderConditions = {
            { MIBC, 'FactionIndex', { 3 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, categories.ENGINEERSTATION }},
            { EBC, 'GreaterThanEconIncome',  { 1, 10}},
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.60, 0.85}},
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.95, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = categories.FACTORY,
                BuildClose = true,
                FactionIndex = 3,
                BuildStructures = {
                    'T2EngineerSupport',
                },
            }
        }
    },
    Builder {
        BuilderName = 'RNGAI Engineer Repair',
        PlatoonTemplate = 'EngineerRepairRNG',
        PlatoonAIPlan = 'RepairAI',
        Priority = 900,
        InstanceCount = 1,
        BuilderConditions = {
            { MIBC, 'DamagedStructuresInAreaRNG', { 'LocationType', }},
            },
        BuilderData = {
            LocationType = 'LocationType',
        },
        BuilderType = 'Any',
    },
}
BuilderGroup {
    BuilderGroupName = 'RNGAI Energy Production Reclaim',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI T1 Engineer Reclaim T1 Pgens',
        PlatoonTemplate = 'EngineerBuilderRNG',
        PlatoonAIPlan = 'ReclaimStructuresAI',
        Priority = 800,
        InstanceCount = 1,
        BuilderConditions = {
                { EBC, 'GreaterThanEnergyTrendRNG', { 0.0 } },
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 1, (categories.TECH2 + categories.TECH3 ) * categories.ENERGYPRODUCTION}},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 0, categories.TECH1 * categories.ENERGYPRODUCTION - categories.HYDROCARBON }},
                { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.1, 1.1 }},
            },
        BuilderData = {
            Location = 'LocationType',
            Reclaim = {categories.STRUCTURE * categories.TECH1 * categories.ENERGYPRODUCTION - categories.HYDROCARBON},
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T1 Engineer Reclaim T2 Pgens',
        PlatoonTemplate = 'EngineerBuilderRNG',
        PlatoonAIPlan = 'ReclaimStructuresAI',
        Priority = 600,
        InstanceCount = 1,
        BuilderConditions = {
                { EBC, 'GreaterThanEnergyTrendRNG', { 0.0 } },
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 3, categories.TECH3 * categories.ENERGYPRODUCTION}},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 0, categories.TECH2 * categories.ENERGYPRODUCTION }},
                { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.1, 1.1 }},
            },
        BuilderData = {
            Location = 'LocationType',
            Reclaim = {categories.STRUCTURE * categories.TECH2 * categories.ENERGYPRODUCTION - categories.HYDROCARBON},
        },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Naval Assist',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI Engineer Assist Factory Naval',
        PlatoonTemplate = 'T12EconAssistRNG',
        Priority = 500,
        InstanceCount = 8,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTimeRNG', { 0.8, 1.0 }},
            { EBC, 'GreaterThanMassTrendRNG', { 0.0 } },
            { EBC, 'GreaterThanEconStorageRatioRNG', { 0.15, 0.80 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssistUntilFinished = true,
                AssisteeType = categories.FACTORY,
            },
        }
    },

}
BuilderGroup {
    BuilderGroupName = 'RNGAI T1 Reclaim Builders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T1 Early', -- Try to get that early reclaim
        PlatoonTemplate = 'RNGAI T1EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
                { UCBC, 'LessThanGameTimeSeconds', { 420 } }, -- don't build after 7 minutes
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 6, categories.MOBILE * categories.ENGINEER}},
                
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 8
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T1',
        PlatoonTemplate = 'RNGAI T1EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 900,
        InstanceCount = 4,
        BuilderConditions = {
                { UCBC, 'GreaterThanGameTimeSeconds', { 420 } },
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { UCBC, 'LessThanGameTimeSeconds', { 600 } },
                { EBC, 'LessThanEconStorageRatio', { 0.80, 2.0}},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 8
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T1 Excess',
        PlatoonTemplate = 'RNGAI T1EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 500,
        InstanceCount = 10,
        BuilderConditions = {
                { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { UCBC, 'PoolGreaterAtLocation', {'LocationType', 2, categories.ENGINEER * categories.TECH1 }},
                { EBC, 'LessThanEconStorageRatio', { 0.80, 2.0}},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 4
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T2 Excess',
        PlatoonTemplate = 'RNGAI T2EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 100,
        InstanceCount = 1,
        BuilderConditions = {
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { UCBC, 'PoolGreaterAtLocation', {'LocationType', 2, categories.ENGINEER * categories.TECH2 - categories.STATIONASSISTPOD }},
                { EBC, 'LessThanEconStorageRatio', { 0.80, 2.0}},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 4
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T3 Excess',
        PlatoonTemplate = 'RNGAI T3EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 100,
        InstanceCount = 1,
        BuilderConditions = {
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { UCBC, 'PoolGreaterAtLocation', {'LocationType', 2, categories.ENGINEER * categories.TECH3 - categories.STATIONASSISTPOD - categories.COMMAND }},
                { EBC, 'LessThanEconStorageRatio', { 0.80, 2.0}},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 4
        },
        BuilderType = 'Any',
    },
    
}

BuilderGroup {
    BuilderGroupName = 'RNGAI T1 Reclaim Builders Expansion',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'RNGAI Engineer Reclaim T1 Excess Expansion',
        PlatoonTemplate = 'RNGAI T1EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAIRNG',
        Priority = 850,
        InstanceCount = 2,
        BuilderConditions = {
                { UCBC, 'GreaterThanGameTimeSeconds', { 420 } },
                { UCBC, 'PoolGreaterAtLocation', {'LocationType', 2, categories.ENGINEER * categories.TECH1 }},
                { MIBC, 'CheckIfReclaimEnabled', {}},
                { EBC, 'LessThanEconStorageRatio', { 0.80, 2.0}},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 80,
            MinimumReclaim = 4
        },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Engineer Transfer To Active Expansion',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'RNGAI T1 Eng Trans ActiveExpansion',
        PlatoonTemplate = 'T1EngineerTransferRNG',
        Priority = 500,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'MAIN', 4, categories.MOBILE * categories.ENGINEER * categories.TECH1 - categories.STATIONASSISTPOD - categories.COMMAND }},
            { UCBC, 'EngineerManagerUnitsAtActiveExpansionRNG', { '<', 2,  categories.MOBILE * categories.ENGINEER * categories.TECH1 - categories.STATIONASSISTPOD - categories.COMMAND } },
        },
        BuilderData = {
            MoveToLocationType = 'ActiveExpansion',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T2 Eng Trans ActiveExpansion',
        PlatoonTemplate = 'T2EngineerTransferRNG',
        Priority = 510,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'MAIN', 3, categories.MOBILE * categories.ENGINEER * categories.TECH2 - categories.STATIONASSISTPOD - categories.COMMAND }},
            { UCBC, 'EngineerManagerUnitsAtActiveExpansionRNG', { '<', 1,  categories.MOBILE * categories.ENGINEER * categories.TECH2 - categories.STATIONASSISTPOD - categories.COMMAND } },
        },
        BuilderData = {
            MoveToLocationType = 'ActiveExpansion',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T3 Eng Trans ActiveExpansion',
        PlatoonTemplate = 'T3EngineerTransferRNG',
        Priority = 520,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'MAIN', 4, categories.MOBILE * categories.ENGINEER * categories.TECH3 - categories.STATIONASSISTPOD - categories.COMMAND }},
            { UCBC, 'EngineerManagerUnitsAtActiveExpansionRNG', { '<', 1,  categories.MOBILE * categories.ENGINEER * categories.TECH3 - categories.STATIONASSISTPOD - categories.COMMAND } },
        },
        BuilderData = {
            MoveToLocationType = 'ActiveExpansion',
        },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Engineer Transfer To Main From Expansion',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'RNGAI T1 Eng Trans Main',
        PlatoonTemplate = 'T1EngineerTransferRNG',
        Priority = 500,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'LocationType', 2, categories.MOBILE * categories.ENGINEER * categories.TECH1 - categories.STATIONASSISTPOD - categories.COMMAND }},
        },
        BuilderData = {
            MoveToLocationType = 'MAIN',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T2 Eng Trans Main',
        PlatoonTemplate = 'T2EngineerTransferRNG',
        Priority = 510,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'LocationType', 1, categories.MOBILE * categories.ENGINEER * categories.TECH2 - categories.STATIONASSISTPOD - categories.COMMAND }},
        },
        BuilderData = {
            MoveToLocationType = 'MAIN',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'RNGAI T3 Eng Trans Main',
        PlatoonTemplate = 'T3EngineerTransferRNG',
        Priority = 520,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'GreaterThanGameTimeSeconds', { 600 } },
            { MIBC, 'ExpansionIsActive', {} },
            { UCBC, 'PoolGreaterAtLocation', {'LocationType', 1, categories.MOBILE * categories.ENGINEER * categories.TECH3 - categories.STATIONASSISTPOD - categories.COMMAND }},
        },
        BuilderData = {
            MoveToLocationType = 'MAIN',
        },
        BuilderType = 'Any',
    },
}