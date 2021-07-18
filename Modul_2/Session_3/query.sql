-- #Soal_1
SELECT items.id, items.name, categories.name 
FROM items 
LEFT JOIN item_categories ON items.id = item_categories.item_id 
LEFT JOIN categories ON categories.id = item_categories.category_id;

-- #Soal_2
SELECT items.id, items.name, categories.name 
FROM items 
LEFT JOIN item_categories ON items.id = item_categories.item_id 
LEFT JOIN categories ON categories.id = item_categories.category_id 
WHERE categories.name = 'main dish';

-- #Soal_3
SELECT items.id, items.name, categories.name, items.price 
FROM items 
LEFT JOIN item_categories ON items.id = item_categories.item_id 
LEFT JOIN categories ON categories.id = item_categories.category_id 
WHERE categories.name = "main dish" and price >= 30000;

-- #Soal_4
SELECT items.id, items.name
FROM items 
LEFT JOIN item_categories ON items.id = item_categories.item_id 
WHERE item_categories.item_id IS NULL;

-- #Soal_5
SELECT categories.name, GROUP_CONCAT(items.name) AS "food", MAX(items.price) AS "max food price"
FROM items
LEFT JOIN item_categories ON items.id = item_categories.item_id
LEFT JOIN categories ON item_categories.category_id = categories.id
WHERE categories.name IS NOT NULL
GROUP BY categories.name
ORDER BY MAX(items.price) DESC;
