CREATE SEQUENCE IF NOT EXISTS task_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE tasks
(
   id			INT				NOT NULL PRIMARY KEY,
   version		INT				NOT NULL,
   name			VARCHAR(200)	NOT NULL,
   done			BOOLEAN			NOT NULL,
   created 		TIMESTAMPTZ		NOT NULL,                               
   priority		VARCHAR(10)		NOT NULL
);

INSERT INTO tasks VALUES 
(nextval('task_seq'), 0, 'Dies ist eine automatisch angelegte Aufgabe', false, NOW(), 'LOW'),
(nextval('task_seq'), 0, 'Dies ist eine automatisch angelegte sehr wichtige Aufgabe', false, NOW(), 'URGENT'),
(nextval('task_seq'), 0, 'Dies ist eine automatisch angelegte erledigte Aufgabe', true, NOW(), 'NORMAL');

