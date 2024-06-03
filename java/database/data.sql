BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');




INSERT INTO cards (front_question, back_answer, user_id) VALUES ('cow goes:', 'moo', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('horse goes:', 'neigh', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('dog goes:', 'woof', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('cat goes:', 'meow', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('goat goes:', 'baa', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('chicken goes:', 'cluck', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('duck goes:', 'quack', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('fox goes:', 'yippikakakaakaoooowww', 2);


INSERT INTO decks (user_id, deck_title, deck_description) VALUES (2, 'Animal Sounds', 'Do you know who lives on the farm?');
INSERT INTO decks (user_id, deck_title, deck_description) VALUES (2, 'Carnivore Sounds', 'Do you know who eats the meat?');

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
INSERT INTO cards_tags (card_id, tag) VALUES (7, 'bird');



COMMIT TRANSACTION;
