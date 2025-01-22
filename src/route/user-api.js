import express from "express";
import userController from "../controller/user-controller.js";
import authMiddleware from "../middleware/auth-middleware.js";

const userRoute = new express.Router();
userRoute.post("/register",userController.register);
userRoute.post("/login",userController.login);
userRoute.delete("/logout", authMiddleware,userController.logout);
// userRoute.get("/users", authMiddleware, userController.getUser);
userRoute.get("/users", userController.getAll);
userRoute.put("/users/:id", authMiddleware, userController.editById);


export { userRoute };