create or replace procedure cost_filter(c in number,t in varchar) 
    is 
    cs product.cost%type;     ty product.type%type;     id product.product_id%type;     cursor cf is 
    select product_id,cost,type from product where cost<c and type=t;     begin     open cf;     loop     fetch cf into id,cs,ty;     exit when cf%notfound;     dbms_output.put_line('Product' || id || 'has cost ' || cs || ' and the type is' || ty);     end loop;     close cf;     exception     when no_data_found then     dbms_output.put_line('Sorry no such products exist');     end; 
 
Function which returns total number of products which a particular seller sells     create or replace function totalProducts(sId in varchar)     return number 
    is 
    total number(2):=0;     begin     select count(*) into total     from product 
    where seller_id=sId;     return total;     end; 
    / 
Function execution:  
    declare     c number(2);     begin     c:=totalProducts('sid102');     dbms_output.put_line('Total products is : '|| c);     end; 
Procedure which returns the total quantity of product with the given ID     create or replace procedure prod_details(p_id in varchar) 
    is 
    quan number(2);     begin     select quantity into quan from product where product_id=p_id;     exception     when no_data_found then     dbms_output.put_line('Sorry no such product exist !!');     end; 
