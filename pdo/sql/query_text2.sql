-- запрос №2 к заданию 1

SELECT brand, model, work_name, work_cost
FROM service_works
JOIN car_models ON service_works.id_model = car_models.id_model
JOIN car_brands ON car_brands.id_brand = car_models.id_brand
WHERE end_production IS NULL AND work_cost > 1000