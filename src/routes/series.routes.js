import express from "express";
import { createSeries, getAllSeries, getSeriesIssues } from "../controllers/series.controller.js";

const router = express.Router();

router.get("/", getAllSeries);
router.post("/", createSeries);
router.get("/:id/issues", getSeriesIssues);

export default router;