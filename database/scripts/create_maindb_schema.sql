DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS USERS_SETTINGS CASCADE;
DROP TABLE IF EXISTS CHESS_DATABASES CASCADE;
DROP TABLE IF EXISTS CHESS_DATABASES_SHARING CASCADE;
DROP TABLE IF EXISTS ENGINE_INFO CASCADE;

CREATE TABLE USERS(
  ID UUID PRIMARY KEY NOT NULL,
  USERNAME VARCHAR(50) NOT NULL,
  PASSWORD BYTEA NOT NULL,
  SALT BYTEA NOT NULL,
  UNIQUE (USERNAME)
);

CREATE TABLE USERS_SETTINGS(
    USER_ID UUID NOT NULL,
    KEY TEXT NOT NULL,
    VALUE TEXT,
    UNIQUE (USER_ID, KEY)
);

CREATE TABLE CHESS_DATABASES(
  ID UUID PRIMARY KEY NOT NULL,
  USER_ID UUID NOT NULL,
  NAME TEXT NOT NULL,
  UNIQUE (NAME)
);

CREATE TABLE CHESS_DATABASES_SHARING(
    OWNER_ID UUID NOT NULL,
    USER_ID UUID NOT NULL,
    DATABASE_ID UUID NOT NULL,
    UNIQUE (OWNER_ID, USER_ID, DATABASE_ID)
);

CREATE TABLE ENGINE_INFO(
    FEN TEXT NOT NULL,
    DEPTH INT NULL,
    SCORE_IN_CENTI_PAWN FLOAT NULL,
    PROCESSING_TIME TEXT NULL,
    MOVES_CHAIN TEXT NULL
);