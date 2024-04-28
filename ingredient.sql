select 
s3.ing_name,
s3.ordered_weight,
ing.ing_weight*inv.quantity as total_inv_weight,
(ing.ing_weight*inv.quantity)-s3.ordered_weight as remaining_weight
FROM
(select 
ing_name,
ing_id,
SUM(ordered_weight) as ordered_weight
from stock1 
GROUP BY 
ing_name,
ing_id
order by ing_id) s3 
LEFT JOIN inventory inv on s3.ing_id=inv.item_id
LEFT JOIN ingredient ing on ing.ing_id=s3.ing_id

