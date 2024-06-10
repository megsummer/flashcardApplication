BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('testUser', '$2a$10$K2P/D7sKYVvEJJbQYFieg.Y2LP.HHuhy/0fZ79Uw7CjrW9qqwqrMS', 'ROLE_ADMIN');



INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in prophase?', 'moo', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in prometaphase?', 'neigh', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in metaphase?', 'woof', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in Anaphase?', 'meow', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in Telophase?', 'baa', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Who is Leonardo da Vinci?:', 'cluck', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Who painted the Mona Lisa?', 'quack', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Explain the Law of Supply and Demand.', 'yippikakakaakaoooowww', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('car goes:', 'vroom', 3);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('truck goes:', 'honk', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('airplane goes:', 'whoosh', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a static property or method?', 'It belongs to the class as opposed to a specific object', 3);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Last element of an array of unknown length?', 'Element is the one at index .length -1', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What does the protected mean', 'Access modifier that allows properties or methods to be accessed by sub-classes', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Difference betwee = and ==', 'Single is assignment double is comparison', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Should you use == to check for a String value?', 'No use the equals method instead', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('How are maps and sets related?', 'The keys of the map are unique therefore the list of keys is a set', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What makes the do-while loop special?', "It's guaranteed to run once", 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a primary key?', 'Unique identifier for a row', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a foreign key?', 'A column that is a primary key on some other table', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a transaction?', 'A block of related sql statements that must all succeed or fail together', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is an associative table?', 'A table that results from the many to many relationship between two entities', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is the DAO pattern?', ' A Java design pattern that encapsulates communication with the database into a single class', 1);




INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (2, 'Animal Sounds', 'Do you know who lives on the farm?', true);
INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (3, 'Carnivore Sounds', 'Do you know who eats the meat?', true);
INSERT INTO decks (user_id, deck_title, deck_description) VALUES (3, 'Vehicle Sounds', 'Zoom Zoom');



INSERT INTO cards_to_decks (card_id, deck_id) VALUES (1, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (2, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (3, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (4, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (5, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (6, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (7, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (3, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (4, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (8, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (9, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (10, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (11, 3);

INSERT INTO cards_tags (card_id, tag) VALUES (3, 'pet');
INSERT INTO cards_tags (card_id, tag) VALUES (4, 'pet');
INSERT INTO cards_tags (card_id, tag) VALUES (7, 'pet');
INSERT INTO cards_tags (card_id, tag) VALUES (1, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (2, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (3, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (4, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (5, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (8, 'mammals');
INSERT INTO cards_tags (card_id, tag) VALUES (6, 'bird');
INSERT INTO cards_tags (card_id, tag) VALUES (11, 'bird');
INSERT INTO cards_tags (card_id, tag) VALUES (9, 'car');
INSERT INTO cards_tags (card_id, tag) VALUES (10, 'car');
INSERT INTO cards_tags (card_id, tag) VALUES (10, 'truck');
INSERT INTO cards_tags (card_id, tag) VALUES (2, 'fast');
INSERT INTO cards_tags (card_id, tag) VALUES (9, 'fast');




COMMIT TRANSACTION;
