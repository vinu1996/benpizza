with s2 as 
(
SELECT
o.item_id,
i.item_name,
i.sku,
r.ing_id,
ig.ing_name,
r.quantity as recipe_quantity,
ig.ing_weight,
ig.ing_price,
sum(o.quantity) as order_quantity
FROM orders o LEFT JOIN item i on o.item_id=i.item_id
left JOIN recipe r on r.recipe_id=i.sku
left 	JOIN ingredient ig on r.ing_id=ig.ing_id
GROUP BY o.item_id,i.item_name,i.sku,r.ing_id,r.quantity,ig.ing_name,ig.ing_weight,ig.ing_price)

select 
item_id,
item_name,
sku,
ing_id,
ing_name,
ing_weight,
ing_price,
recipe_quantity,
order_quantity,
recipe_quantity*order_quantity as ordered_weight,
ing_price/ing_weight as unit_cost,
(recipe_quantity*order_quantity)*(ing_price/ing_weight) as ingredient_cost
from s2
