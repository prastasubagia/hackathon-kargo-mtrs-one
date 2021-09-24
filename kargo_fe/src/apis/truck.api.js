import axios from "axios";
import { LOCAL_CONSTANTS } from "../constants";

export const getTrucks = async () => {
  const { data } = await axios.get(`${LOCAL_CONSTANTS.BASE_URL}trucks`);
  return data;
};

export const getTruck = async (id) => {
  const { data } = await axios.get(`${LOCAL_CONSTANTS.BASE_URL}trucks/${id}`);
  return data;
};

export const createTruck = async (data) => {
  const response = await axios.post(`${LOCAL_CONSTANTS.BASE_URL}trucks`, data);
  console.log(response);
  return response;
};

export const editTruck = async ({ id, data }) => {
  const response = await axios.patch(
    `${LOCAL_CONSTANTS.BASE_URL}trucks/${id}`,
    data
  );
  console.log(response);
  return response;
};

export const deleteTruck = async (id) => {
  const response = await axios.delete(
    `${LOCAL_CONSTANTS.BASE_URL}trucks/${id}`
  );
  return response;
};
