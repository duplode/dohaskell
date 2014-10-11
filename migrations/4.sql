CREATE TEMP TABLE "tag_backup"("id" INTEGER PRIMARY KEY,"name" VARCHAR NOT NULL,CONSTRAINT "unique_tag" UNIQUE ("name"));
INSERT INTO "tag_backup"("id","name") SELECT "id","tag" FROM "tag";
DROP TABLE "tag";
CREATE TABLE "tag"("id" INTEGER PRIMARY KEY,"name" VARCHAR NOT NULL,CONSTRAINT "unique_tag" UNIQUE ("name"));
INSERT INTO "tag" SELECT "id","name" FROM "tag_backup";
DROP TABLE "tag_backup";
CREATE TABLE "collection"("id" INTEGER PRIMARY KEY,"name" VARCHAR NOT NULL,CONSTRAINT "unique_collection" UNIQUE ("name"));
CREATE TABLE "res_collection"("id" INTEGER PRIMARY KEY,"res_id" INTEGER NOT NULL REFERENCES "resource","col_id" INTEGER NOT NULL REFERENCES "collection",CONSTRAINT "unique_res_collection" UNIQUE ("res_id","col_id"));
CREATE TABLE "edit_add_collection"("id" INTEGER PRIMARY KEY,"res_id" INTEGER NOT NULL REFERENCES "resource","name" VARCHAR NOT NULL,CONSTRAINT "unique_edit_add_collection" UNIQUE ("res_id","name"));
CREATE TABLE "edit_remove_collection"("id" INTEGER PRIMARY KEY,"res_id" INTEGER NOT NULL REFERENCES "resource","name" VARCHAR NOT NULL,CONSTRAINT "unique_edit_remove_collection" UNIQUE ("res_id","name"));