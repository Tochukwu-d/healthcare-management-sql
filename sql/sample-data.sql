DESCRIBE department;

# Updating table information.................................................
ALTER TABLE department
ADD COLUMN description VARCHAR(255);

UPDATE department SET description = 'Heart-related services' WHERE dept_id = 101;
UPDATE department SET description = 'Brain and Nervous System' WHERE dept_id = 102;
UPDATE department SET description = 'Digestive system functions' WHERE dept_id = 103;
UPDATE department SET description = 'Kidney-related functions' WHERE dept_id = 104;
UPDATE department SET description = 'Lung-related functions' WHERE dept_id = 105;
UPDATE department SET description = 'Hormone-related functions' WHERE dept_id = 106;
UPDATE department SET description = 'General Clinical Services' WHERE dept_id = 107;


SELECT * FROM department;