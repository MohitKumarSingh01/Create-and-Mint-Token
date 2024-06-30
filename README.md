# HealthCoin Smart Contract

## Overview

The `HealthCoin` contract is a custom ERC20 token built on the Ethereum blockchain. It leverages OpenZeppelin's secure and standardized ERC20 implementation to ensure robust and reliable token functionality. This token is designed for use in health-related applications and platforms, providing a secure and transparent means of transaction and value transfer.

## Token Details

- **Token Name**: HealthCoin
- **Token Symbol**: HLTH
- **Decimals**: 10
- **Initial Supply**: 100 HealthCoins (minted to the contract owner's address)

## Features

- **Ownership**: The contract owner has exclusive rights to mint new tokens.
- **Minting**: Allows the owner to create new tokens and assign them to specific addresses.
- **Burning**: Enables token holders to destroy tokens from their own balance, reducing the total supply.
- **Transferring**: Facilitates the transfer of tokens between addresses.

## Functions

### Constructor

Initializes the contract by setting the deployer as the owner and minting an initial supply of tokens.

```solidity
constructor() ERC20("HealthCoin", "HLTH") {
    contractOwner = msg.sender;
    _mint(contractOwner, 100 * 10**decimals());
}
```

### `decimals`

Overrides the default decimals function to set the token to use 10 decimal places.

```solidity
function decimals() public pure override returns (uint8) {
    return 10;
}
```

### `mintNewTokens`

Mints new tokens to a specified address. This function can only be called by the contract owner.

```solidity
function mintNewTokens(address recipient, uint256 tokenAmount) public onlyContractOwner {
    _mint(recipient, tokenAmount);
}
```

### `burnTokens`

Allows any token holder to burn a specified amount of their tokens, reducing the total supply.

```solidity
function burnTokens(uint256 tokenAmount) public {
    _burn(msg.sender, tokenAmount);
}
```

### `transferTokens`

Transfers tokens from the caller's address to a specified recipient address.

```solidity
function transferTokens(address recipient, uint256 tokenAmount) public {
    transfer(recipient, tokenAmount);
}
```

## Usage

### Prerequisites

- **MetaMask**: Ensure you have MetaMask installed and configured.
- **Ethereum Testnet**: Deploy the contract on an Ethereum testnet like Ropsten or Rinkeby for testing purposes.

### Deployment

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-repo/healthcoin.git
    cd healthcoin
    ```

2. **Compile the Contract**: Use a Solidity compiler like Remix, Truffle, or Hardhat to compile the `HealthCoin.sol` contract.

3. **Deploy the Contract**: Deploy the contract to the Ethereum network. The deploying address will be set as the contract owner.

### Interacting with the Contract

1. **Minting Tokens**:
    - Only the contract owner can mint new tokens.
    - Call the `mintNewTokens` function with the recipient address and the amount of tokens to mint.

2. **Burning Tokens**:
    - Any token holder can burn their tokens.
    - Call the `burnTokens` function with the amount of tokens to burn.

3. **Transferring Tokens**:
    - Tokens can be transferred to any address.
    - Call the `transferTokens` function with the recipient address and the amount of tokens to transfer.

## Example

### Minting Tokens

```solidity
healthCoin.mintNewTokens("0xRecipientAddress", 50 * 10**10);
```

### Burning Tokens

```solidity
healthCoin.burnTokens(10 * 10**10);
```

### Transferring Tokens

```solidity
healthCoin.transferTokens("0xRecipientAddress", 20 * 10**10);
```

## License

This project is licensed under the MIT License.
