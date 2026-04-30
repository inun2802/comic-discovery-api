-- CreateTable
CREATE TABLE "Team" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "publisherId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Team_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TeamMember" (
    "teamId" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "TeamMember_pkey" PRIMARY KEY ("teamId","characterId")
);

-- CreateTable
CREATE TABLE "IssueTeam" (
    "issueId" TEXT NOT NULL,
    "teamId" TEXT NOT NULL,
    "role" TEXT,

    CONSTRAINT "IssueTeam_pkey" PRIMARY KEY ("issueId","teamId")
);

-- CreateTable
CREATE TABLE "StoryArc" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "publisherId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StoryArc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoryArcIssue" (
    "storyArcId" TEXT NOT NULL,
    "issueId" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "StoryArcIssue_pkey" PRIMARY KEY ("storyArcId","issueId")
);

-- CreateIndex
CREATE INDEX "Team_name_idx" ON "Team"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Team_publisherId_name_key" ON "Team"("publisherId", "name");

-- CreateIndex
CREATE INDEX "StoryArc_title_idx" ON "StoryArc"("title");

-- CreateIndex
CREATE UNIQUE INDEX "StoryArc_publisherId_title_key" ON "StoryArc"("publisherId", "title");

-- AddForeignKey
ALTER TABLE "Team" ADD CONSTRAINT "Team_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "Publisher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeamMember" ADD CONSTRAINT "TeamMember_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeamMember" ADD CONSTRAINT "TeamMember_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IssueTeam" ADD CONSTRAINT "IssueTeam_issueId_fkey" FOREIGN KEY ("issueId") REFERENCES "Issue"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IssueTeam" ADD CONSTRAINT "IssueTeam_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoryArc" ADD CONSTRAINT "StoryArc_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "Publisher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoryArcIssue" ADD CONSTRAINT "StoryArcIssue_storyArcId_fkey" FOREIGN KEY ("storyArcId") REFERENCES "StoryArc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoryArcIssue" ADD CONSTRAINT "StoryArcIssue_issueId_fkey" FOREIGN KEY ("issueId") REFERENCES "Issue"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
