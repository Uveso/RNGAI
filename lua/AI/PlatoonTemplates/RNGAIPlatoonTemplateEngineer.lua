PlatoonTemplate {
    Name = 'T1EngineerAssistRNG',
    Plan = 'ManagerEngineerAssistAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T12EngineerAssistRNG',
    Plan = 'ManagerEngineerAssistAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH1 + categories.TECH2), 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T12EconAssistRNG',
    Plan = 'ManagerEngineerAssistAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH1 + categories.TECH2), 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T3SACUEngineerAssistRNG',
    Plan = 'ManagerEngineerAssistAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH3 + categories.SUBCOMMANDER) - categories.ENGINEERSTATION - categories.COMMAND, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'CommanderBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.COMMAND, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'CommanderAssistRNG',
    Plan = 'ManagerEngineerAssistAIRNG',
    GlobalSquads = {
        { categories.COMMAND, 1, 1, 'support', 'None' },
    },
}

PlatoonTemplate {
    Name = 'EngineerBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1 - categories.COMMAND , 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerBuilderT123RNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH1 + categories.TECH2 + categories.TECH3) - categories.COMMAND - categories.ENGINEERSTATION , 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerBuilderT12RNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH1 + categories.TECH2) - categories.COMMAND - categories.ENGINEERSTATION , 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerBuilderT23RNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH2 + categories.TECH3) - categories.COMMAND , 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2EngineerBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2 - categories.ENGINEERSTATION - categories.COMMAND, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T3EngineerBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 - categories.ENGINEERSTATION - categories.COMMAND , 1, 1, 'support', 'None' }
    },
}
PlatoonTemplate {
    Name = 'T23EngineerBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH2 + categories.TECH3) - categories.ENGINEERSTATION - categories.COMMAND, 1, 1, 'support', 'None' }
    },
}
PlatoonTemplate {
    Name = 'T3SACUEngineerBuilderRNG',
    Plan = 'EngineerBuildAIRNG',
    GlobalSquads = {
        { categories.ENGINEER * (categories.TECH3 + categories.SUBCOMMANDER) - categories.ENGINEERSTATION - categories.COMMAND, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerRepairRNG',
    Plan = 'RepairAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },
}