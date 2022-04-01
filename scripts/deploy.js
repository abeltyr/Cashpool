const main = async() => {
    const GalaxyNftContract = await ethers.getContractFactory("GalaxyNftContract");

    const Galaxy_NftContract = await GalaxyNftContract.deploy();

    await Galaxy_NftContract.deployed();

    console.log("My NFT deployed to:", Galaxy_NftContract.address);


}

main()
    .then(() => process.exit(0))
    .catch((error => {
        console.error("Error Data", error)
        process.exit(1)
    }));