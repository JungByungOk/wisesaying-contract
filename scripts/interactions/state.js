async function main () {
    // getting a contract instance
    const address = '0xD4dFF05B21dC713CCd3eabf5A6fF4CB12E0Ce387';
    const WiseSaying = await ethers.getContractFactory('WiseSaying');
    const contract = await WiseSaying.attach(address);

    //
    //const quantity = await contract.totalSupply();
    console.log("\tContract Name = %s", await contract.name());
    console.log("\tContract Symbol = %s", await contract.symbol());
    console.log("\tContract Owner Address = %s", await contract.owner());
    console.log("\ttotalSupply = %d", await contract.totalSupply());

  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });