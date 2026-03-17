CREATE TABLE IF NOT EXISTS admin (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL, 
  email VARCHAR(255) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,}$'),
  password VARCHAR(255) NOT NULL,
  principal BOOLEAN DEFAULT false
);

CREATE TABLE IF NOT EXISTS post (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS contact (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  motif VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  email VARCHAR(255) NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,}$'),
  phonenumber VARCHAR(20) CHECK (phonenumber IS NULL OR phonenumber ~ '^\+?[0-9\s\-\(\)]{10,20}$'),
  active BOOLEAN DEFAULT true
);

CREATE TABLE IF NOT EXISTS blocked (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,}$'),
  phonenumber VARCHAR(20) CHECK (phonenumber IS NULL OR phonenumber ~ '^\+?[0-9\s\-\(\)]{10,20}$')
);
