import express from "express";
import { createSeries, getAllSeries } from "../controllers/series.controller.js";

const router = express.Router();

router.get("/", getAllSeries);
router.post("/", createSeries);

export default router;