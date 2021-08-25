const API = 'http://example.com/v3/api';
// const API = 'http://192.168.0.106:8000/api';
// const API = 'http://192.168.0.113:8000/api';
// const API = 'http://103.217.108.51:8000/api';
const DB_VERSION = 3;
const USERS_DB = "Users";
const QUIZ_DB = "QuizEvents";
const COURSE_DB = "CourseEvents";
const QUESTION_DB = "QuestionEvents";
const ANSWER_DB = "AnswerEvents";
const LECTURE_DB = "LectureEvents";

const DB_FIELDS = [
  {
    "name": USERS_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'username TEXT',
      'apiToken TEXT',
      'loggedIn TEXT',
      'points INTEGER',
      'streak TEXT',
      'streakSubject INTEGER',
      'currentSessionId INTEGER',
    ]
  },
  {
    "name": QUIZ_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'streak TEXT',
      'streakSubject TEXT',
      'numberOfQuizes INTEGER',
      'points INTEGER',
      'duration INTEGER DEFAULT 0',
      'status TEXT',
      'startTime TEXT'
    ]
  },
  {
    "name": COURSE_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'courseName TEXT',
      'courseDuration DATETIME',
      'coursePrice INTEGER',
      'courseInstructor TEXT',
      'courseRating INTEGER DEFAULT 0',
      'status TEXT',
      'startTime TEXT'
    ]
  },
  {
    "name": LECTURE_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'lectureName TEXT',
      'lectureDuration DATETIME',
      'contents TEXT',
      'currentTime TEXT',
      'serverId INTEGER DEFAULT 0'
    ]
  },
  {
    "name": QUESTION_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'questionText TEXT',
      'questionText TEXT',
      'points INTEGER',
      'content TEXT',
      'currentTime TEXT',
      'serverId INTEGER DEFAULT 0'
    ]
  },
  {
    "name": ANSWER_DB,
    "fields": [
      'id INTEGER PRIMARY KEY',
      'lat TEXT',
      'lng TEXT',
      'status TEXT',
      'currentTime TEXT',
      'remark TEXT',
      'content TEXT',
      'sessionId INTEGER DEFAULT 0',
      'serverId INTEGER DEFAULT 0'
    ]
  }
];
