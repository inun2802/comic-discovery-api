import { prisma } from "../prisma.js";

export async function createIssue(req, res) {
  try {
    const { id, seriesId, issueNumber, title, releaseDate } = req.body;

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
    const issues = await prisma.issue.findMany({
      include: {
        series: true,
      },
    });

    res.json(issues);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}