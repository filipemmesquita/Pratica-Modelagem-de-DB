CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" varchar(50) NOT NULL,
	"mainAddressId" int,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"price" int NOT NULL,
	"mainPictureId" int,
	"categoryId" int NOT NULL,
	"sizeId" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productCategories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "productCategories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"buyerId" int NOT NULL,
	"date" DATE NOT NULL DEFAULT 'NOW()',
	"addressId" int NOT NULL,
	"stateId" int NOT NULL,
	"priceTotal" int NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"link" TEXT NOT NULL,
	"productId" int NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productSize" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "productSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchasedProducts" (
	"id" serial NOT NULL,
	"purchaseId" int NOT NULL,
	"productId" int NOT NULL,
	"amount" int NOT NULL,
	CONSTRAINT "purchasedProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.userAdresses" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"address" TEXT NOT NULL,
	CONSTRAINT "userAdresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseState" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "purchaseState_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("mainAddressId") REFERENCES "userAdresses"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPictureId") REFERENCES "pictures"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "productCategories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("sizeId") REFERENCES "productSize"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("buyerId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("addressId") REFERENCES "userAdresses"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("stateId") REFERENCES "purchaseState"("id");

ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "purchasedProducts" ADD CONSTRAINT "purchasedProducts_fk0" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");
ALTER TABLE "purchasedProducts" ADD CONSTRAINT "purchasedProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "userAdresses" ADD CONSTRAINT "userAdresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");











