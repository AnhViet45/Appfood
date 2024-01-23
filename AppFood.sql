
#food_type: type_id, type_name
#food: food_id, food_name, image, price, desc, type_id
#sub_food: sub_id, sub_name, sub_price, food_id
#order: user_id, food_id, amount, code, arr_sub_id
#user: user_id, full_name, email, password
#rate_res: user_id, res_id, amount, date_rate
#like_res: user_id, res_id, date_like
#restaurant: res_id, res_name, image, desc


#food_type
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(100)
);

#food_type data
INSERT INTO food_type (type_id, type_name) VALUES
(5	,'Pizza'),
(6	,'Pasta'),
(7	,'Tacos'),
(8	,'Burritos'),
(9	,'Sushi'),
(10	,'Ramen'),
(11	,'Curry'),
(12	,'Croissant'),
(13	,'Burger'),
(14	,'Salad')
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Dessert'),
(4, 'Beverage');

#food
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(100) NOT NULL,
	image VARCHAR(100) NOT NULL,
	price FLOAT NOT NULL,
	description VARCHAR(100) NOT NULL,
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

#food data
INSERT INTO food (food_id, food_name, image, price, description, type_id) VALUES
(5	,'Margherita Pizza',	'margherita.jpg',	8.99,	'Classic Italian pizza with tomato and cheese',	5),
(6	,'Spaghetti Carbonara',	'carbonara.jpg',	12.99,	'Creamy pasta dish with bacon and cheese',	6),
(7	,'Chicken Tacos',	'chicken_tacos.jpg',	9.99,	'Tacos filled with seasoned chicken',	7),
(8	,'Beef Burrito',	'beef_burrito.jpg',	10.99,	'Burrito filled with seasoned beef',	8),
(9	,'Salmon Sushi',	'salmon_sushi.jpg',	15.99,	'Fresh salmon slices on sushi rice',	9),
(10	,'Miso Ramen',	'miso_ramen.jpg	11.99',11.99,	'Japanese noodle soup with miso broth',	10),
(11	,'Chicken Curry',	'chicken_curry.jpg',	10.99,	'Spicy chicken curry with rice',	11),
(12	,'Chocolate Croissant',	'choco_croissant.jpg',	5.99,	'Croissant filled with chocolate',	12),
(13	,'Cheeseburger',	'cheeseburger.jpg',	7.99,	'Classic cheeseburger with fries',	13),
(14	,'Caesar Salad',	'caesar_salad.jpg',	8.99,	'Fresh salad with Caesar dressing',	14);
(1, 'Caesar Salad', 'salad.jpg', 9.99, 'Fresh and crisp Caesar salad with homemade dressing.', 1),
(2, 'Spaghetti Bolognese', 'spaghetti.jpg', 14.99, 'Classic Italian pasta dish with rich meat sauce.', 2),
(3, 'Chocolate Cake', 'chocolate_cake.jpg', 7.99, 'Decadent chocolate cake with layers of frosting.', 3),
(4, 'Iced Tea', 'iced_tea.jpg', 2.49, 'Refreshing iced tea with a hint of lemon.', 4),

#subfood
CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(100) NOT NULL,
	sub_price VARCHAR(100) NOT NULL,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);

#sub_food data
INSERT INTO sub_food (sub_id, sub_name, sub_price, food_id) VALUES
(11, 'Pepperoni Pizza', 9.99, 1),
(12, 'Vegetable Pizza', 9.99, 1),
(13, 'Chicken Alfredo', 14.99, 2),
(14, 'Shrimp Linguine', 15.99, 2),
(5, 'Fish Tacos', 10.99, 3),
(6, 'Beef Tacos', 10.99, 3),
(7, 'Veggie Burrito', 9.99, 4),
(8, 'Bean Burrito', 8.99, 4),
(9, 'Tuna Sushi', 17.99, 5),
(10, 'California Roll', 14.99, 5),
(1, 'Garlic Bread', 4.99, 2),
(2, 'Cheesecake Slice', 5.99, 3),
(3, 'French Fries', 3.49, 1),
(4, 'Soft Drink', 1.99, 2);


#user
CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL
);

#user data
INSERT INTO users (user_id, full_name, email, password) VALUES
(4,	'Emma Davis',	'emma@example.com',	'emma_pass'),
(5,	'Michael Lee',	'michael@example.com',	'pass123'),
(6,	'Sarah Wilson',	'sarah@example.com',	'sarah_pass'),
(7,	'David Miller',	'david@example.com',	'david_pass'),
(8,	'Olivia Taylor',	'olivia@example.com',	'olivia_pass'),
(9,	'James Anderson',	'james@example.com',	'james_pass'),
(10,	'Emily Thomas',	'emily@example.com',	'emily_pass'),
(11,	'William Brown',	'william@example.com',	'william_pass'),
(12,	'Sophia Garcia',	'sophia@example.com',	'sophia_pass'),
(13,	'Daniel Martinez',	'daniel@example.com',	'daniel_pass'),
(14,	'Ashley Lopez',	'ashley@example.com',	'ashley_pass'),
(15,	'Christopher Hall',	'christopher@example.com',	'chris_pass');

(1, 'John Doe', 'john@example.com', 'password123'),
(2, 'Jane Smith', 'jane@example.com', 'securepass'),
(3, 'Bob Johnson', 'bob@example.com', 'mypassword');


#order
CREATE TABLE orders(
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(100) NOT NULL,
    arr_sub_id VARCHAR(100) NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

#orderdata
INSERT INTO orders (user_id, amount, code, arr_sub_id) VALUES
(1, 2, 'CODE1', 'SUBID1'),
(2, 1, 'CODE2', 'SUBID2'),
(3, 3, 'CODE3', 'SUBID3'),
(4, 2, 'CODE4', 'SUBID4'),
(5, 1, 'CODE5', 'SUBID5'),
(6, 2, 'CODE6', 'SUBID6'),
(7, 3, 'CODE7', 'SUBID7'),
(8, 1, 'CODE8', 'SUBID8'),
(9, 2, 'CODE9', 'SUBID9'),
(10,  3, 'CODE10', 'SUBID10'),
(11,  2, 'CODE11', 'SUBID11'),
(12,  1, 'CODE12', 'SUBID12'),
(13,  3, 'CODE13', 'SUBID13'),
(14,  2, 'CODE14', 'SUBID14'),
(1,  1, 'CODE15', 'SUBID15');






#restaurant
CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(100) NOT NULL,
    image VARCHAR(100),
    description VARCHAR(100)
);

#data restaurant
INSERT INTO restaurant (res_name, image, description) VALUES
	('Cafe Bella', 'cafe_bella.jpg', 'A cozy cafe with a variety of coffee options.'),
	('Pizza Palace', 'pizza_palace.jpg', 'Home of the best pizza in town!'),
	('Sushi Haven', 'sushi_haven.jpg', 'Fresh and delicious sushi dishes.'),
	('Burger Bistro', 'burger_bistro.jpg', 'Gourmet burgers and fries.'),
	('Thai Spice', 'thai_spice.jpg', 'Authentic Thai cuisine with a touch of spice.'),
	('Mediterranean Delight', 'mediterranean_delight.jpg', 'Experience the flavors of the Mediterranean.'),
	('Taco Fiesta', 'taco_fiesta.jpg', 'Taste the excitement of Mexican street food.'),
	('Vegetarian Oasis', 'vegetarian_oasis.jpg', 'A haven for vegetarian and vegan delights.'),
	('Steakhouse Supreme', 'steakhouse_supreme.jpg', 'Premium steaks cooked to perfection.'),
	('Seafood Harbor', 'seafood_harbor.jpg', 'Fresh seafood served with a view.'),
	('Pasta Paradise', 'pasta_paradise.jpg', 'Indulge in a variety of pasta dishes.'),
	('Deli Delight', 'deli_delight.jpg', 'Classic deli sandwiches and salads.'),
	('Indian Spice', 'indian_spice.jpg', 'Savor the rich flavors of Indian cuisine.'),
	('Smoothie Spot', 'smoothie_spot.jpg', 'Refreshing smoothies and healthy snacks.'),
	('BBQ Barn', 'bbq_barn.jpg', 'BBQ favorites in a rustic setting.'),
	('Noodle Nook', 'noodle_nook.jpg', 'A diverse selection of noodle dishes.'),
	('Crepe Corner', 'crepe_corner.jpg', 'Sweet and savory crepes for every taste.'),
	('Ice Cream Emporium', 'ice_cream_emporium.jpg', 'A paradise of ice cream flavors.'),
	('Diner Daze', 'diner_daze.jpg', 'Classic American diner with comfort food.'),
	('Pho Palace', 'pho_palace.jpg', 'Delicious Vietnamese pho and more.');






#rate_res
CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount int, 
    date_rate DATE, 
    
    FOREIGN KEY (user_id) REFERENCES users(user_id), 
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id) 
);

#rate-res data
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
						(1, 3, 4, '2023-01-15'),
						(2, 1, 5, '2023-02-20'),
						(3, 5, 3, '2023-03-10'),
						(4, 8, 4, '2023-04-05'),
						(5, 12, 5, '2023-05-12'),
						(1, 15, 4, '2023-06-18'),
						(2, 18, 3, '2023-07-22'),
						(3, 20, 5, '2023-08-30'),
						(4, 7, 4, '2023-09-02'),
						(5, 10, 5, '2023-10-08'),
						(1, 2, 3, '2023-11-15'),
						(2, 4, 4, '2023-12-20'),
						(3, 6, 5, '2024-01-25'),
						(4, 9, 3, '2024-02-28'),
						(5, 11, 4, '2024-03-05'),
						(1, 13, 5, '2024-04-10'),
						(2, 16, 3, '2024-05-15'),
						(3, 19, 4, '2024-06-20'),
						(4, 14, 5, '2024-07-25'),
						(5, 17, 3, '2024-08-30');

#like-res
CREATE TABLE like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

#like-res data
INSERT INTO like_res(user_id, res_id, date_like) VALUES
	(1,3, '2022-12-05 01:50:10'),
	(3,1, '2022-10-05 11:06:00'),
	(1,2, '2022-10-15 10:35:15'),
	(4,4, '2023-02-02 15:18:02'),
	(4,2, '2023-02-03 08:16:32'),
	(5,1, '2023-06-05 08:30:12'),
	(6,2, '2023-07-22 14:45:00'),
    (7,4, '2023-08-23 19:15:00'),
    (7,1, '2023-08-23 19:15:00'),
    (6,4, '2023-07-24 12:00:00');





/*Tìm 5 người đã like nhà hàng nhiều nhất*/
SELECT 
    COUNT(like_res.user_id) AS total_like_user, 
    users.full_name, 
    users.email, 
    users.user_id
FROM 
    users 
INNER JOIN 
    like_res ON users.user_id = like_res.user_id
GROUP BY 
    users.full_name, 
    users.email, 
    users.user_id
ORDER BY 
    COUNT(like_res.user_id) DESC
LIMIT 5;



/*Tìm 2 nhà hàng có lượt like nhiều nhất*/
SELECT 
    COUNT(like_res.res_id) AS total_like_res, 
    restaurant.res_id, 
    restaurant.res_name
FROM 
    like_res 
INNER JOIN 
    restaurant ON like_res.res_id = restaurant.res_id
GROUP BY 
    restaurant.res_id, 
    restaurant.res_name
ORDER BY 
    total_like_res DESC
LIMIT 2;


/*Tìm người đã đặt hàng nhiều nhất*/
SELECT 
    COUNT(orders.user_id) AS total_orders, 
    users.user_id, 
    users.full_name, 
    users.email
FROM 
    orders
INNER JOIN 
    users ON orders.user_id = users.user_id
GROUP BY 
    users.user_id, 
    users.full_name, 
    users.email
ORDER BY 
    total_orders DESC
LIMIT 1;


/*Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)*/
SELECT users.user_id, users.full_name, users.email FROM users 
LEFT JOIN like_res ON users.user_id = like_res.user_id
LEFT JOIN rate_res ON users.user_id = rate_res.user_id
LEFT JOIN orders   ON users.user_id = orders.user_id
WHERE like_res.user_id IS NULL && rate_res.user_id IS NULL && orders.user_id iS NULL;