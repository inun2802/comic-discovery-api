import express from "express";
import { createIssue, getAllIssues, getIssueById, getIssueCreators } from "../controllers/issues.controller.js";

const router = express.Router();

router.get("/", getAllIssues);
router.post("/", createIssue);
router.get("/:id", getIssueById);
router.get("/:id/creators", getIssueCreators);

export default router;