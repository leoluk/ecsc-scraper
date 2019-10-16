
CREATE TABLE scoreboard
(
	date ALIAS toDate(timestamp),
	timestamp DateTime,
	team LowCardinality(String),
	score Int64

) ENGINE = MergeTree()
PARTITION BY toHour(timestamp)
ORDER BY (timestamp, team)
SETTINGS index_granularity=8192;
