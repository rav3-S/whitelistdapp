const { ethers } = require("hardhat");

async function main() {
     /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */

  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // deploy contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the max no. of whitelisted addresses allowed

  //wait for deployment
  await deployedWhitelistContract.deployed();

  //print address of deployed contract
  console.log(
      "Whitelist Contract Address:",
      deployedWhitelistContract.address
  );
}

//catch errors
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });