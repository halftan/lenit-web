CREATE TABLE "attendances" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "event_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authentications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar(255), "access_token" varchar(255), "refresh_token" varchar(255), "expires_in" integer, "user_id" integer, "uid" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "location" varchar(255), "description" text, "time" datetime, "duration" integer, "visibility" integer, "owner_id" integer, "type" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "host_name" varchar(255));
CREATE TABLE "followings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "followed_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "providers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "manager_id" integer, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "resource_id" integer, "resource_type" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT '' NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "confirmation_token" varchar(255), "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar(255), "authentication_token" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "real_name" varchar(255), "birthday" datetime, "sex" integer, "marriage" boolean, "education" integer, "signature" text, "blog_link" varchar(255), "qq" varchar(255), "msn" varchar(255), "avatar_file_name" varchar(255), "avatar_content_type" varchar(255), "avatar_file_size" integer, "avatar_updated_at" datetime);
CREATE TABLE "users_roles" ("user_id" integer, "role_id" integer);
CREATE INDEX "index_attendances_on_event_id" ON "attendances" ("event_id");
CREATE INDEX "index_attendances_on_user_id" ON "attendances" ("user_id");
CREATE INDEX "index_authentications_on_user_id" ON "authentications" ("user_id");
CREATE INDEX "index_events_on_owner_id" ON "events" ("owner_id");
CREATE INDEX "index_followings_on_followed_id" ON "followings" ("followed_id");
CREATE INDEX "index_followings_on_user_id" ON "followings" ("user_id");
CREATE INDEX "index_providers_on_manager_id" ON "providers" ("manager_id");
CREATE INDEX "index_roles_on_name" ON "roles" ("name");
CREATE INDEX "index_roles_on_name_and_resource_type_and_resource_id" ON "roles" ("name", "resource_type", "resource_id");
CREATE UNIQUE INDEX "index_users_on_authentication_token" ON "users" ("authentication_token");
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_name" ON "users" ("name");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_users_roles_on_user_id_and_role_id" ON "users_roles" ("user_id", "role_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130130090602');

INSERT INTO schema_migrations (version) VALUES ('20130130090611');

INSERT INTO schema_migrations (version) VALUES ('20130130092835');

INSERT INTO schema_migrations (version) VALUES ('20130130121153');

INSERT INTO schema_migrations (version) VALUES ('20130130132512');

INSERT INTO schema_migrations (version) VALUES ('20130130133810');

INSERT INTO schema_migrations (version) VALUES ('20130130135502');

INSERT INTO schema_migrations (version) VALUES ('20130204082504');

INSERT INTO schema_migrations (version) VALUES ('20130227125800');

INSERT INTO schema_migrations (version) VALUES ('20130302102039');