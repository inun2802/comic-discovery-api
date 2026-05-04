import { prisma } from "../prisma.js";

export async function createIssue(req, res) {
  try {
    const { id, seriesId, issueNumber, title, releaseDate, universe, isFirstAppearance, isMajorCrossover, isKeyIssue } = req.body;

    if (!id || !seriesId) {
      return res.status(400).json({
        error: "id and seriesId are required",
      });
    }

    const issue = await prisma.issue.create({
      data: {
        id,
        seriesId,
        issueNumber: issueNumber || null,
        title: title || null,
        releaseDate: releaseDate ? new Date(releaseDate) : null,
        updatedAt: new Date(),
        universe: universe || "main",
        isFirstAppearance: isFirstAppearance || false,
        isMajorCrossover: isMajorCrossover || false,
        isKeyIssue: isKeyIssue || false,
      },
    });

    res.status(201).json(issue);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}

export async function getAllIssues(req, res) {
  try {
    const { universe, isFirstAppearance, isMajorCrossover, isKeyIssue } = req.query;

    const where = {};
    
    if (universe) {
      where.universe = universe;
    }
    if (isFirstAppearance !== undefined) {
      where.isFirstAppearance = isFirstAppearance === "true";
    }
    if (isMajorCrossover !== undefined) {
      where.isMajorCrossover = isMajorCrossover === "true";
    }
    if (isKeyIssue !== undefined) {
      where.isKeyIssue = isKeyIssue === "true";
    }

    const issues = await prisma.issue.findMany({
      where,
      include: {
        series: true,
      },
      orderBy: {
        releaseDate: "asc",
      }
    });

    res.json(issues);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}

export async function getIssueById(req, res) {
  try {
    const issue = await prisma.issue.findUnique({
      where: { id: req.params.id },
      include: {
        series: true,
        characterLinks: {
          include: { character: true },
        },
        creatorLinks: {
          include: { creator: true },
        },
      },
    });

    if (!issue) return res.status(404).json({ error: "Issue not found" });
    res.json(issue);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}

export async function getIssueCreators(req, res) {
  try {
    const links = await prisma.issueCreator.findMany({
      where: { issueId: req.params.id },
      include: { creator: true },
      orderBy: { role: "asc" },
    });
    res.json(links);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}