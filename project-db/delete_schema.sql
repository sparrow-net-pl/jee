--<ScriptOptions statementTerminator=";"/>

ALTER TABLE PROJECT.MESSAGES DROP CONSTRAINT MESSAGES_PK;

DROP INDEX PROJECT.MESSAGES_PK_IDX;

DROP TABLE PROJECT.MESSAGES;

DROP SCHEMA PROJECT RESTRICT;
