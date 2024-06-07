BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('testUser', '$2a$10$K2P/D7sKYVvEJJbQYFieg.Y2LP.HHuhy/0fZ79Uw7CjrW9qqwqrMS', 'ROLE_ADMIN');



INSERT INTO cards (front_question, back_answer, user_id) VALUES ('cow goes:', 'moo', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('horse goes:', 'neigh', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('dog goes:', 'woof', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('cat goes:', 'meow', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('goat goes:', 'baa', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('chicken goes:', 'cluck', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('duck goes:', 'quack', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('fox goes:', 'yippikakakaakaoooowww', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('car goes:', 'vroom', 3);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('truck goes:', 'honk', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('airplane goes:', 'whoosh', 3);



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
