CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
user_email VARCHAR(250),
user_password VARCHAR(500),
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE ingredients (
ingredient_id SERIAL PRIMARY KEY,
ingredient_name VARCHAR(500)
);

CREATE TABLE recipe (
recipe_id SERIAL PRIMARY KEY,
recipe_name VARCHAR(250),
recipe_instructions VARCHAR (2000),
recipe_ingredients INT NOT NULL REFERENCES ingredients(ingredient_id),
author_id INT NOT NULL REFERENCES users(user_id),
privacy BOOLEAN
);

CREATE TABLE fav_recipe (
author_id INT NOT NULL REFERENCES users(user_id),
recipe_id INT NOT NULL REFERENCES recipe(recipe_id)
);

CREATE TABLE grocery (
grocery_id SERIAL PRIMARY KEY,
author_id INT NOT NULL REFERENCES users(user_id),
ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
ingredient_name INT NOT NULL REFERENCES ingredients(ingredient_name)
);


CREATE TABLE occasions (
occasion_id SERIAL PRIMARY KEY,
recipe_id INT NOT NULL REFERENCES recipe(recipe_id),
author_id INT NOT NULL REFERENCES users(user_id),
occasions_details VARCHAR(2000)
);

