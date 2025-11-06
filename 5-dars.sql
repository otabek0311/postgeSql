CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "email_validated" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "email_validated_before_login" BOOLEAN NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,
    "bio" VARCHAR(255) NOT NULL,
    "campany" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "website" VARCHAR(255) NOT NULL,
    "social_fasebook" VARCHAR(255) NOT NULL,
    "social_instagram" VARCHAR(255) NOT NULL,
    "social_twitter" VARCHAR(255) NOT NULL,
    "social_linkedin" VARCHAR(255) NOT NULL,
    "social_youtube" VARCHAR(255) NOT NULL,
    "social_meetube" VARCHAR(255) NOT NULL,
    "social_eventbrite" VARCHAR(255) NOT NULL,
    "social_slack" VARCHAR(255) NOT NULL,
    "social_discord" VARCHAR(255) NOT NULL,
    "social_github" VARCHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "update_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "mentoring" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "venues"(
    "id" BIGINT NOT NULL,
    "partner_id" VARCHAR(255) NOT NULL,
    "contact_id" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "address_lat" DOUBLE PRECISION NOT NULL
);
ALTER TABLE
    "venues" ADD PRIMARY KEY("id");
CREATE TABLE "contacts"(
    "id" BIGINT NOT NULL,
    "partner_id" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "notes" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "contacts" ADD PRIMARY KEY("id");
CREATE TABLE "sponsors"(
    "id" BIGINT NOT NULL,
    "group_id" VARCHAR(255) NOT NULL,
    "partner_id" VARCHAR(255) NOT NULL,
    "sponsor_pack_id" VARCHAR(255) NOT NULL,
    "contact_id" VARCHAR(255) NOT NULL,
    "start" DATE NOT NULL,
    "finish" DATE NOT NULL,
    "paid" DATE NOT NULL,
    "price" DOUBLE PRECISION NOT NULL
);
ALTER TABLE
    "sponsors" ADD PRIMARY KEY("id");
CREATE TABLE "partners"(
    "id" BIGINT NOT NULL,
    "group_id" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "notes" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "logo" VARCHAR(255) NOT NULL,
    "social_fasebook" VARCHAR(255) NOT NULL,
    "social_instagram" VARCHAR(255) NULL,
    "social_twitter" VARCHAR(255) NOT NULL,
    "social_linkedin" VARCHAR(255) NOT NULL,
    "social_youtube" VARCHAR(255) NOT NULL,
    "social_meetube" VARCHAR(255) NOT NULL,
    "social_eventbrite" VARCHAR(255) NOT NULL,
    "social_slack" VARCHAR(255) NOT NULL,
    "social_discord" VARCHAR(255) NOT NULL,
    "social_github" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" BIGINT NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" BIGINT NOT NULL
);
ALTER TABLE
    "partners" ADD PRIMARY KEY("id");
CREATE TABLE "sponsor_packs"(
    "id" BIGINT NOT NULL,
    "group_id" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "discription" TEXT NOT NULL,
    "price" FLOAT(53) NOT NULL
);
ALTER TABLE
    "sponsor_packs" ADD PRIMARY KEY("id");
CREATE TABLE "groups"(
    "id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "logo" VARCHAR(255) NOT NULL,
    "banner" VARCHAR(255) NOT NULL,
    "contacts" VARCHAR(255) NOT NULL,
    "website" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "location_lab" FLOAT(53) NOT NULL
);
ALTER TABLE
    "groups" ADD PRIMARY KEY("id");
CREATE TABLE "logins"(
    "provider_id" VARCHAR(255) NOT NULL,
    "provvider_key" VARCHAR(255) NOT NULL,
    "user_id" VARCHAR(255) NOT NULL
);
CREATE TABLE "cfps"(
    "id" BIGINT NOT NULL,
    "group_id" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "begin" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "close" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_atn" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "cfps" ADD PRIMARY KEY("id");
CREATE TABLE "events"(
    "id" BIGINT NOT NULL,
    "group_id" VARCHAR(255) NOT NULL,
    "cfp_id" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "start" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "max_attende" INTEGER NOT NULL,
    "allow_rswp" BOOLEAN NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "orga_notes" VARCHAR(255) NOT NULL,
    "orga_notes_updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "orga_notes_updated_by" VARCHAR(255) NOT NULL,
    "venue" VARCHAR(255) NOT NULL,
    "talks" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "meetupgroup" VARCHAR(255) NOT NULL,
    "meetupevent" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL,
    "kind" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "events" ADD PRIMARY KEY("id");
CREATE TABLE "proposals"(
    "id" BIGINT NOT NULL,
    "talk_id" VARCHAR(255) NOT NULL,
    "cfp_id" VARCHAR(255) NOT NULL,
    "event_id" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "duration" VARCHAR(255) NOT NULL,
    "dieckription" VARCHAR(255) NOT NULL,
    "speakers" VARCHAR(255) NOT NULL,
    "slides" VARCHAR(255) NOT NULL,
    "video" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL,
    "orga_tags" VARCHAR(255) NOT NULL,
    "message" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "proposals" ADD PRIMARY KEY("id");
CREATE TABLE "event_rsvps"(
    "event_id" VARCHAR(255) NOT NULL,
    "user_id" VARCHAR(255) NOT NULL,
    "answer" VARCHAR(255) NOT NULL,
    "answered_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE TABLE "propaorsal_rating"(
    "proporsal_id" VARCHAR(255) NOT NULL,
    "grade" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL
);
CREATE TABLE "comments"(
    "event_id" VARCHAR(255) NOT NULL,
    "proporsal_id" VARCHAR(255) NOT NULL,
    "id" VARCHAR(255) NOT NULL,
    "kind" VARCHAR(255) NOT NULL,
    "answer" VARCHAR(255) NOT NULL,
    "text" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL
);
CREATE TABLE "talks"(
    "id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "duration" BIGINT NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "speakers" VARCHAR(255) NOT NULL,
    "slide" VARCHAR(255) NOT NULL,
    "video" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL,
    "message" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "talks" ADD PRIMARY KEY("id");
ALTER TABLE
    "venues" ADD CONSTRAINT "venues_partner_id_foreign" FOREIGN KEY("partner_id") REFERENCES "partners"("id");
ALTER TABLE
    "proposals" ADD CONSTRAINT "proposals_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "users"("id");
ALTER TABLE
    "cfps" ADD CONSTRAINT "cfps_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "users"("id");
ALTER TABLE
    "sponsor_packs" ADD CONSTRAINT "sponsor_packs_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "groups"("id");
ALTER TABLE
    "contacts" ADD CONSTRAINT "contacts_partner_id_foreign" FOREIGN KEY("partner_id") REFERENCES "partners"("id");
ALTER TABLE
    "proposals" ADD CONSTRAINT "proposals_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("id");
ALTER TABLE
    "partners" ADD CONSTRAINT "partners_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "groups"("id");
ALTER TABLE
    "talks" ADD CONSTRAINT "talks_id_foreign" FOREIGN KEY("id") REFERENCES "proposals"("id");
ALTER TABLE
    "talks" ADD CONSTRAINT "talks_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "proposals"("created_at");
ALTER TABLE
    "events" ADD CONSTRAINT "events_cfp_id_foreign" FOREIGN KEY("cfp_id") REFERENCES "cfps"("id");
ALTER TABLE
    "comments" ADD CONSTRAINT "comments_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "users"("id");
ALTER TABLE
    "event_rsvps" ADD CONSTRAINT "event_rsvps_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_orga_notes_updated_by_foreign" FOREIGN KEY("orga_notes_updated_by") REFERENCES "users"("id");
ALTER TABLE
    "sponsors" ADD CONSTRAINT "sponsors_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "groups"("id");
ALTER TABLE
    "comments" ADD CONSTRAINT "comments_proporsal_id_foreign" FOREIGN KEY("proporsal_id") REFERENCES "proposals"("id");
ALTER TABLE
    "proposals" ADD CONSTRAINT "proposals_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "events"("slug");
ALTER TABLE
    "logins" ADD CONSTRAINT "logins_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "cfps" ADD CONSTRAINT "cfps_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "groups"("id");
ALTER TABLE
    "talks" ADD CONSTRAINT "talks_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "proposals"("updated_at");
ALTER TABLE
    "proposals" ADD CONSTRAINT "proposals_dieckription_foreign" FOREIGN KEY("dieckription") REFERENCES "users"("id");
ALTER TABLE
    "event_rsvps" ADD CONSTRAINT "event_rsvps_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "cfps"("id");
ALTER TABLE
    "proposals" ADD CONSTRAINT "proposals_cfp_id_foreign" FOREIGN KEY("cfp_id") REFERENCES "cfps"("id");
ALTER TABLE
    "propaorsal_rating" ADD CONSTRAINT "propaorsal_rating_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "events"("orga_notes_updated_at");
ALTER TABLE
    "partners" ADD CONSTRAINT "partners_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "users"("id");
ALTER TABLE
    "sponsors" ADD CONSTRAINT "sponsors_partner_id_foreign" FOREIGN KEY("partner_id") REFERENCES "partners"("id");
ALTER TABLE
    "groups" ADD CONSTRAINT "groups_id_foreign" FOREIGN KEY("id") REFERENCES "groups"("id");
ALTER TABLE
    "comments" ADD CONSTRAINT "comments_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "events"("updated_at");
ALTER TABLE
    "venues" ADD CONSTRAINT "venues_contact_id_foreign" FOREIGN KEY("contact_id") REFERENCES "contacts"("id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "groups"("id");
ALTER TABLE
    "talks" ADD CONSTRAINT "talks_speakers_foreign" FOREIGN KEY("speakers") REFERENCES "proposals"("dieckription");
ALTER TABLE
    "sponsors" ADD CONSTRAINT "sponsors_contact_id_foreign" FOREIGN KEY("contact_id") REFERENCES "contacts"("id");
ALTER TABLE
    "partners" ADD CONSTRAINT "partners_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "users"("id");
ALTER TABLE
    "propaorsal_rating" ADD CONSTRAINT "propaorsal_rating_proporsal_id_foreign" FOREIGN KEY("proporsal_id") REFERENCES "proposals"("id");
ALTER TABLE
    "cfps" ADD CONSTRAINT "cfps_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "users"("id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "users"("id");