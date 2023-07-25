const hre = require("hardhat");

async function main() {
  const WiseSaying = await ethers.getContractFactory("WiseSaying");

  const deployedContract = await WiseSaying.deploy();

  const address = await deployedContract.getAddress();
  
  console.log("Contract Deployed to Address:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});