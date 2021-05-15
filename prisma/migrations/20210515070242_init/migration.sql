/*
  Warnings:

  - Changed the type of `uuid` on the `device` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `ipv4` on the `device` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `ipv6` on the `device` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "association" DROP CONSTRAINT "association_extentId_fkey";

-- AlterTable
ALTER TABLE "device" DROP COLUMN "uuid",
ADD COLUMN     "uuid" UUID NOT NULL,
DROP COLUMN "ipv4",
ADD COLUMN     "ipv4" INET NOT NULL,
DROP COLUMN "ipv6",
ADD COLUMN     "ipv6" INET NOT NULL;

-- AddForeignKey
ALTER TABLE "association" ADD FOREIGN KEY ("targetId") REFERENCES "extent"("id") ON DELETE CASCADE ON UPDATE CASCADE;
