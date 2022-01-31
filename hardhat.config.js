require('@nomiclabs/hardhat-waffle')
require('@nomiclabs/hardhat-etherscan')

require('dotenv').config()

module.exports = {
  networks: {
    rinkeby: {
      url: `${process.env.ALCHEMY_RINKEBY_URL}`,
      accounts: [`${process.env.RINKEBY_PRIVATE_KEY}`],
    },
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: '6DX62I39FG2J95EJTQH6QJCKF2N4R5M2CC',
  },
  solidity: '0.8.0',
}
//6DX62I39FG2J95EJTQH6QJCKF2N4R5M2CC  etherscan API key
//0xB2f75C5E727f79d4DF252158c06b71a87DdC5Dc2  deployed address
//https://rinkeby.etherscan.io/address/0xB2f75C5E727f79d4DF252158c06b71a87DdC5Dc2#code  verified address
