USE project_milkteamanagement;

DELIMITER $$
CREATE PROCEDURE calculate_pay(IN id_cus_in INT)
BEGIN

    DECLARE pay_pro INT DEFAULT 0;
    DECLARE pay_ship INT DEFAULT 0;
    DECLARE pay_sale INT DEFAULT 0;
    DECLARE pay_total INT DEFAULT 0;
    DECLARE quantity_result INT DEFAULT 0;
    DECLARE save_mark_variable INT DEFAULT 0;
    DECLARE no_more_product2 INT DEFAULT 0;
    DECLARE id_cus2 INT;
	DECLARE id_pro2 INT;
	DECLARE quantity_detail2 INT;
    
    DECLARE pro_update CURSOR FOR 
		SELECT id_cus, id_pro, quantity_detail FROM cus_pro;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET no_more_product2 = 1;
        
	-- transaction
    SET autocommit = 0;
    
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
	
    -- tinh quantity va tien ban san pham
    SELECT SUM(quantity_detail) INTO quantity_result FROM cus_pro
		WHERE cus_pro.id_cus = id_cus_in;
        
	SET pay_pro = quantity_result * 15000;
    -- ---------------------------------------------------------------------------
    
    -- tinh gia tien ship
    SELECT s.price_ship INTO pay_ship FROM ship AS s,customer AS c
		WHERE c.district = s.district AND c.id_cus = id_cus_in;
    -- ---------------------------------------------------------------------------
    
    -- tinh diem save_mark, tien sale off va cap nhat save_mark vao bang member
    IF (SELECT id_mem FROM customer WHERE id_cus = id_cus_in > 0) THEN 
		SELECT member.save_mark INTO save_mark_variable FROM customer, member
			WHERE customer.id_mem = member.id_mem AND customer.id_cus = id_cus_in;

		SET pay_sale = FLOOR((save_mark_variable + quantity_result) / 10) * 15000 ;
    
		UPDATE member, customer
			SET save_mark =  (save_mark_variable + quantity_result)%10
			WHERE customer.id_cus = id_cus_in AND customer.id_mem = member.id_mem;
	END IF;
	-- ----------------------------------------------------------------------------
    
	-- tinh tong tien
    SET pay_total = pay_pro + pay_ship - pay_sale;
    
	UPDATE customer
		SET pay = pay_total
		WHERE id_cus = id_cus_in;
    -- ----------------------------------------------------------------------------
    
    SELECT pay_pro,pay_ship,pay_sale,pay_total;
    
-- update so luong san pham con lai dung con tro
    
	OPEN pro_update;
		FETCH pro_update INTO id_cus2, id_pro2, quantity_detail2;
		WHILE no_more_product2 !=1 DO
			BEGIN 
				IF id_cus2 = id_cus_in THEN
					UPDATE product 
						SET quantity_pro = quantity_pro - quantity_detail2
							WHERE id_pro = id_pro2;
				END IF;
			END;
            FETCH pro_update INTO id_cus2, id_pro2, quantity_detail2;
		END WHILE;
	CLOSE pro_update;
    
    COMMIT;
    
END $$
DELIMITER ;

-- goi tinh tien
CALL calculate_pay(2);
-- -----------------------------------------------------------------------------------------

-- tinh khach hang thanh vien ma mua nhieu nhat trong ca nam
SELECT id_mem, MAX(pay)
	FROM customer 
    GROUP BY id_mem
    ORDER BY MAX(pay) DESC
    LIMIT 1;
-- -----------------------------------------------------------------------------------------

-- sap xep san pham ban dc theo thu thu giam dan
SELECT id_pro, SUM(quantity_detail)
	FROM cus_pro
    GROUP BY id_pro
    ORDER BY SUM(quantity_detail) DESC;

-- -----------------------------------------------------------------------------------------
-- procedure tinh tong doanh thu trong 1 thang 

DELIMITER $$
CREATE PROCEDURE calculateMoneyInAMonth(IN yearInput VARCHAR(4), IN monthInput VARCHAR(2))
BEGIN

	DECLARE  s VARCHAR(20) ;
    SET s = CONCAT(yearInput,'-',monthInput,'-%');
    SELECT SUM(pay) 
	FROM customer
	WHERE day LIKE s;
END $$
DELIMITER ;
CALL calculateMoneyInAMonth('2016','10');


-- -----------------------------------------------------------------------------------------

-- procedure tinh khach hang thanh vien ma mua nhieu nhat 
DELIMITER $$
DROP PROCEDURE IF EXISTS calculateMoneyOfMemberBuyMost $$
CREATE PROCEDURE calculateMoneyOfMemberBuyMost ()
BEGIN
	SELECT id_mem, SUM(pay)
	FROM customer 
    WHERE id_mem!=0
    GROUP BY id_mem 
    ORDER BY SUM(pay) DESC
    LIMIT 1;
END $$
DELIMITER ;
CALL calculateMoneyOfMemberBuyMost();

-- -----------------------------------------------------------------------------------------

-- procedure sap xep san pham ban dc theo thu thu giam dan
DELIMITER $$
DROP PROCEDURE IF EXISTS OrderProductSellMostDesc $$
CREATE PROCEDURE OrderProductSellMostDesc()
BEGIN
SELECT id_pro, SUM(quantity_detail)
	FROM cus_pro
    GROUP BY id_pro
    ORDER BY SUM(quantity_detail) DESC;
END $$
DELIMITER ;
CALL OrderProductSellMostDesc();

-- -----------------------------------------------------------------------------------------

-- procedure tinh tien dc giam gia cua moi thanh vien
DELIMITER $$
CREATE PROCEDURE show_discounted()
BEGIN
	DECLARE no_more_member INT DEFAULT 0;
	DECLARE cursor_id_mem INT DEFAULT 0;
    
	DECLARE total_discounted CURSOR FOR 
		SELECT id_mem FROM member;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET no_more_member = 1;
        
	CREATE TEMPORARY TABLE show_member_discounted (id_mem INT(11), discounted INT(11) );
    SET SQL_SAFE_UPDATES = 0;
    
    SET autocommit = 0;
    
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    OPEN total_discounted;
		FETCH total_discounted INTO cursor_id_mem;
		WHILE no_more_member !=1 DO
			BEGIN 
				INSERT INTO show_member_discounted(id_mem)
				VALUE (cursor_id_mem);
            
				DROP TABLE IF EXISTS my_temp_table;
				CREATE TEMPORARY TABLE my_temp_table
					SELECT SUM(quantity_detail) AS mark
						FROM cus_pro, customer
						WHERE customer.id_cus = cus_pro.id_cus AND customer.id_mem = cursor_id_mem
						GROUP BY cus_pro.id_cus;
                
				UPDATE show_member_discounted 
					SET discounted = (SELECT FLOOR(SUM(mark)/10) * 15000 FROM my_temp_table)
                    WHERE id_mem = cursor_id_mem;
			END;
			FETCH total_discounted INTO cursor_id_mem;
		END WHILE;
	DROP TABLE IF EXISTS my_temp_table;
	CLOSE total_discounted;
	
    SELECT * FROM show_member_discounted;
    
    DROP TABLE IF EXISTS show_member_discounted;
    
    COMMIT;
    
END $$
DELIMITER ;

CALL show_discounted();
-- ---------------------------------------------------------------------------------------------------------