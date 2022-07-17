import axios from "axios";
import CustomerType from "@/types/user";

const userService = () => {
  const api = axios.create({
    baseURL: `http://localhost:8000/api/v1`,
  });

  return {
    getCustomers: async () => {
      try {
        const response = await api.get("/customers");
        return { data: response.data.data.customers };
      } catch (error) {
        if (error instanceof Error) {
          return { error: true, message: error.message };
        }
        return { error: true, message: "Unknown error" };
      }
    },
    deleteCustomer: async (userId: string) => {
      try {
        const response = await api.post(`/customers/delete`, {
          customer_id: `${encodeURI(userId)}`,
        });
        return { data: response.data };
      } catch (error) {
        if (error instanceof Error) {
          return { error: true, message: error.message };
        }
        return { error: true, message: "Unknown error" };
      }
    },
    updateCustomer: async (updatedUser: any) => {
      try {
        const { id } = updatedUser;
        const data = updatedUser;
        data.customer_id = id;
        const response = await api.post(`/customers/update`, data);
        return { data: response.data };
      } catch (error) {
        if (error instanceof Error) {
          return { error: true, message: error.message };
        }
        return { error: true, message: "Unknown error" };
      }
    },
    createCustomer: async (newUser: CustomerType) => {
      try {
        const response = await api.post("/customers", newUser);
        return { data: response.data };
      } catch (error) {
        console.error(error);
        if (error instanceof Error) {
          return { error: true, message: error.message };
        }
        return { error: true, message: "Unknown error" };
      }
    },
  };
};

export default userService();
