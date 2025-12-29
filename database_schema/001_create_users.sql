
CREATE TABLE users (
    -- Primary Identity
    uid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    
    -- User Details
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    
    -- Email Format Validation
    CONSTRAINT valid_email_check CHECK (
        email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    )
);
