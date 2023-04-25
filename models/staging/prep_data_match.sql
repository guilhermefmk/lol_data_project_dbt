{{ config(materialized='table') }}

select
    unique_id,
    gameId,
    game_mode,
    game_type,
    patch,
    {{ dbt_date.from_unixtimestamp("gameStartTimestamp", format="milliseconds") }} as gameStartTimestamp,
    {{ dbt_date.from_unixtimestamp("gameEndTimestamp", format="milliseconds") }} as gameEndTimestamp,
    {{ dbt_date.from_unixtimestamp("gameDuration") }} as gameDuration,
    {{ dbt_date.from_unixtimestamp("gameCreation", format="milliseconds") }} as gameCreation,
    assists,
    baronKills,
    champExperience,
    champLevel,
    championId,
    championName,
    championTransform,
    damageDealtToBuildings,
    damageDealtToObjectives,
    damageDealtToTurrets,
    damageSelfMitigated,
    deaths,
    detectorWardsPlaced,
    dragonKills,
    firstBloodKill,
    firstBloodAssist,
    firstTowerKill,
    gameEndedInSurrender,
    gameEndedInEarlySurrender,
    goldEarned,
    goldSpent,
    inhibitorKills,
    itemsPurchased,
    killingSprees,
    kills,
    largestCriticalStrike,
    largestKillingSpree,
    magicDamageDealt,
    magicDamageDealtToChampions,
    neutralMinionsKilled, 
    nexusKills, 
    nexusLost, 
    objectivesStolen, 
    pentaKills,
    physicalDamageDealt,
    physicalDamageDealtToChampions,
    physicalDamageTaken,
    puuid,
    teamPosition,
    totalDamageDealt,
    totalDamageDealtToChampions,
    totalDamageTaken,
    totalHeal,
    totalHealsOnTeammates,
    totalMinionsKilled,
    totalTimeCCDealt,
    trueDamageDealt,
    trueDamageDealtToChampions,
    visionScore,
    wardsKilled,
    wardsPlaced,
    win,
    timestamp as ingestion_date,
from {{ ref('stg_data_match') }}


{% if var('is_test_run', default=false) %}
  limit 100
{% endif %}
