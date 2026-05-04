-- CreateTable
CREATE TABLE "Creator" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "nationality" TEXT,
    "birthYear" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Creator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssueCreator" (
    "issueId" TEXT NOT NULL,
    "creatorId" TEXT NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "IssueCreator_pkey" PRIMARY KEY ("issueId","creatorId","role")
);

-- CreateIndex
CREATE INDEX "Creator_name_idx" ON "Creator"("name");

-- AddForeignKey
ALTER TABLE "IssueCreator" ADD CONSTRAINT "IssueCreator_issueId_fkey" FOREIGN KEY ("issueId") REFERENCES "Issue"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IssueCreator" ADD CONSTRAINT "IssueCreator_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "Creator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
