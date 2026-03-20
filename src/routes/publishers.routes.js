import express from "express";
import { createPublisher } from "../controllers/publishers.controller.js";

const router = express.Router();

router.post("/", createPublisher);

export default router;