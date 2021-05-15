-- CreateTable
CREATE TABLE "association" (
    "id" SERIAL NOT NULL,
    "lunid" INTEGER NOT NULL,
    "targetId" INTEGER NOT NULL,
    "extentId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disk" (
    "id" SERIAL NOT NULL,
    "bootable" BOOLEAN NOT NULL,
    "enabled" BOOLEAN NOT NULL,
    "priority" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "associationId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "disk" ADD FOREIGN KEY ("associationId") REFERENCES "association"("id") ON DELETE CASCADE ON UPDATE CASCADE;
