async function main () {
    // getting a contract instance
    const address = '0xD4dFF05B21dC713CCd3eabf5A6fF4CB12E0Ce387';
    const WiseSaying = await ethers.getContractFactory('WiseSaying');
    const contract = await WiseSaying.attach(address);
    
    const value = await contract.totalSupply();   //uint256 -> BigInt -> Number(BigInt)
    await contract.safeMint('0x3acD5AafD8a8b948Efc02BFEE5dC0A820aD9677D').then(
        (result) => console.log("\tMinted TokenID = %s", Number(value)+1))
        .catch(err => console.log(err))
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });