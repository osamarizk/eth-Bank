const EthBank = artifacts.require("EthBank");

module.exports = function (deployer) {
  deployer.deploy(EthBank);
};
