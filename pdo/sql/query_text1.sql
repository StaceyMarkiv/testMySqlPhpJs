-- запрос №1 к заданию 1

SELECT brand, model, end_production
FROM car_models
JOIN car_brands ON car_brands.id_brand = car_models.id_brand
WHERE end_production < '2010-09-01'