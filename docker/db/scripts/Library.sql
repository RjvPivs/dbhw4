CREATE TABLE "book" (
  "ISBN" varchar PRIMARY KEY,
  "year" int,
  "pages" int,
  "name" varchar,
  "author" varchar
);

CREATE TABLE "copy" (
  "ISBN" int,
  "location" int,
  "number" varchar PRIMARY KEY
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "subcat" varchar
);

CREATE TABLE "publisher" (
  "address" varchar,
  "name" varchar PRIMARY KEY
);

CREATE TABLE "reader" (
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birthday" int,
  "number" varchar PRIMARY KEY
);

CREATE TABLE "book_category" (
  "book_ISBN" varchar NOT NULL,
  "category_name" varchar NOT NULL,
  PRIMARY KEY ("book_ISBN", "category_name")
);

ALTER TABLE "book_category" ADD FOREIGN KEY ("book_ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book_category" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");


ALTER TABLE "category" ADD FOREIGN KEY ("subcat") REFERENCES "category" ("name");

ALTER TABLE "copy" ADD FOREIGN KEY ("number") REFERENCES "book" ("ISBN");

ALTER TABLE "book" ADD FOREIGN KEY ("ISBN") REFERENCES "publisher" ("name");

ALTER TABLE "copy" ADD FOREIGN KEY ("number") REFERENCES "reader" ("number");
