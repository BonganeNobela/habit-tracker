CREATE TYPE status as ENUM ("uncompleted", "partially completed", "completed");

CREATE TABLE habits_logs (
  
  -- Primary identifier
  lid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- Foreign keys
  hid UUID NOT NULL REFERENCES habits(hid) ON DELETE CASCADE,
  sid UUID REFERENCES schedules(sid) ON DELETE NULL,
  -- Log Dates
  completion_date DATE NOT NULL,
  logged_at TIMESTAMPTZ DEFAULT NOW(),
  
  --Completion statuses
  completion status NOT NULL,
  percentage INT NOT NULL
  CHECK percentage BETWEEN 0 AND 100,
  
  -- Composite Constraint
  UNIQUE (hid, sid, completion_date)
  
);