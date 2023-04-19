{{ config(materialized='table') }}

select
    -- identifiers
    {{ dbt_utils.surrogate_key(['gameId', 'summonerName']) }} as game_id,
    cast(gameId as integer) as gameId,
    cast(gameMode as string) as game_mode,
    cast(gameType as string) as game_type,
    cast(patch as string) as patch,
    cast(gameStartTimestamp as integer) as gameStartTimestamp,
    cast(gameEndTimestamp as integer) as gameEndTimestamp,
    cast(gameDuration as integer) as gameDuration,
    cast(gameCreation as integer) as gameCreation,
    cast(assists as integer) as assists,
    cast(baronKills as integer) as baronKills,
    cast(champExperience as integer) as champExperience,
    cast(champLevel as integer) as champLevel,
    cast(championId as integer) as championId,
    cast(championName as string) as championName,
    -- This field is currently only utilized for Kayn's transformations. (Legal values: 0 - None, 1 - Slayer, 2 - Assassin)
    cast(championTransform as integer) as championTransform,
    cast(damageDealtToBuildings as integer) as damageDealtToBuildings,
    cast(damageDealtToObjectives as integer) as damageDealtToObjectives,
    cast(damageDealtToTurrets as integer) as damageDealtToTurrets,
    cast(damageSelfMitigated as integer) as damageSelfMitigated,
    cast(deaths as integer) as deaths,
    cast(detectorWardsPlaced as integer) as detectorWardsPlaced,
    cast(dragonKills as integer) as dragonKills,
    cast(firstBloodKill as boolean) as firstBloodKill,
    cast(firstBloodAssist as boolean) as firstBloodAssist,
    cast(firstTowerKill as boolean) as firstTowerKill,
    cast(gameEndedInSurrender as boolean) as gameEndedInSurrender,
    cast(gameEndedInEarlySurrender as boolean) as gameEndedInEarlySurrender,
    cast(goldEarned as integer) as goldEarned,
    cast(goldSpent as integer) as goldSpent,
    cast(inhibitorKills as integer) as inhibitorKills,
    cast(itemsPurchased as integer) as itemsPurchased,
    cast(killingSprees as integer) as killingSprees,
    cast(kills as integer) as kills,
    cast(largestCriticalStrike as integer) as largestCriticalStrike,
    cast(largestKillingSpree as integer) as largestKillingSpree,
    cast(magicDamageDealt as integer) as magicDamageDealt,
    cast(magicDamageDealtToChampions as integer) as magicDamageDealtToChampions,
    cast(neutralMinionsKilled as integer) as neutralMinionsKilled, 
    cast(nexusKills as integer) as nexusKills, 
    cast(nexusLost as integer) as nexusLost, 
    cast(objectivesStolen as integer) as objectivesStolen, 
    cast(pentaKills as integer) as pentaKills,
    cast(physicalDamageDealt as integer) as physicalDamageDealt,
    cast(physicalDamageDealtToChampions as integer) as physicalDamageDealtToChampions,
    cast(physicalDamageTaken as integer) as physicalDamageTaken,
    cast(puuid as string) as puuid,
    cast(teamPosition as string) as teamPosition,
    cast(totalDamageDealt as integer) as totalDamageDealt,
    cast(totalDamageDealtToChampions as integer) as totalDamageDealtToChampions,
    cast(totalDamageTaken as integer) as totalDamageTaken,
    cast(totalHeal as integer) as totalHeal,
    cast(totalHealsOnTeammates as integer) as totalHealsOnTeammates,
    cast(totalMinionsKilled as integer) as totalMinionsKilled,
    cast(totalTimeCCDealt as integer) as totalTimeCCDealt,
    cast(trueDamageDealt as integer) as trueDamageDealt,
    cast(trueDamageDealtToChampions as integer) as trueDamageDealtToChampions,
    cast(visionScore as integer) as visionScore,
    cast(wardsKilled as integer) as wardsKilled,
    cast(wardsPlaced as integer) as wardsPlaced,
    cast(win as boolean) as win,
    cast(timestamp as timestamp) as timestamp,
from {{ source('staging', 'match_data_raw') }}


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}