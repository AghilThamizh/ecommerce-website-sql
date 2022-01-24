1. If the customer wants to see details of product present in the cart 
select * from product where product_id in(select product_id from Cart_item where (Cart_id in (select Cart_id from Customer where Customer_id='cid100'))and purchased='Y'); 2. If a customer wants to see order history 
select product_id,Quantity_wished from Cart_item where (purchased='Y'   and Cart_id in (select Cart_id from customer where Customer_id='cid100')); 3. Customer wants to see filtered products on the basis of size,gender,type 
select product_id, color, cost, seller_id from product where (type='jeans' and p_size='32' and gender='F' and quantity>0) 4. If customer wants to modify the cart 
delete from cart_item where (product_id='pid1001' and Cart_id in (select cart_id from Customer where Customer_id='cid100')); 
5.	If a seller stops selling his product 
delete from seller where seller_id = 'sid100'; update product set quantity = 00 where seller_id is NULL; 
6.	If admin want to see what are the product purchased on the particular date 
select product_id from cart_item where (purchased='Y' and date_added='12dec-2018'); 
7.	How much product sold on the particular date 
select count(product_id) count_pid,date_added from Cart_item where purchased='Y'  group by(date_added); 
8.	If a customer want to know the total price present in the cart 
select sum(quantity_wished * cost) total_payable from product p join cart_item c on p.product_id=c.product_id where c.product_id in (select product_id from cart_item where cart_id in(select Cart_id from customer where customer_id='cid101') and purchased='Y'); 
9.Show the details of the customer who has not purchased any thing 
Select * from customer where customer_id not in (select customer_id from Payment); 
10.	Find total profit of the website from sales. 
select sum(quantity_wished * cost * commission/100) total_profit from product p join cart_item c on p.product_id=c.product_id where purchased='Y'; 
11.	Updating the cost of cart items in payment table update payment set total_amount=total_cost(cart_id); 
12.	Cost filter select * from product where cost in (100,150); 
