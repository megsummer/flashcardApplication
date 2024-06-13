BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('demo','$2a$10$tNjdu/0ybFPPZstRw9XL6uiYlvVNfFqHecApv1zSAircyKyJ0I7oW','ROLE_USER');

INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in prophase?', 'DNA is copied when spindles form.', 'https://upload.wikimedia.org/wikipedia/commons/3/39/Prophase_eukaryotic_mitosis.svg',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in prometaphase?', 'A copy is made of the centrosome', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Prometaphase.svg/220px-Prometaphase.svg.png',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in metaphase?', 'The chromosones line up at the metaphase plate.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Spindle_chromosomes-en.png/250px-Spindle_chromosomes-en.png', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in Anaphase?', 'The microtublies push the poles apart and pull the chromosones to the poles.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Spindle_chromosomes-en.png/250px-Spindle_chromosomes-en.png', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in Telophase?', 'The chromosomes start to decondense, the spindles disappear, and nucleolus reforms', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Telophase_eukaryotic_mitosis.svg/300px-Telophase_eukaryotic_mitosis.svg.png',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Who is Leonardo da Vinci?:', 'Renaissance artist and inventor', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Francesco_Melzi_-_Portrait_of_Leonardo.png/800px-Francesco_Melzi_-_Portrait_of_Leonardo.png',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Who painted the Mona Lisa?', 'Leonardo da Vinci', 'https://cdn.pixabay.com/photo/2024/05/19/02/49/ai-generated-8771371_1280.png',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Explain the Law of Supply and Demand.', 'When supply is low and demand is high, price is high.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Supply-and-demand.svg/260px-Supply-and-demand.svg.png',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define microeconomics:', 'The study of economic decisions made by individual consumers and businesses', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Production_Possibilities_Frontier_Curve.svg/220px-Production_Possibilities_Frontier_Curve.svg.png', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is the invisible hand theory', 'An idea by English economist Adam Smith. The idea is that individuals follow their own self-interest in economic matters, but that doing so may lead to the best results for society as a whole.', 'https://t3.ftcdn.net/jpg/01/26/45/40/240_F_126454005_SVhIzfDGujWYTbcCzGTojeVH0erpdRVv.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is market economy?', 'An economy in which the "marketplace" of consumers determines supply and demand; which affects investments, spending, and pricing', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Pike_Place_Market%2C_Economy_Market_arcade%2C_1968.jpg/300px-Pike_Place_Market%2C_Economy_Market_arcade%2C_1968.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is a static property or method?', 'It belongs to the class as opposed to a specific object', 'https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2019/07/Static-Method-In-Java.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Last element of an array of unknown length?', 'Element is the one at index .length -1', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA0sDUeILHVYrp9HrA2zuOnDnJ4cdxkimRwg&s', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What does the protected mean', 'Access modifier that allows properties or methods to be accessed by sub-classes', 'https://external-preview.redd.it/u9ljW9-nDUhIxYy2bmhIFnJpsNZ9HJDKQNjZ3CADVbs.jpg?width=640&crop=smart&auto=webp&s=7b28c32f2034c969c59db79531cab288ed87c5b6',1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Difference between = and ==', 'Single is assignment double is comparison', 'https://javaconceptoftheday.com/wp-content/uploads/2015/04/AndEqualsMethod.png', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Should you use == to check for a String value?', 'No use the equals method instead','https://qph.cf2.quoracdn.net/main-qimg-2dbd55cc2f62c989535634330ab6c300-lq', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('How are maps and sets related?', 'The keys of the map are unique therefore the list of keys is a set', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu2Hpx1r_y6Zftxhqg9JdyRZGIviLYL1i431nHtBWy1_XIfUZHlBDz-CGAlLkh-QsXDro&usqp=CAU',1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What makes the do-while loop special?', 'It is guaranteed to run once', 'https://media.geeksforgeeks.org/wp-content/uploads/20191118154342/do-while-Loop-GeeksforGeeks2.jpg',1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is a primary key?', 'Unique identifier for a row', 'https://support.content.office.net/en-us/media/2b3f79b2-7629-44f8-a0c5-2c6f72bfd935.gif',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is a foreign key?', 'A column that is a primary key on some other table', 'https://cdn.educba.com/academy/wp-content/uploads/2020/03/oracle-foriegn-key.jpg',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is a transaction?', 'A block of related sql statements that must all succeed or fail together', 'https://media.geeksforgeeks.org/wp-content/uploads/20230915172115/Transaction-in-dbms.png', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is an associative table?', 'A table that results from the many to many relationship between two entities','https://i0.wp.com/rtpopendata.com/wp-content/uploads/2019/11/2019-11-10_6-13-37.jpg?resize=584%2C295&ssl=1', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What is the DAO pattern?', ' A Java design pattern that encapsulates communication with the database into a single class', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1okvxZXA3cW6oRuRCz32Rizeeq4IfsJXjtA&s',1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Similarities between Baroque architecture and ancient Greek architecture', 'Both of these architectural styles used optical illusions.','https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/St_Paul%27s_Cathedral%2C_London%2C_UK.jpg/420px-St_Paul%27s_Cathedral%2C_London%2C_UK.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('The Basilica of St. Peter, in this area of Rome, was designed by Baroque architects.?', 'The Vatican','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Basilica_di_San_Pietro_in_Vaticano_September_2015-1a.jpg/270px-Basilica_di_San_Pietro_in_Vaticano_September_2015-1a.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('The Palace of Versailles', 'This residence of Louis XIV can be considered to be the premier example of Baroque architecture in Europe.','https://cdn.britannica.com/65/114465-050-8C96BD81/Hall-of-Mirrors-ceiling-Jules-Hardouin-Mansart-Charles.jpg',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Examples of cultural blending in art from Medieval Europe', 'The Franks Casket and the Book of Durrow','https://www.whataportrait.com/media/wordpress/7dc0e8f1685f49056824b53f69318923.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define: clamp', 'A face-off move where the player pushes his stick down on top of the ball to gain control.','https://i0.wp.com/bachelor.wabash.edu/wp-content/uploads/2023/03/IMG_2923-1.jpg?fit=1012%2C807&ssl=1', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define: cradling', 'Rocking the stick back and forth in the hands to create centrifugal force that keeps the ball in the pocket.', 'https://www.summitperformanceconsulting.com/wp-content/uploads/2014/02/shutterstock_112567019.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define: back door', 'An offensive cuts behind their defender to receive a pass.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSuLoapeqChKugSkiGD-7LIP3PQ9xHCbowfg&s',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define: Baggataway', 'A form of lacrosse as played originally by the Ojibwa Indians.', 'https://timothykestrel.com/wp-content/uploads/2016/02/The-Catch-by-Robert-Griffing.jpg',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Crease dimensions', 'Mens game: 9 feet. Womens game: 8.5 feet. In the National Lacrosse League: 9 feet, 3 inches.', 'https://www.trumarkathletics.com/Userfiles/Page-Images/LacrosseYouthnHSDimensions.jpg',2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Define: goose', 'A large waterbird with a long neck, short legs, webbed feet, and a short broad bill.', 'https://media.istockphoto.com/id/157427656/photo/canada-goose-on-white.jpg?s=612x612&w=0&k=20&c=Uh_C6VinyMFQrPtHRI9MBwsBhRvIPPxHIOV-MzPFVkc=',1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Long Stick Midfielder', 'Leonardo da Vinci', 'https://cdn.images.insidelacrosse.com/legacy/imagesimages/032510_bmalphrus.jpg', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('NCAA stands for:', 'National Collegiate Athletic Association', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/NCAA_logo.svg/150px-NCAA_logo.svg.png', 1);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('On the Hop means:', 'When a player uses his stick to knock a ground ball to an open teammate, rather than picking it up.', 'https://i.ytimg.com/vi/iXY8mjzs-q4/maxresdefault.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('What happens in a slow break?', 'A transition opportunity for the offense in which the defense has at least an equal number of defenders to offensive players in position and ready to defend.', 'https://i.ytimg.com/vi/7eLNjmcPdN8/sddefault.jpg', 2);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Hi Stephen !!', 'Stephen Herzog.', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718293431/gnhl6lhdw3mmesbijyqp.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Chris Cook', 'Chris Cook.', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718293477/a5hnbsggqwauxv42xfyl.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Devon Mercadante', 'Devon Mercadante', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718298029/wgecledlanl1ptz5nxsm.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Dinda O''Brien', 'Dinda O''Brien', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718298232/lxibk0zjam8ikfvs1laf.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jake Stephens', 'Jake Stephens', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718298640/zkrjwg6y4yy4kltyqun0.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jessica Ford', 'Jessica Ford', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718298835/tspu9g7t7r67s9liticw.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Megan Trigg', 'Megan Trigg', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718299215/pd9leegairimznad2156.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Mike Gatta', 'Mike Gatta', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718299364/s4j6fxoqijai023z5fca.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Nathan Dickinson', 'Nathan Dickinson', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718299588/r5xubwiryncpgotspe9n.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Nimensio Johnson', 'Nimensio (Nimo) Johnson', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718299819/nsjk01plflyqohc8ds6a.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Quinn Kacirek', 'Quinn Kacirek', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718300437/nnyhjkkdtj1zvp0xh870.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Suvichada Pinittanond', 'Suvichada Pinittanond', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718300636/iybkldswgnfsrdwjtafa.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Zachary Evans', 'Zachary Evans', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718300877/o4jbzqedkbeogreaueyt.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Victor Cushman', 'Victor Cushman', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718301025/hlgw74v653wwwb0xyjte.jpg',3);

INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Adil Shad', 'Adil Shad', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718301404/xzpkkx7hupan5yon2vct.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Alex Mauriz', 'Alex Mauriz', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718301529/dnl3azmgavsls20molby.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Daniel Ammerman', 'Daniel Ammerman', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718301731/p4zynvwvrhoaygosftb1.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Iqra Shad', 'Igra Shad', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302117/eixge3xqjnkjb0y3mkp9.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jack Ciafardo', 'Jack Ciafardo', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302295/cbi3ztugundq4tm9g9kl.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jamar Watson', 'Jamar Watson', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302393/ee67jhqwrmvlb6yrnoxa.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jesse Stewart', 'Jesse Stewart', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302518/sayjcne1jkmjw9kggtqh.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Karla Wallace', 'Karla Wallace', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302682/pctahlvkkhmvs512eplx.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Kevin Oswald', 'Kevin Oswald', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718302943/rehfpvuaaljlahunvkbm.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Kinsey Christensen', 'Kinsey Christensen', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718303292/qne5j8g8jygmpbhdvfl9.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Sean McMann', 'Sean McMann', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718303711/xsqb4nvqia7fu9uxzzcp.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Sonali Panda', 'Sonali Panda', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718303847/ta3gf1uxxax7ea9xbf4g.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Melvina Jacobs', 'Melvina Jacobs', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718304357/dtjkfqaiilpjdvfr5brx.jpg',3);

INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Barrett Cahalen', 'Barrett Cahalen', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718305972/w5dvmlfuglhw3pds9xbk.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Braxton Bertolette', 'Braxton Bertolette', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306039/o8qy0b3tigmkmnc4pxsb.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Cody Osei', 'Cody Osei', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306093/y83zcgw6v6lucgz0jisz.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jennifer Nail', 'Jennifer Nail', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306155/uhu96giilhkfcqisibgu.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Jeremy McKeever', 'Jeremy McKeever', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306215/xdyutmhaburkjacleitw.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Koi McCormick', 'Koi McCormick', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306277/zxbj4y8gxrvkhntlmdij.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Kristi Norris', 'Kristi Norris', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306332/weiedjgx5zdhbgldumhb.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Karlo Kilgore', 'Karlo Kilgore', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306398/hklmiylnmqz83cg0izrg.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Lauren Gates', 'Lauren Gates', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306861/jbrp5s3wvzezx5js4rdo.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Lines Sultzer', 'Lines Sultzer', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306912/sapzt4iioszykjdtzohj.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Maria Kofinas', 'Maria Kofinas', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718306995/nlhfbofzxzabbbkkn2fj.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Matthew Cable', 'Matthew Cable', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718307049/sq7cvndjpxgvlvgam81x.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Nolan Shay', 'Nolan Shay', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718307213/xaemlojbuje0hium8qm4.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Seth Chesky', 'Seth Chesky', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718307271/yahegvn0qmrv9uieouu3.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Shyee Meng', 'Shyee Meng', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718307324/cm2v2dncgpsw5covac6j.jpg',3);

INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Andy Chong Sam', 'Andy Chong Sam', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718309852/xgrd8d7ekqtahv7ajtci.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Christopher Guarnera', 'Christopher Guarnera', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718309908/wmzipzvpb5kk1bkfmeoe.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Yoav Morahg', 'Yoav Morahg', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718309962/jngx4k0nykvmagekthge.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Walt Impellicceiri', 'Walt Impellicceiri', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718310019/t9da6b48khxzbd3u0ruh.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Rachel Rysz', 'Rachel Rysz', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311197/i9bhtbojyqra3e3trygz.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Lisa Sydney', 'Lisa Sydney', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311343/uqoysiyvomodc8hsnqd1.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Robert Schleper', 'Robert Schleper', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311419/rhnpp6bemsqulcs3shjb.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('AJ Page', 'AJ Page', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311460/sj1u4lmwdcuppkh5lmsz.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Zach Snyder', 'Zach Snyder', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311549/roen0mushqzthgoeyxy5.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('David Evans', 'David Evans', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311699/qygjosvro5hjx33arwip.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Matthew Cabriales', 'Matthew Cabriales', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311743/aaq3ihtyf2cxumvi5yeu.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Joseph Peloso', 'Joseph Peloso', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311921/bcf62awglhzrqsdag0zc.jpg',3);
INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES ('Justin Parker', 'Justin Parker', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718311979/dktlwv6uym1lcmfjsnpy.jpg',3);



INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (2, 'Mitosis Review', 'Review the stages of mitosis', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Major_events_in_mitosis.svg/350px-Major_events_in_mitosis.svg.png',true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (1, 'Economics Vocab', 'Review terms from chapter two.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Supply-demand-right-shift-demand.svg/220px-Supply-demand-right-shift-demand.svg.png',true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (2, 'Renaissance Art Midterm', 'Study Guide for midterm art 2300', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg/400px-Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg', true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (1, 'Lacrosse', 'Lacrosse terms, rules, and history', 'https://t3.ftcdn.net/jpg/02/72/57/60/360_F_272576042_Sf8uuMwjnoUpmrx3s7kBOi72iWKMd6Hv.jpg', true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (1, 'Software Developer Interview Questions', 'Prepare for your upcoming interview!', 'https://www.techelevator.com/wp-content/uploads/2022/02/Students-Columbus-program_i-scaled.jpeg', true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (3, 'Tech Elevator NLR-20 Colleagues', 'Graduating Colleagues Spring 2024', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718295581/wkke82bqpehbwr5x4zon.png', true);
INSERT INTO decks (user_id, deck_title, deck_description, cover_img, is_approved) VALUES (3, 'Tech Elevator NLR-20 Staff', 'NLR-20 Support Staff Spring 2024', 'http://res.cloudinary.com/dvxtx3qq6/image/upload/v1718309165/oktlbgskawmnup4wgwa0.png', true);


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
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (38, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (39, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (40, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (41, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (42, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (43, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (44, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (45, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (46, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (47, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (48, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (49, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (50, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (51, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (52, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (53, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (54, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (55, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (56, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (57, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (58, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (59, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (60, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (61, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (62, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (63, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (64, 6);

INSERT INTO cards_to_decks (card_id, deck_id) VALUES (65, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (66, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (67, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (68, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (69, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (70, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (71, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (72, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (73, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (74, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (75, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (76, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (77, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (78, 6);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (79, 6);

INSERT INTO cards_to_decks (card_id, deck_id) VALUES (80, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (81, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (82, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (83, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (84, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (85, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (86, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (87, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (88, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (89, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (90, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (91, 7);
INSERT INTO cards_to_decks (card_id, deck_id) VALUES (92, 7);

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
INSERT INTO cards_tags (card_id, tag) VALUES (38, 'stephen');
INSERT INTO cards_tags (card_id, tag) VALUES (38, 'stephen herzog');
INSERT INTO cards_tags (card_id, tag) VALUES (38, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (39, 'chris');
INSERT INTO cards_tags (card_id, tag) VALUES (39, 'chris cook');
INSERT INTO cards_tags (card_id, tag) VALUES (39, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (40, 'devon');
INSERT INTO cards_tags (card_id, tag) VALUES (40, 'devon mercadante');
INSERT INTO cards_tags (card_id, tag) VALUES (40, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (41, 'dinda');
INSERT INTO cards_tags (card_id, tag) VALUES (41, 'dinda o brien');
INSERT INTO cards_tags (card_id, tag) VALUES (41, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (42, 'jake');
INSERT INTO cards_tags (card_id, tag) VALUES (42, 'jake stephens');
INSERT INTO cards_tags (card_id, tag) VALUES (42, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (43, 'jessica');
INSERT INTO cards_tags (card_id, tag) VALUES (43, 'jessica ford');
INSERT INTO cards_tags (card_id, tag) VALUES (43, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (44, 'megan');
INSERT INTO cards_tags (card_id, tag) VALUES (44, 'megan trigg');
INSERT INTO cards_tags (card_id, tag) VALUES (44, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (45, 'mike');
INSERT INTO cards_tags (card_id, tag) VALUES (45, 'mike gatta');
INSERT INTO cards_tags (card_id, tag) VALUES (45, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (46, 'nathan');
INSERT INTO cards_tags (card_id, tag) VALUES (46, 'nathan dickinson');
INSERT INTO cards_tags (card_id, tag) VALUES (46, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (47, 'nimensio');
INSERT INTO cards_tags (card_id, tag) VALUES (47, 'nimensio johnson');
INSERT INTO cards_tags (card_id, tag) VALUES (47, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (47, 'nimo');
INSERT INTO cards_tags (card_id, tag) VALUES (48, 'quinn');
INSERT INTO cards_tags (card_id, tag) VALUES (48, 'quinn kacirek');
INSERT INTO cards_tags (card_id, tag) VALUES (48, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (49, 'suvichada');
INSERT INTO cards_tags (card_id, tag) VALUES (49, 'suvichada pinittanond');
INSERT INTO cards_tags (card_id, tag) VALUES (49, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (50, 'zachary');
INSERT INTO cards_tags (card_id, tag) VALUES (50, 'zachary evans');
INSERT INTO cards_tags (card_id, tag) VALUES (50, 'blue');
INSERT INTO cards_tags (card_id, tag) VALUES (51, 'victor');
INSERT INTO cards_tags (card_id, tag) VALUES (51, 'victor cushman');
INSERT INTO cards_tags (card_id, tag) VALUES (51, 'blue');

INSERT INTO cards_tags (card_id, tag) VALUES (52, 'adil');
INSERT INTO cards_tags (card_id, tag) VALUES (52, 'adil shad');
INSERT INTO cards_tags (card_id, tag) VALUES (52, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (53, 'alex');
INSERT INTO cards_tags (card_id, tag) VALUES (53, 'alex mauriz');
INSERT INTO cards_tags (card_id, tag) VALUES (53, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (54, 'daniel');
INSERT INTO cards_tags (card_id, tag) VALUES (54, 'daniel ammerman');
INSERT INTO cards_tags (card_id, tag) VALUES (54, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (55, 'iqra');
INSERT INTO cards_tags (card_id, tag) VALUES (55, 'iqra shad');
INSERT INTO cards_tags (card_id, tag) VALUES (55, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (56, 'jack');
INSERT INTO cards_tags (card_id, tag) VALUES (56, 'jack ciafardo');
INSERT INTO cards_tags (card_id, tag) VALUES (56, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (57, 'jamar');
INSERT INTO cards_tags (card_id, tag) VALUES (57, 'jamar watson');
INSERT INTO cards_tags (card_id, tag) VALUES (57, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (58, 'jamar');
INSERT INTO cards_tags (card_id, tag) VALUES (58, 'jamar watson');
INSERT INTO cards_tags (card_id, tag) VALUES (58, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (59, 'karla');
INSERT INTO cards_tags (card_id, tag) VALUES (59, 'karla wallace');
INSERT INTO cards_tags (card_id, tag) VALUES (59, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (60, 'kevin oswald');
INSERT INTO cards_tags (card_id, tag) VALUES (60, 'kevin oswald');
INSERT INTO cards_tags (card_id, tag) VALUES (60, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (61, 'kinsey christensen');
INSERT INTO cards_tags (card_id, tag) VALUES (61, 'kinsey christensen');
INSERT INTO cards_tags (card_id, tag) VALUES (61, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (62, 'sean mcmann');
INSERT INTO cards_tags (card_id, tag) VALUES (62, 'sean mcmann');
INSERT INTO cards_tags (card_id, tag) VALUES (62, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (63, 'sonali panda');
INSERT INTO cards_tags (card_id, tag) VALUES (63, 'sonali panda');
INSERT INTO cards_tags (card_id, tag) VALUES (63, 'purple');
INSERT INTO cards_tags (card_id, tag) VALUES (64, 'melvina');
INSERT INTO cards_tags (card_id, tag) VALUES (64, 'melvina jacobs');
INSERT INTO cards_tags (card_id, tag) VALUES (64, 'purple');

INSERT INTO cards_tags (card_id, tag) VALUES (65, 'barrett cahalen');
INSERT INTO cards_tags (card_id, tag) VALUES (65, 'barrett cahalen');
INSERT INTO cards_tags (card_id, tag) VALUES (65, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (65, 'meal planner');


INSERT INTO cards_tags (card_id, tag) VALUES (66, 'braxton bertolette');
INSERT INTO cards_tags (card_id, tag) VALUES (66, 'braxton bertolette');
INSERT INTO cards_tags (card_id, tag) VALUES (66, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (66, 'ranked choice voting');


INSERT INTO cards_tags (card_id, tag) VALUES (67, 'cody osei');
INSERT INTO cards_tags (card_id, tag) VALUES (67, 'cody osei');
INSERT INTO cards_tags (card_id, tag) VALUES (67, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (67, 'message board');


INSERT INTO cards_tags (card_id, tag) VALUES (68, 'jennifer nail');
INSERT INTO cards_tags (card_id, tag) VALUES (68, 'jennifer nail');
INSERT INTO cards_tags (card_id, tag) VALUES (68, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (68, 'pizza ordering');


INSERT INTO cards_tags (card_id, tag) VALUES (69, 'jeremy mckeever');
INSERT INTO cards_tags (card_id, tag) VALUES (69, 'jeremy mckeever');
INSERT INTO cards_tags (card_id, tag) VALUES (69, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (69, 'animal shelter');

INSERT INTO cards_tags (card_id, tag) VALUES (70, 'koi mccormick');
INSERT INTO cards_tags (card_id, tag) VALUES (70, 'koi mccormick');
INSERT INTO cards_tags (card_id, tag) VALUES (70, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (70, 'animal shelter');


INSERT INTO cards_tags (card_id, tag) VALUES (71, 'kristi norris');
INSERT INTO cards_tags (card_id, tag) VALUES (71, 'kristi norris');
INSERT INTO cards_tags (card_id, tag) VALUES (71, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (71, 'kristi norris');


INSERT INTO cards_tags (card_id, tag) VALUES (72, 'karlo kilgore');
INSERT INTO cards_tags (card_id, tag) VALUES (72, 'karlo kilgore');
INSERT INTO cards_tags (card_id, tag) VALUES (72, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (72, 'message board');


INSERT INTO cards_tags (card_id, tag) VALUES (73, 'lauren gates');
INSERT INTO cards_tags (card_id, tag) VALUES (73, 'lauren gates');
INSERT INTO cards_tags (card_id, tag) VALUES (73, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (73, 'pizza ordering');


INSERT INTO cards_tags (card_id, tag) VALUES (74, 'lines sultzer');
INSERT INTO cards_tags (card_id, tag) VALUES (74, 'lines sultzer');
INSERT INTO cards_tags (card_id, tag) VALUES (74, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (74, 'restaurant tinder');


INSERT INTO cards_tags (card_id, tag) VALUES (75, 'maria kofinas');
INSERT INTO cards_tags (card_id, tag) VALUES (75, 'maria kofinas');
INSERT INTO cards_tags (card_id, tag) VALUES (75, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (75, 'animal shelter');

INSERT INTO cards_tags (card_id, tag) VALUES (76, 'matthew cable');
INSERT INTO cards_tags (card_id, tag) VALUES (76, 'matthew cable');
INSERT INTO cards_tags (card_id, tag) VALUES (76, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (76, 'message board');


INSERT INTO cards_tags (card_id, tag) VALUES (77, 'nolan shay');
INSERT INTO cards_tags (card_id, tag) VALUES (77, 'nolan shay');
INSERT INTO cards_tags (card_id, tag) VALUES (77, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (77, 'meal planner');

INSERT INTO cards_tags (card_id, tag) VALUES (78, 'seth chesky');
INSERT INTO cards_tags (card_id, tag) VALUES (78, 'seth chesky');
INSERT INTO cards_tags (card_id, tag) VALUES (78, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (78, 'restaurant tinder');


INSERT INTO cards_tags (card_id, tag) VALUES (79, 'shyee meng');
INSERT INTO cards_tags (card_id, tag) VALUES (79, 'shyee meng');
INSERT INTO cards_tags (card_id, tag) VALUES (79, 'green');
INSERT INTO cards_tags (card_id, tag) VALUES (79, 'campaign crowdfunding');

INSERT INTO cards_tags (card_id, tag) VALUES (80, 'andy chong sam');
INSERT INTO cards_tags (card_id, tag) VALUES (80, 'instructor');

INSERT INTO cards_tags (card_id, tag) VALUES (81, 'christopher guarnera');
INSERT INTO cards_tags (card_id, tag) VALUES (81, 'instructor');

INSERT INTO cards_tags (card_id, tag) VALUES (82, 'yoav morahg');
INSERT INTO cards_tags (card_id, tag) VALUES (82, 'instructor');

INSERT INTO cards_tags (card_id, tag) VALUES (83, 'walt impellicceiri');
INSERT INTO cards_tags (card_id, tag) VALUES (83, 'instructor');

INSERT INTO cards_tags (card_id, tag) VALUES (84, 'rachel rysz');
INSERT INTO cards_tags (card_id, tag) VALUES (84, 'pathway');

INSERT INTO cards_tags (card_id, tag) VALUES (85, 'lisa sydney');
INSERT INTO cards_tags (card_id, tag) VALUES (85, 'relationship manager');

INSERT INTO cards_tags (card_id, tag) VALUES (86, 'robert schleper');
INSERT INTO cards_tags (card_id, tag) VALUES (86, 'pathway');

INSERT INTO cards_tags (card_id, tag) VALUES (87, 'aj page');
INSERT INTO cards_tags (card_id, tag) VALUES (87, 'academic fellow');

INSERT INTO cards_tags (card_id, tag) VALUES (88, 'zach snyder');
INSERT INTO cards_tags (card_id, tag) VALUES (88, 'academic fellow');

INSERT INTO cards_tags (card_id, tag) VALUES (89, 'david evans');
INSERT INTO cards_tags (card_id, tag) VALUES (89, 'academic fellow');

INSERT INTO cards_tags (card_id, tag) VALUES (90, 'matthew cabriales');
INSERT INTO cards_tags (card_id, tag) VALUES (90, 'academic fellow');

INSERT INTO cards_tags (card_id, tag) VALUES (91, 'joseph peloso');
INSERT INTO cards_tags (card_id, tag) VALUES (91, 'academic fellow');

INSERT INTO cards_tags (card_id, tag) VALUES (92, 'justin parker');
INSERT INTO cards_tags (card_id, tag) VALUES (92, 'academic fellow');


COMMIT TRANSACTION;
