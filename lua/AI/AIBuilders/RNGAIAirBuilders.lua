--[[
    File    :   /lua/AI/AIBaseTemplates/RNGAIFighterAirBuilders.lua
    Author  :   relentless
    Summary :
        Air Builders
]]

local EBC = '/lua/editor/EconomyBuildConditions.lua'
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'

local BaseRestrictedArea, BaseMilitaryArea, BaseDMZArea, BaseEnemyArea = import('/mods/RNGAI/lua/AI/RNGUtilities.lua').GetMOARadii()

local EnemyAirThreat = function(self, aiBrain, manager)
    local enemyAirThreat = aiBrain.EnemyIntel.EnemyThreatCurrent.Air
    local aiAirThreat = aiBrain.BrainIntel.Average.Air
    if enemyAirThreat > aiAirThreat then
        --LOG('PriorityFunction EnemyAirThreat Modifying priority to 1000')
        return 1000, true
    end
    return 0, true
end

BuilderGroup {
    BuilderGroupName = 'RNGAI Air Builder T1',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'RNGAI Factory Intie T1',
        PlatoonTemplate = 'RNGAIFighterGroup',
        Priority = 750,
        BuilderConditions = { 
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.4}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.6, 0.8 }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.AIR * categories.ANTIAIR * categories.TECH3} },
            { UCBC, 'PoolLessAtLocation', {'LocationType', 10, categories.AIR * categories.ANTIAIR }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Intie Response',
        PlatoonTemplate = 'RNGAIFighterGroup',
        Priority = 900,
        BuilderConditions = { 
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.4, 0.7 }},
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryArea, 'LocationType', 0, categories.AIR - categories.SCOUT }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Intie Enemy Threat',
        PlatoonTemplate = 'RNGAIFighterGroup',
        Priority = 0,
        PriorityFunction = EnemyAirThreat,
        BuilderConditions = { 
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Bomber T1',
        PlatoonTemplate = 'T1AirBomber',
        Priority = 750,
        BuilderConditions = {
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 2, 'FACTORY AIR TECH2' }},
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.9 }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, categories.AIR * categories.BOMBER * categories.TECH2} },
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Bomber T1 Response',
        PlatoonTemplate = 'T1AirBomber',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 2, 'FACTORY AIR TECH2' }},
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconStorageRatio', { 0.2, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.6, 0.9 }},
            { UCBC, 'EnemyUnitsLessAtLocationRadius', { BaseEnemyArea, 'LocationType', 1, categories.ANTIAIR }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, categories.AIR * categories.BOMBER * categories.TECH2} },
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Gunship T1',
        PlatoonTemplate = 'T1Gunship',
        Priority = 750,
        BuilderConditions = {
            { MIBC, 'FactionIndex', { 3 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.6, 0.9 }},
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 2, 'FACTORY AIR TECH2, FACTORY AIR TECH3' }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory Intie Small',
        PlatoonTemplate = 'RNGAIFighterGroup',
        Priority = 700,
        BuilderConditions = { 
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 8, categories.AIR * categories.ANTIAIR } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.4}},
        },
        BuilderType = 'Air',
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Air Builder T2',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'RNGAI Factory Swift Wind Response',
        PlatoonTemplate = 'RNGAIT2FighterAeon',
        Priority = 910,
        BuilderConditions = { 
            { MIBC, 'FactionIndex', { 2 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 1, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.4, 0.7 }},
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryArea, 'LocationType', 0, categories.AIR - categories.SCOUT }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI Factory T2 FighterBomber',
        PlatoonTemplate = 'T2FighterBomber',
        Priority = 800,
        BuilderType = 'Air',
        BuilderConditions = { 
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.03, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.9 }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 8, categories.AIR * categories.ANTIAIR } },
        },
    },
    Builder {
        BuilderName = 'RNGAI Factory T2 FighterBomber Response',
        PlatoonTemplate = 'T2FighterBomber',
        Priority = 850,
        BuilderConditions = {
            { MIBC, 'FactionIndex', { 1, 3, 4 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { EBC, 'GreaterThanEconStorageRatio', { 0.03, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.8 }},
            { UCBC, 'EnemyUnitsLessAtLocationRadius', { BaseEnemyArea, 'LocationType', 2, categories.ANTIAIR }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.AIR * categories.BOMBER * categories.TECH3} },
            { UCBC, 'FactoryLessAtLocation', { 'LocationType', 2, 'FACTORY AIR TECH3' }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI T2 Air Gunship',
        PlatoonTemplate = 'T2AirGunship',
        Priority = 700,
        BuilderType = 'Air',
        BuilderConditions = {
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.03, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.9 }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 12, categories.AIR * categories.GROUNDATTACK * categories.TECH2} },
        },
    },
    Builder {
        BuilderName = 'RNGAI T2 Air Mercy',
        PlatoonTemplate = 'T2AirMissile',
        Priority = 750,
        BuilderType = 'Air',
        BuilderConditions = {
            { MIBC, 'FactionIndex', { 2 }}, -- 1: UEF, 2: Aeon, 3: Cybran, 4: Seraphim, 5: Nomads
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.03, 0.5}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.9 }},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, categories.AIR * categories.TECH2 * categories.daa0206} },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Air Builder T3',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'RNGAI Factory ASF Response',
        PlatoonTemplate = 'RNGAIT3AirResponse',
        Priority = 900,
        BuilderConditions = { 
            { UCBC, 'FactoryGreaterAtLocation', { 'LocationType', 0, 'FACTORY AIR TECH3' }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.4, 0.7 }},
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryArea, 'LocationType', 0, categories.AIR - categories.SCOUT }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI T3 Air Attack',
        PlatoonTemplate = 'RNGAIT3AirAttackQueue',
        Priority = 850,
        BuilderType = 'Air',
        BuilderConditions = {
            { UCBC, 'FactoryGreaterAtLocation', { 'LocationType', 0, 'FACTORY AIR TECH3' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH3' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.03, 0.80}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.9 }},
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Air Response Formers T1',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'RNGAI Air Intercept Response BaseRestrictedArea',
        PlatoonTemplate = 'RNGAI AntiAirHunt',
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 950,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardEngineers = true,
            PrioritizedCategories = {
                'BOMBER AIR',
                'GUNSHIP AIR',
                'ANTIAIR AIR',
            },
        },
        BuilderConditions = {
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseRestrictedArea, 'LocationType', 0, categories.AIR - categories.SCOUT }},
        },
    },
    Builder {
        BuilderName = 'RNGAI Air Mercy BaseEnemyArea',
        PlatoonTemplate = 'RNGAI MercyAttack',
        Priority = 960,
        InstanceCount = 4,
        BuilderType = 'Any',
        BuilderData = {
            SearchRadius = BaseEnemyArea,
            PrioritizedCategories = {
                'COMMAND',
                'EXPERIMENTAL',
            },
        },
        BuilderConditions = {
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseEnemyArea, 'LocationType', 0, categories.COMMAND - categories.EXPERIMENTAL }},
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 3, categories.daa0206 } },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI Air Platoon Builder',
    BuildersType = 'PlatoonFormBuilder', -- A PlatoonFormBuilder is for builder groups of units.
    Builder {
        BuilderName = 'RNGAI Air Intercept',
        PlatoonTemplate = 'RNGAI AntiAirHunt',
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 800,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            AvoidBases = true,
            NeverGuardEngineers = true,
            PrioritizedCategories = {
                'BOMBER AIR',
                'GUNSHIP AIR',
                'ANTIAIR AIR',
            },
        },
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.AIR * categories.MOBILE * (categories.TECH1 + categories.TECH2 + categories.TECH3) * categories.ANTIAIR } },
         },
    },
    Builder {
        BuilderName = 'RNGAI Air Lockdown',
        PlatoonTemplate = 'AntiAirHunt',
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 750,
        InstanceCount = 8,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardEngineers = true,
            PrioritizedCategories = {
                'BOMBER AIR',
                'GUNSHIP AIR',
                'ANTIAIR AIR',
            },
        },
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.AIR * categories.MOBILE * (categories.TECH1 + categories.TECH2 + categories.TECH3) * categories.ANTIAIR } },
         },
    },
    Builder {
        BuilderName = 'RNGAI AntiAir Base Guard',
        PlatoonTemplate = 'RNGAI AntiAir BaseGuard',
        PlatoonAddPlans = { 'DistressResponseAIRNG' },
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 800,
        InstanceCount = 8,
        BuilderType = 'Any',
        BuilderData = {
            GuardType = 'AntiAir',
            NeverGuardEngineers = true,
            GuardRadius = BaseDMZArea, -- this is in the guardBase function as self.PlatoonData.GuardRadius
        },
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.AIR * categories.MOBILE * (categories.TECH1 + categories.TECH2 + categories.TECH3) * categories.ANTIAIR } },
        },
    },
    Builder {
        BuilderName = 'RNGAI Bomber Base Guard',
        PlatoonTemplate = 'RNGAI Bomber BaseGuard',
        PlatoonAddPlans = { 'DistressResponseAIRNG' },
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryArea, 'LocationType', 0, categories.MOBILE * categories.LAND - categories.SCOUT}},
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.MOBILE * categories.AIR * categories.BOMBER - categories.TECH3 - categories.daa0206 } },
        },
        BuilderData = {
            GuardType = 'Bomber',
            SearchRadius = BaseMilitaryArea,
            PrioritizedCategories = {
                'ENGINEER TECH1',
                'MOBILE LAND',
                'MASSEXTRACTION',
                'ALLUNITS',
            },
        },
    },

    Builder {
        BuilderName = 'RNGAI Gunship Base Guard',
        PlatoonTemplate = 'RNGAI Gunship BaseGuard',
        PlatoonAddPlans = { 'DistressResponseAIRNG' },
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryArea, 'LocationType', 0, categories.MOBILE * categories.LAND - categories.SCOUT}},
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, categories.MOBILE * categories.AIR * categories.GROUNDATTACK * (categories.TECH1 + categories.TECH2 + categories.TECH3) } },
        },
        BuilderData = {
            GuardType = 'Bomber',
            SearchRadius = BaseMilitaryArea,
            PrioritizedCategories = {
                'ENGINEER TECH1',
                'MOBILE LAND',
                'MASSEXTRACTION',
                'ALLUNITS',
            },
        },
    },

    Builder {
        BuilderName = 'RNGAI Bomber Attack',
        PlatoonTemplate = 'RNGAI BomberAttack',
        PlatoonAddPlans = { 'DistressResponseAIRNG' },
        PlatoonAddBehaviors = { 'AirUnitRefit' },
        Priority = 900,
        InstanceCount = 3,
        BuilderType = 'Any',        
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, categories.MOBILE * categories.AIR * categories.BOMBER - categories.daa0206 } },
        },
        BuilderData = {
            SearchRadius = BaseMilitaryArea,
            PrioritizedCategories = {
                'MASSEXTRACTION',
                'ENGINEER TECH1',
                'MOBILE LAND',
                'MOBILE ANTIAIR',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Gunship Attack',
        PlatoonTemplate = 'RNGAI GunShipAttack',
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, categories.AIR * categories.MOBILE * categories.GROUNDATTACK * categories.TECH1 } },
        },
        BuilderData = {
            SearchRadius = BaseMilitaryArea,
            PrioritizedCategories = {
                'MOBILE LAND',
                'ENGINEER TECH1',
                'MOBILE ANTIAIR',
                'MASSEXTRACTION',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Gunship Attack T2T3',
        PlatoonTemplate = 'RNGAI GunShipAttack',
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.AIR * categories.MOBILE * categories.GROUNDATTACK * (categories.TECH1 + categories.TECH2) } },
        },
        BuilderData = {
            SearchRadius = BaseMilitaryArea,
            PrioritizedCategories = {
                'MOBILE ANTIAIR',
                'MOBILE LAND',
                'ENGINEER TECH1',
                'MASSEXTRACTION',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Bomber Attack Enemy',
        PlatoonTemplate = 'RNGAI BomberAttack',
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',        
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, categories.MOBILE * categories.AIR * categories.BOMBER * categories.TECH1 - categories.daa0206 } },
        },
        BuilderData = {
            SearchRadius = BaseEnemyArea,
            PrioritizedCategories = {
                'RADAR STRUCTURE',
                'MOBILE LAND',
                'ENGINEER TECH1',
                'MOBILE ANTIAIR',
                'MASSEXTRACTION',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Bomber Attack Excess',
        PlatoonTemplate = 'RNGAI BomberAttack',
        PlatoonAddPlans = { 'DistressResponseAIRNG' },
        Priority = 700,
        InstanceCount = 20,
        BuilderType = 'Any',        
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.MOBILE * categories.AIR * categories.BOMBER - categories.daa0206 } },
        },
        BuilderData = {
            SearchRadius = BaseEnemyArea,
            PrioritizedCategories = {
                'MASSEXTRACTION',
                'ENGINEER TECH1',
                'MOBILE ANTIAIR',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Energy Attack',
        PlatoonTemplate = 'RNGAI BomberEnergyAttack',
        Priority = 900,
        InstanceCount = 5,
        BuilderType = 'Any',        
        BuilderConditions = { 
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, categories.MOBILE * categories.AIR * categories.BOMBER * categories.TECH1 - categories.daa0206 } },
        },
        BuilderData = {
            SearchRadius = BaseEnemyArea,
            PrioritizedCategories = {
                'RADAR STRUCTURE',
                'EnergyStorage',
                'ENERGYPRODUCTION TECH1',
                'ENERGYPRODUCTION TECH2',
                'ALLUNITS',
            },
        },
    },
    Builder {
        BuilderName = 'RNGAI Bomber Attack T2',
        PlatoonTemplate = 'RNGAI BomberAttack',
        Priority = 800,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            PrioritizedCategories = {
                'MASSEXTRACTION',
                'ENERGYPRODUCTION',
                'COMMAND',
                'MASSFABRICATION',
                'ANTIAIR STRUCTURE',
                'DEFENSE STRUCTURE',
                'STRUCTURE',
                'MOBILE ANTIAIR',
                'ALLUNITS',
            },
        },
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.MOBILE * categories.AIR * categories.BOMBER * categories.TECH2 - categories.daa0206 } },
            { UCBC, 'PoolLessAtLocation', { 'LocationType', 1, 'AIR MOBILE TECH3' } },
        },
    },
    Builder {
        BuilderName = 'RNGAI Energy Bomber Attack T2',
        PlatoonTemplate = 'RNGAI BomberEnergyAttack',
        Priority = 800,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            PrioritizedCategories = {
                'EnergyStorage',
                'ENERGYPRODUCTION TECH2',
                'ENERGYPRODUCTION TECH1',
                'ALLUNITS',
            },
        },
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.MOBILE * categories.AIR * categories.BOMBER * categories.TECH2 - categories.daa0206 } },
            { UCBC, 'PoolLessAtLocation', { 'LocationType', 1, 'AIR MOBILE TECH3' } },
        },
    },
    Builder {
        BuilderName = 'RNGAI Gunship Attack T2',
        PlatoonTemplate = 'RNGAI GunShipAttack',
        Priority = 400,
        InstanceCount = 10,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.AIR * categories.MOBILE * categories.GROUNDATTACK * (categories.TECH2 + categories.TECH3) } },
            { UCBC, 'PoolLessAtLocation', { 'LocationType', 1, 'AIR MOBILE TECH3' } },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'RNGAI TransportFactoryBuilders',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'RNGAI T1 Air Transport',
        PlatoonTemplate = 'T1AirTransport',
        Priority = 850,
        BuilderConditions = {
            { MIBC, 'ArmyNeedsTransports', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.8}},
            { UCBC, 'GreaterThanEnergyTrend', { 0.0 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, 'TRANSPORTFOCUS' } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, 'TRANSPORTFOCUS' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.0 }},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'RNGAI T2 Air Transport',
        PlatoonTemplate = 'T2AirTransport',
        Priority = 860,
        BuilderConditions = {
            { MIBC, 'ArmyNeedsTransports', {} },
            { EBC, 'GreaterThanEconStorageRatio', { 0.02, 0.8}},
            { UCBC, 'GreaterThanEnergyTrend', { 0.0 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, 'TRANSPORTFOCUS' } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, 'TRANSPORTFOCUS' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.0 }},
        },
        BuilderType = 'Air',
    },
}