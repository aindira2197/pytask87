CREATE TABLE Users (
  id INT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE Messages (
  id INT PRIMARY KEY,
  text TEXT,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Conversations (
  id INT PRIMARY KEY,
  user_id INT,
  bot_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (bot_id) REFERENCES Users(id)
);

CREATE TABLE Bot_Responses (
  id INT PRIMARY KEY,
  conversation_id INT,
  user_input TEXT,
  bot_response TEXT,
  FOREIGN KEY (conversation_id) REFERENCES Conversations(id)
);

INSERT INTO Users (id, username, password) VALUES (1, 'admin', 'password123');
INSERT INTO Users (id, username, password) VALUES (2, 'bot', 'password123');

INSERT INTO Messages (id, text, user_id) VALUES (1, 'Hello', 1);
INSERT INTO Messages (id, text, user_id) VALUES (2, 'Hi', 2);

INSERT INTO Conversations (id, user_id, bot_id) VALUES (1, 1, 2);

INSERT INTO Bot_Responses (id, conversation_id, user_input, bot_response) VALUES (1, 1, 'Hello', 'Hi');
INSERT INTO Bot_Responses (id, conversation_id, user_input, bot_response) VALUES (2, 1, 'How are you?', 'I am good, thanks');

CREATE PROCEDURE add_message(
  IN user_id INT,
  IN text TEXT
)
BEGIN
  INSERT INTO Messages (user_id, text) VALUES (user_id, text);
END;

CREATE PROCEDURE get_responses(
  IN conversation_id INT
)
BEGIN
  SELECT * FROM Bot_Responses WHERE conversation_id = conversation_id;
END;

CREATE PROCEDURE add_conversation(
  IN user_id INT,
  IN bot_id INT
)
BEGIN
  INSERT INTO Conversations (user_id, bot_id) VALUES (user_id, bot_id);
END;

CREATE PROCEDURE update_bot_response(
  IN conversation_id INT,
  IN user_input TEXT,
  IN bot_response TEXT
)
BEGIN
  INSERT INTO Bot_Responses (conversation_id, user_input, bot_response) VALUES (conversation_id, user_input, bot_response);
END;

CREATE FUNCTION get_user_id(
  IN username VARCHAR(255)
)
RETURNS INT
BEGIN
  DECLARE user_id INT;
  SELECT id INTO user_id FROM Users WHERE username = username;
  RETURN user_id;
END;

CREATE FUNCTION get_bot_id(
  IN conversation_id INT
)
RETURNS INT
BEGIN
  DECLARE bot_id INT;
  SELECT bot_id INTO bot_id FROM Conversations WHERE id = conversation_id;
  RETURN bot_id;
END;