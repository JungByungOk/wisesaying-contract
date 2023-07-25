/** 
 1) Alchemy 노드 공급자 이용 한다.
 2) Sepolia Network에 배포한다.
 3) Metamask 지갑을 연동한다. 
*/
require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ethers");
require('dotenv').config();

const { API_URL, PRIVATE_KEY } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {
      //chainId: 1337,
    },
    sepolia: {
      url: API_URL,
      chainId: 11155111,
      accounts: [`0x${PRIVATE_KEY}`]
    },
    dev: {
      url: "http://127.0.0.1:7545",
      chainId: 1337,
      accounts: [
        "0xa29d83af4f1bf9e84d4641c90751d001f1438a0399a09a5030618a84843ea942",
        "0x9661f74b185aee3a523615cf00d3ae2fda61c09971d828c77801b49a740d4c7a",
      ],
    },
  },
};
