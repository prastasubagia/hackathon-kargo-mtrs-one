import axios from "axios";
import { LOCAL_CONSTANTS } from "../constants";

export const getTruckTypes = async () => {
  const { data } = await axios.get(`${LOCAL_CONSTANTS.BASE_URL}truck-types`);
  return data;
};

export const getTruckType = async (id) => {
  const { data } = await axios.get(
    `${LOCAL_CONSTANTS.BASE_URL}truck-types/${id}`
  );
  return data;
};
