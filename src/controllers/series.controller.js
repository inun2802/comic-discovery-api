import { prisma } from "../prisma.js";

export async function createSeries(req, res) {
  try {
    const { id, title, publisherId } = req.body;

    if (!id || !title || !publisherId) {
      return res.status(400).json({
        error: "id, title, and publisherId are required",
      });
    }

    const series = await prisma.series.create({
      data: {
        id,
        title,
        publisherId,
        updatedAt: new Date(),
      },
    });

    res.status(201).json(series);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}

export async function getAllSeries(req, res) {
  try {
    const series = await prisma.series.findMany({
      include: {
        publisher: true,
      },
    });

    res.json(series);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}