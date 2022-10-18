import { ethers } from "hardhat";

async function main() {

const name_ :string = 'MooSamChunt'

  const Cat = await ethers.getContractFactory("Cat");
  const cat = await Cat.deploy(name_);

  await cat.deployed();

  console.log(`Cat Contract deployed to ${cat.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
