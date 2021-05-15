-- CreateTable
CREATE TABLE "device" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(255) NOT NULL,
    "mac" VARCHAR(255) NOT NULL,
    "ipv4" VARCHAR(255) NOT NULL,
    "ipv6" VARCHAR(255) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "group" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_deviceTogroup" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_deviceTogroup_AB_unique" ON "_deviceTogroup"("A", "B");

-- CreateIndex
CREATE INDEX "_deviceTogroup_B_index" ON "_deviceTogroup"("B");

-- AddForeignKey
ALTER TABLE "_deviceTogroup" ADD FOREIGN KEY ("A") REFERENCES "device"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_deviceTogroup" ADD FOREIGN KEY ("B") REFERENCES "group"("id") ON DELETE CASCADE ON UPDATE CASCADE;
