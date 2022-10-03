CREATE TABLE "train_station" (
  "name" varchar PRIMARY KEY,
  "tracks" varchar
);

CREATE TABLE "city" (
  "name" varchar UNIQUE NOT NULL,
  "region" varchar UNIQUE NOT NULL,
  PRIMARY KEY (name, region)
);

CREATE TABLE "train" (
  "trainNr" varchar PRIMARY KEY,
  "length" int
);

ALTER TABLE "train_station" ADD FOREIGN KEY ("name") REFERENCES "city" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("trainNr") REFERENCES "train_station" ("name");
