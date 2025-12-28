CREATE TABLE Reminders (
  --Primary identifier
  rid UUID PRIMARY KEY
  DEFAULT gen_random_uuid(),
  
  -- Foreign keys
  hid UUID NOT NULL REFERENCES Habits(hid) ON DELETE CASCADE,
  sid UUID NOT NULL REFERENCES Schedules(sid) ON DELETE CASCADE, 
  
  --Reminder details
  reminder_time TIME NOT NULL,
  day INT NOT NULL
  CHECK (day BETWEEN 0 AND 6),
  active_from DATE DEFAULT NOW(),
  repeat BOOLEAN DEFAULT FALSE,
  is_active BOOLEAN DEFAULT TRUE
  
)