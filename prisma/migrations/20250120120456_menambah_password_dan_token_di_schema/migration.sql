/*
  Warnings:

  - Added the required column `password` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `token` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` ADD COLUMN `password` VARCHAR(225) NOT NULL,
    ADD COLUMN `token` VARCHAR(225) NOT NULL;
