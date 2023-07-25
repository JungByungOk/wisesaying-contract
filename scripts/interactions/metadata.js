async function main () {
    // getting a contract instance
    const address = '0xD4dFF05B21dC713CCd3eabf5A6fF4CB12E0Ce387';
    const WiseSaying = await ethers.getContractFactory('WiseSaying');
    const contract = await WiseSaying.attach(address);

    const value = await contract.totalSupply();   //uint256 -> BigInt -> Number(BigInt)
    
    for (i = 0; i < Number(value); i++) {
        console.log("[#%d]", i)

        await contract.tokenURI(i).then(
            (result) => console.log("%s", result))
            .catch(err => console.log(err))
    }
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });