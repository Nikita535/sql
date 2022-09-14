

SELECT * from autosalon.Client;



SELECT * 
    from autosalon.Contract 
    ORDER BY ABS(DATEDIFF('2022-08-19',datetime)) DESC;



SELECT client_id, count(*) AS number_of_people 
    FROM autosalon.Contract 
    GROUP BY client_id;



SELECT number_of_doors, number_of_seats 
    FROM autosalon.Technical_details 
    WHERE (
        (number_of_doors<3) AND (number_of_doors+number_of_seats=4));



SELECT *
    FROM autosalon.Client 
        WHERE name NOT LIKE 'Nikita' AND telephone_number NOT LIKE '+7%79';


SELECT * 
    FROM autosalon.Product 
        WHERE product_id IN 
            (SELECT product_id 
                FROM autosalon.Contract 
                    WHERE conract_id=1 AND delivery LIKE 'true');



SELECT MONTHNAME(datetime) AS Месяц, COUNT(MONTHNAME(datetime)) AS Количесвто
    FROM autosalon.Contract
        GROUP BY MONTHNAME(datetime)
        ORDER BY Количесвто DESC, Месяц;

UPDATE autosalon.Client a 
    SET a.passport_data = 
        IF (a.passport_data NOT LIKE '%397','0000 111','1111 397');
SELECT * FROM autosalon.Client;