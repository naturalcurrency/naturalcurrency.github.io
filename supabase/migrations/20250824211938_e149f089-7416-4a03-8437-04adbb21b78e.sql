-- Update the column name in snapshot_market_metrics to match the new administrative divisions concept
ALTER TABLE snapshot_market_metrics RENAME COLUMN city_id TO administrative_division_id;