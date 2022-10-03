CREATE TABLE "stationPersonell" (
  "persNr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "caregiver" (
  "persNr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "persNr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "patient" (
  "patientNr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar
);

CREATE TABLE "room" (
  "roomNr" int PRIMARY KEY,
  "beds" int
);

CREATE TABLE "station" (
  "name" varchar,
  "statNr" int PRIMARY KEY
);

ALTER TABLE "stationPersonell" ADD FOREIGN KEY ("persNr") REFERENCES "station" ("statNr");

ALTER TABLE "room" ADD FOREIGN KEY ("roomNr") REFERENCES "station" ("statNr");

CREATE TABLE "room_patient" (
  "room_roomNr" int NOT NULL,
  "patient_patientNr" int NOT NULL,
  PRIMARY KEY ("room_roomNr", "patient_patientNr")
);

ALTER TABLE "room_patient" ADD FOREIGN KEY ("room_roomNr") REFERENCES "room" ("roomNr");

ALTER TABLE "room_patient" ADD FOREIGN KEY ("patient_patientNr") REFERENCES "patient" ("patientNr");


ALTER TABLE "patient" ADD FOREIGN KEY ("patientNr") REFERENCES "doctor" ("persNr");

ALTER TABLE "doctor" ADD FOREIGN KEY ("persNr") REFERENCES "station" ("statNr");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("persNr") REFERENCES "station" ("statNr");
