import axios from "axios";
import { LOCAL_CONSTANTS } from "../constants";

export const getDrivers = async () => {
  const { data } = await axios.get(`${LOCAL_CONSTANTS.BASE_URL}drivers`);
  return data;
};

export const getDriver = async (id) => {
  const { data } = await axios.get(`${LOCAL_CONSTANTS.BASE_URL}drivers/${id}`);
  return data;
};

export const createDriver = async (data) => {
  const payload = {
    driver: data,
  };
  console.log(payload);
  const response = await axios.post(
    `${LOCAL_CONSTANTS.BASE_URL}drivers`,
    payload
  );
  console.log(response);
  return response;
};

export const editDriver = async (id, data) => {
  console.log(data);
  const payload = {
    driver: data,
  };
  console.log(payload);
  const response = await axios.put(
    `${LOCAL_CONSTANTS.BASE_URL}drivers/${id}`,
    payload
  );
  console.log(response);
  return response;
};

export const deleteDriver = async (id) => {
  const response = await axios.delete(
    `${LOCAL_CONSTANTS.BASE_URL}drivers/${id}`
  );
  return response;
};
