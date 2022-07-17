const validator = require("../../utils/validator");
const resonseView = require("../../utils/sendResponse");
const db = require("../../models/index");
const Customers = db.customers;

module.exports = {
  addCustomer: async (req, res) => {
    try {
      const { first_name, last_name, state, country } = req.body;
      const errorMessages = validator.validateFields({
        first_name,
        last_name,
        state,
        country,
      });

      if (errorMessages.length) {
        return resonseView.sendResponse(errorMessages, "failed", 422, res);
      }

      const insertCustomer = await Customers.create({
        first_name,
        last_name,
        state,
        country,
      });
      if (!!insertCustomer) {
        return resonseView.sendResponse(
          "Customer inserted succefully.",
          "success",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!.");
      }
    } catch (err) {
      return resonseView.sendResponse(err.message, "failed", 400, res);
    }
  },

  getAllCustomers: async (req, res) => {
    try {
      const allCustomers = await Customers.findAll({
        order: [["id", "DESC"]],
      });
      if (!!allCustomers) {
        return resonseView.sendResponseWithData(
          "success",
          "success",
          200,
          { customers: allCustomers, count: allCustomers.length },
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return resonseView.sendResponse(err.message, "failed", 400, res);
    }
  },

  updateCustomer: async (req, res) => {
    try {
      const { customer_id, first_name, last_name, state, country } = req.body;
      const errorMessages = validator.validateFields({
        customer_id,
        first_name,
        last_name,
        state,
        country,
      });

      if (errorMessages.length) {
        return resonseView.sendResponse(errorMessages, "failed", 422, res);
      }

      const getCustomer = await Customers.findOne({
        where: { id: customer_id },
      });
      if (!getCustomer) {
        throw new Error("Customer not found with provided customer id.");
      }

      const updateCustomer = await Customers.update(
        {
          first_name,
          last_name,
          state,
          country,
        },
        {
          where: { id: customer_id },
        }
      );
      if (!!updateCustomer) {
        return resonseView.sendResponse(
          "Customer updated succefully.",
          "success",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return resonseView.sendResponse(err.message, "failed", 400, res);
    }
  },

  deleteCustomer: async (req, res) => {
    try {
      const { customer_id } = req.body;
      const errorMessages = validator.validateFields({ customer_id });
      if (errorMessages.length) {
        return resonseView.sendResponse(errorMessages, "failed", 422, res);
      }

      const getCustomer = await Customers.findOne({
        where: { id: customer_id },
      });
      if (!getCustomer) {
        throw new Error("Customer not found with provided customer id.");
      }

      const deleteCustomer = await Customers.destroy({
        where: { id: customer_id },
      });
      if (!!deleteCustomer) {
        return resonseView.sendResponse(
          "Customer deleted succefully.",
          "success",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return resonseView.sendResponse(err.message, "failed", 400, res);
    }
  },
};
