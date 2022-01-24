Trigger that will execute before inserting new customer to database and inserting a new cartId to the cart_items table     create or replace function total_cost(cId in varchar)     return number 
    is 
    total number(2) :=0;     begin 
    select sum(cost) into total from product,cart_item where product.product_id=cart_item.product_id and cart_id=cId; 
    return total;     end; 
 
    create or replace trigger before_pay_up     before insert     on     payment     for each row     declare     total number(3);     begin     total :=total_cost(:new.cart_id); 
    insert into payment values(:new.payment_id,:new.payment_date,:new.payment_type,:new.custome r_id,:new.cart_id,total);     end; 
Trigger to update the total amount of user everytime he adds something to payment table     create or replace function total_cost(cId in varchar)     return number 
    is 
    total number(2) :=0;     begin 
    select sum(cost) into total from product,cart_item where product.product_id=cart_item.product_id and cart_id=cId; 
    return total;     end; 
 
    create or replace trigger before_pay_up     before insert     on     payment     for each row     declare     total number(3); 
    begin     total :=total_cost(:new.cart_id); 
    insert into payment values(:new.payment_id,:new.payment_date,:new.payment_type,:new.custome r_id,:new.cart_id,total);     end; 
