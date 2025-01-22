/*
  Warnings:

  - A unique constraint covering the columns `[assignedTo]` on the table `task` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `task_assignedTo_key` ON `task`(`assignedTo`);
