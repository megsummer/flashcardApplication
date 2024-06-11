BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');




INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in prophase?', 'DNA is copied when spindles form.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in prometaphase?', 'A copy is made of the centrosome', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in metaphase?', 'The chromosones line up at the metaphase plate.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in Anaphase?', 'The microtublies push the poles apart and pull the chromosones to the poles.', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in Telophase?', 'The chromosomes start to decondense, the spindles disappear, and nucleolus reforms', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Who is Leonardo da Vinci?:', 'Renaissance artist and inventor', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Who painted the Mona Lisa?', 'Leonardo da Vinci', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Explain the Law of Supply and Demand.', 'When supply is low and demand is high, price is high.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Define microeconomics:', 'The study of economic decisions made by individual consumers and businesses', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is the invisible hand theory', 'An idea by English economist Adam Smith. The idea is that individuals follow their own self-interest in economic matters, but that doing so may lead to the best results for society as a whole.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is market economy?', 'An economy in which the "marketplace" of consumers determines supply and demand; which affects investments, spending, and pricing', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a static property or method?', 'It belongs to the class as opposed to a specific object', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Last element of an array of unknown length?', 'Element is the one at index .length -1', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What does the protected mean', 'Access modifier that allows properties or methods to be accessed by sub-classes', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Difference between = and ==', 'Single is assignment double is comparison', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Should you use == to check for a String value?', 'No use the equals method instead', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('How are maps and sets related?', 'The keys of the map are unique therefore the list of keys is a set', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What makes the do-while loop special?', 'It is guaranteed to run once', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a primary key?', 'Unique identifier for a row', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a foreign key?', 'A column that is a primary key on some other table', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is a transaction?', 'A block of related sql statements that must all succeed or fail together', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is an associative table?', 'A table that results from the many to many relationship between two entities', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What is the DAO pattern?', ' A Java design pattern that encapsulates communication with the database into a single class', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Similarities between Baroque architecture and ancient Greek architecture', 'Both of these architectural styles used optical illusions.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('The Basilica of St. Peter, in this area of Rome, was designed by Baroque architects.?', 'The Vatican', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('The Palace of Versailles', 'This residence of Louis XIV can be considered to be the premier example of Baroque architecture in Europe.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Examples of cultural blending in art from Medieval Europe', 'The Franks Casket and the Book of Durrow', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Define: clamp', 'A face-off move where the player pushes his stick down on top of the ball to gain control.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Define: cradling', 'Rocking the stick back and forth in the hands to create centrifugal force that keeps the ball in the pocket.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Define: back door', 'An offensive cuts behind their defender to receive a pass.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ( 'Define: Baggataway', 'A form of lacrosse as played originally by the Ojibwa Indians.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Crease dimensions', 'Men’s game: 9 feet. Women’s game: 8.5 feet. In the National Lacrosse League: 9 feet, 3 inches.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Define: goose', 'Leonardo da Vinci', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('Long Stick Midfielder', 'Leonardo da Vinci', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('NCAA stands for:', 'Leonardo da Vinci', 1);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('On the Hop means:', 'When a player uses his stick to knock a ground ball to an open teammate, rather than picking it up.', 2);
INSERT INTO cards (front_question, back_answer, user_id) VALUES ('What happens in a slow break?', 'A transition opportunity for the offense in which the defense has at least an equal number of defenders to offensive players in position and ready to defend.', 2);





INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (2, 'Mitosis Review', 'Review the stages of mitosis', true);
INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (1, 'Economics Vocab', 'Review terms from chapter two.', true);
INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (2, 'Renaissance Art Midterm', 'Study Guide for midterm art 2300', true);
INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (1, 'Lacrosse', 'Lacrosse terms, rules, and history', true);
INSERT INTO decks (user_id, deck_title, deck_description, is_approved) VALUES (1, 'Software Developer Interview Questions', 'Prepare for your upcoming interview!', true);



INSERT INTO cards_to_decks (card_id, deck_id) VALUES (1, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (2, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (3, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (4, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (5, 1);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (6, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (7, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (8, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (9, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (10, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (11, 2);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (12, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (13, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (14, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (15, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (16, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (17, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (18, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (19, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (20, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (21, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (22, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (23, 5);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (24, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (25, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (26, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (27, 3);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (28, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (29, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (30, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (31, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (32, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (33, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (34, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (35, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (36, 4);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (37, 4);




INSERT INTO cards_tags (card_id, tag) VALUES (1, 'biology');
INSERT INTO cards_tags (card_id, tag) VALUES (1, 'mitosis');
INSERT INTO cards_tags (card_id, tag) VALUES (2, 'biology');
INSERT INTO cards_tags (card_id, tag) VALUES (2, 'mitosis');
INSERT INTO cards_tags (card_id, tag) VALUES (3, 'biology');
INSERT INTO cards_tags (card_id, tag) VALUES (3, 'mitosis');
INSERT INTO cards_tags (card_id, tag) VALUES (4, 'biology');
INSERT INTO cards_tags (card_id, tag) VALUES (4, 'mitosis');
INSERT INTO cards_tags (card_id, tag) VALUES (5, 'biology');
INSERT INTO cards_tags (card_id, tag) VALUES (5, 'mitosis');
INSERT INTO cards_tags (card_id, tag) VALUES (28, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (29, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (30, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (31, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (32, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (33, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (34, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (35, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (36, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (37, 'sports');
INSERT INTO cards_tags (card_id, tag) VALUES (13, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (13, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (14, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (14, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (15, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (15, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (16, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (16, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (17, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (17, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (18, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (18, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (19, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (19, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (20, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (20, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (21, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (21, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (22, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (22, 'software development');
INSERT INTO cards_tags (card_id, tag) VALUES (23, 'tech');
INSERT INTO cards_tags (card_id, tag) VALUES (23, 'software development');







COMMIT TRANSACTION;
