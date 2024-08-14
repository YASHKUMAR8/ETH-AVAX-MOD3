# TokenContract

## Overview

The `TokenContract` is a simple ERC20-like token contract implemented in Solidity. This smart contract provides basic functionalities of an ERC20 token along with some additional features, such as approval mechanisms, allowance checking, and the ability to update token metadata.

## Features

- **Token Attributes**: The token has customizable `firstName`, `lastName`, and `supply`.
- **Minting**: The contract owner can mint new tokens, increasing the total supply.
- **Burning**: The contract owner can burn tokens, decreasing the total supply.
- **Transfers**: Users can transfer tokens to others.
- **Approvals and Allowances**: Users can approve third-party accounts to spend tokens on their behalf.
- **Metadata Update**: The contract owner can update the token's metadata (`firstName` and `lastName`).
- **Events**: The contract emits events for transfers, approvals, minting, burning, and metadata updates.

## Contract Details

- **Solidity Version**: `^0.8.9`
- **License**: MIT

## Functions

### `constructor()`
- Initializes the contract, setting the contract owner to the address that deploys the contract.

### `mint(address recipient, uint amount)`
- Mints new tokens and assigns them to the specified `recipient` address.
- Increases the total token supply.
- Can only be called by the contract owner.

### `burn(address account, uint amount)`
- Burns tokens from the specified `account` address.
- Decreases the total token supply.
- Can only be called by the contract owner.

### `transfer(address recipient, uint256 amount)`
- Transfers `amount` of tokens from the sender's address to the `recipient` address.

### `approve(address spender, uint256 amount)`
- Approves the `spender` address to spend up to `amount` of tokens on behalf of the sender.

### `allowance(address owner, address spender) view`
- Returns the remaining number of tokens that `spender` is allowed to spend on behalf of `owner`.

### `transferFrom(address sender, address recipient, uint256 amount)`
- Transfers `amount` of tokens from `sender` to `recipient` using the allowance mechanism.

### `balanceOf(address account) view`
- Returns the token balance of the specified `account`.

### `updateTokenMetadata(string memory newFirstName, string memory newLastName)`
- Updates the token's `firstName` and `lastName`.
- Can only be called by the contract owner.

## Events

- **Transfer**: Emitted when tokens are transferred from one address to another.
- **Approval**: Emitted when an address approves another address to spend tokens on its behalf.
- **Mint**: Emitted when new tokens are minted.
- **Burn**: Emitted when tokens are burned.
- **TokenMetadataUpdated**: Emitted when the token's metadata is updated.

## Usage

1. **Deploy the Contract**: Deploy the `TokenContract` using a Solidity-compatible environment such as Remix or Truffle.

2. **Mint Tokens**: As the contract owner, you can mint new tokens by calling `mint(recipient, amount)`.

3. **Transfer Tokens**: Users can transfer tokens using `transfer(recipient, amount)`.

4. **Approve and Allowance**: Users can approve third-party addresses to spend tokens on their behalf using `approve(spender, amount)`. The allowance can be checked using `allowance(owner, spender)`.

5. **Burn Tokens**: As the contract owner, you can burn tokens by calling `burn(account, amount)`.

6. **Update Metadata**: The contract owner can update the token's metadata using `updateTokenMetadata(newFirstName, newLastName)`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
