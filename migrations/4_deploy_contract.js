const Bank = artifacts.require("Bank.sol");

module.exports = function(deployer) {
  deployer.deploy(Bank, { value: 30000000000000000000 });
};
