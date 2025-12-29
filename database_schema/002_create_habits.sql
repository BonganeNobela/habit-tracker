--Table for habits
CREATE TABLE habits (
  -- Primary identifier
  hid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- Foreign key
  uid UUID REFERENCES users(uid) ON DELETE CASCADE,
  
  -- Name of the habit
  name VARCHAR(50) NOT NULL,
  
  -- Description of the habit
  description TEXT NOT NULL,
  
  -- Audit Columns
  created_at TIMESTAMPTZ DEFAULT NOW()
  
);