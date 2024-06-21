-- CreateEnum
CREATE TYPE "ValueType" AS ENUM ('number', 'string', 'boolean');

-- CreateTable
CREATE TABLE "User" (
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "id" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Object" (
    "name" TEXT NOT NULL,
    "type" "ValueType" NOT NULL,
    "id" TEXT NOT NULL,
    "valueId" TEXT NOT NULL,
    "successorId" TEXT,

    CONSTRAINT "Object_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Value" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "Value_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Object_valueId_key" ON "Object"("valueId");

-- CreateIndex
CREATE UNIQUE INDEX "Object_successorId_key" ON "Object"("successorId");

-- AddForeignKey
ALTER TABLE "Object" ADD CONSTRAINT "Object_valueId_fkey" FOREIGN KEY ("valueId") REFERENCES "Value"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Object" ADD CONSTRAINT "Object_successorId_fkey" FOREIGN KEY ("successorId") REFERENCES "Object"("id") ON DELETE SET NULL ON UPDATE CASCADE;
