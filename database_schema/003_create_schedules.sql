-- Table for scheduling habits

CREATE TABLE schedules (
  -- Primary identifier
  sid UUID PRIMARY KEY
  DEFAULT gen_random_uuid(),
  
  --Foreign key
  hid UUID REFERENCES habits(hid) ON DELETE CASCADE,
  
  -- Schedule Info
  -- day of the week
  day INTEGER NOT NULL
  CHECK ( day BETWEEN 0 AND 6),
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  duration INTERVAL GENERATED ALWAYS AS (
    CASE 
    WHEN start_time < end_time
    THEN end_time - start_time
    ELSE (end_time + INTERVAL '24 hours') - start_time
    END )
    STORED,
    UNIQUE (hid, day, start_time)
);