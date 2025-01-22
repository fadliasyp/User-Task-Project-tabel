/*
  Warnings:

  - The primary key for the `task` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_task` on the `task` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `task` DROP FOREIGN KEY `task_assignedTo_fkey`;

-- DropForeignKey
ALTER TABLE `task` DROP FOREIGN KEY `task_projectId_fkey`;

-- DropIndex
DROP INDEX `task_assignedTo_key` ON `task`;

-- DropIndex
DROP INDEX `task_projectId_fkey` ON `task`;

-- AlterTable
ALTER TABLE `task` DROP PRIMARY KEY,
    DROP COLUMN `id_task`,
    MODIFY `assignedTo` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`assignedTo`);

-- AddForeignKey
ALTER TABLE `task` ADD CONSTRAINT `task_assignedTo_fkey` FOREIGN KEY (`assignedTo`) REFERENCES `user`(`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task` ADD CONSTRAINT `task_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `project`(`id_project`) ON DELETE RESTRICT ON UPDATE CASCADE;
