.timeout 30000

ATTACH DATABASE '/etc/pihole/gravity.db' AS OLD;
ATTACH DATABASE './gravity_sync.db' AS BACKUP;

BEGIN TRANSACTION;

CREATE TABLE BACKUP."group" AS  SELECT * FROM OLD."group";
CREATE TABLE BACKUP.domain_audit AS SELECT * FROM OLD.domain_audit;

CREATE TABLE BACKUP.domainlist AS SELECT * FROM OLD.domainlist;
CREATE TABLE BACKUP.domainlist_by_group AS  SELECT * FROM OLD.domainlist_by_group;

CREATE TABLE BACKUP.adlist AS SELECT * FROM OLD.adlist;
CREATE TABLE BACKUP.adlist_by_group AS SELECT * FROM OLD.adlist_by_group;

CREATE TABLE BACKUP.client AS SELECT * FROM OLD.client;
CREATE TABLE BACKUP.client_by_group AS SELECT * FROM OLD.client_by_group;

COMMIT;
