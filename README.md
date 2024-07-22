# scBTQ-core

## Overview

This repository contains the Solidity smart contracts for the Bitcoin Quantum (BTQ) and USDT tokens, along with the ICO (Initial Coin Offering) contracts. The structure is organized into three main directories: BTQ, BTQICO, and USDT_Test.

## Repository Structure

```
scBTQ-core/
│
├── BTQ/
│   ├── docs/
│   ├── BTQ_flattened.sol
│   ├── BTQ.sol
│
├── BTQICO/
│   ├── docs/
│   ├── BTQICO_flattened.sol
│   ├── BTQICO.sol
│
├── USDT_Test/
│   ├── docs/
│   ├── USDT_Test_flattened.sol
│   ├── USDT_Test.sol
│
├── README.md
```

## Contracts

### BTQ

- `BTQ.sol`: This contract defines the BTQ token, its properties, and functions.
- `BTQ_flattened.sol`: A flattened version of `BTQ.sol` for easier deployment and verification.

### BTQICO

- `BTQICO.sol`: This contract handles the Initial Coin Offering (ICO) for the BTQ token.
- `BTQICO_flattened.sol`: A flattened version of `BTQICO.sol` for easier deployment and verification.

### USDT_Test

- `USDT_Test.sol`: This contract defines a test version of the USDT token, its properties, and functions.
- `USDT_Test_flattened.sol`: A flattened version of `USDT_Test.sol` for easier deployment and verification.

## Documentation

Each directory contains a `docs` folder where you can find detailed documentation on the respective contracts, including their functions, events, and usage examples.

## Installation

To work with these contracts, you need to have `solc` (Solidity Compiler) and `npm` (Node Package Manager) installed. Follow the steps below to set up your environment:

1. Install `solc`:
    ```sh
    npm install -g solc
    ```

2. Install dependencies:
    ```sh
    npm install
    ```

## Compilation

You can compile the Solidity contracts using the following command:

```sh
solc --optimize --bin --abi --combined-json bin,abi <contract_name>.sol -o build/
```

Replace `<contract_name>` with the name of the contract you want to compile.

## Deployment

For deployment, you can use tools like Truffle or Hardhat. Below are the steps for deploying with Hardhat:

1. Install Hardhat:
    ```sh
    npm install --save-dev hardhat
    ```

2. Initialize Hardhat:
    ```sh
    npx hardhat
    ```

3. Create a deployment script in the `scripts/` directory, e.g., `deploy.js`.

4. Run the deployment script:
    ```sh
    npx hardhat run scripts/deploy.js --network <network_name>
    ```

Replace `<network_name>` with the name of the network you are deploying to, such as `mainnet` or `ropsten`.

## Usage

After deployment, you can interact with the contracts using web3.js or ethers.js. Below is an example of how to interact with the BTQ token using web3.js:

```javascript
const Web3 = require('web3');
const web3 = new Web3('https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID');

const btqAbi = [/* ABI from the compiled contract */];
const btqAddress = 'BTQ_CONTRACT_ADDRESS';

const btq = new web3.eth.Contract(btqAbi, btqAddress);

// Example: Check balance of an address
const address = 'YOUR_ADDRESS';
btq.methods.balanceOf(address).call().then(balance => {
  console.log(`Balance: ${balance}`);
});
```

## Contributing

Contributions are welcome! Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file for more information on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

Place this content in your `README.md` file to provide a clear and comprehensive guide for users interacting with your project. Feel free to adjust the details as per your project's specific requirements and setup.