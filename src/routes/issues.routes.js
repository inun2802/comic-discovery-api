import express from "express";
import { createIssue, getAllIssues } from "../controllers/issues.controller.js";

const router = express.Router();

router.get("/", getAllIssues);
router.post("/", createIssue);

export default router;