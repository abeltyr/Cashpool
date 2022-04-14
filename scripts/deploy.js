const main = async() => {
    const CashPool1Contract = await ethers.getContractFactory("CashPool1Contract");

    const CashPool1_Contract = await CashPool1Contract.deploy();

    await CashPool1_Contract.deployed();

    console.log("My NFT deployed to:", CashPool1_Contract.address);


}

main()
    .then(() => process.exit(0))
    .catch((error => {
        console.error("Error Data", error)
        process.exit(1)
    }));