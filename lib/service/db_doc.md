
-- 프로그램 테이블
CREATE TABLE programs (
  program_uid TEXT NOT NULL PRIMARY KEY,
  program_title TEXT NOT NULL,
  program_description TEXT NOT NULL,
  program_time_in_seconds INTEGER NOT NULL
);

-- 프로그램 세션 테이블 
CREATE TABLE sessions (
  session_uid TEXT NOT NULL PRIMARY KEY,
  program_uid TEXT NOT NULL REFERENCES programs(program_uid),
  session_title TEXT NOT NULL,
  session_time_in_seconds INTEGER NOT NULL,
  session_priority INTEGER NOT NULL
);

-- 프로그램 실행 히스토리 테이블
CREATE TABLE program_histories (
  history_uid TEXT NOT NULL PRIMARY KEY,
  program_uid TEXT NOT NULL REFERENCES programs(program_uid),
  started_at DATETIME NOT NULL,
  ended_at DATETIME,
  total_progressed_time_in_seconds INTEGER NOT NULL
);

-- 세션 실행 히스토리 테이블 
CREATE TABLE session_histories (
  session_history_uid TEXT NOT NULL PRIMARY KEY,
  program_history_uid TEXT NOT NULL REFERENCES program_histories(history_uid),
  session_uid TEXT NOT NULL REFERENCES sessions(session_uid),
  progressed_time_in_seconds INTEGER NOT NULL
);