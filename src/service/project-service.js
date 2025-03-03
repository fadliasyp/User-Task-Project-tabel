import { prismaClient } from "../application/database.js";
import { ResponseError } from "../error/response-error.js";
import { validate } from "../validation/validation.js";
import { createValidation } from "../validation/project-validation.js";
import { request } from "express";

const createProject = async (request) => {
    const project = validate(createValidation, request);

    if (!project) {
        throw new ResponseError(400, "Data tidak lengkap");
      }

      return prismaClient.project.create({
        data: {
            name: project.name,
            description: project.description
        }
      })
}

const getAll = async (request) => {
  const users = await prismaClient.project.findMany({
    where: {},
    include: {
      task: true
    }
  })

  return {
    users
  }
}

const editByIdProject = async (request, params, authorization) => {
  const project = validate(createValidation, request)
  const {id} = params

  // const token = authorization.split(" ")[1];

  // const userProject = await prismaClient.user.findFirstOrThrow({
  //   where: {
  //     token: token
  //   }
  // })
  // if (!userProject) {
  //   throw new ResponseError(404, "token invalid");
  // }

  const project2 = await prismaClient.project.update({
    where: {
      id_project: parseInt(id)
    },
    data:{
      name: project.name,
      description: project.description
    },
    include: {
      task: true
    }
  })
  return project2
}

const deleteProject = async (request, params) => {
  const { id } = params;
  return await prismaClient.project.delete({
    where:{
      id_project: parseInt(id)
    }
  })
}

export default{
    createProject,
    getAll,
    editByIdProject,
    deleteProject
}

