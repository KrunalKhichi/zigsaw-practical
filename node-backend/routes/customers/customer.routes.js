const router = require("express").Router();
const customerController = require("../../controllers/customers/customersController");

router.post("/", customerController.addCustomer);
router.get("/", customerController.getAllCustomers);
router.post("/update", customerController.updateCustomer);
router.post("/delete", customerController.deleteCustomer);
module.exports = router;
