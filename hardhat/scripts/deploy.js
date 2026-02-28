const hre = require("hardhat");

async function main() {
    const ContractFactory = await hre.ethers.getContractFactory("Adoption");

    const contract = await ContractFactory.deploy();
    await contract.waitForDeployment();

    console.log("Contract deployed to:", await contract.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });