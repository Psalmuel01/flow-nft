# NFT Metadata

# CryptoPoops Smart Contract

## Overview

The `CryptoPoops` smart contract is an implementation of a non-fungible token (NFT) on the Flow blockchain. It extends the `NonFungibleToken` contract and introduces additional functionality for managing collections of unique tokens.

## Table of Contents

- [Features](#features)
- [Smart Contract Structure](#smart-contract-structure)
- [Public Functions](#public-functions)
- [Usage](#usage)
- [Installation](#installation)
- [License](#license)

## Features

- **Non-Fungible Tokens (NFTs):** Supports the creation, transfer, and management of unique tokens.
- **Collections:** Allows users to organize and manage collections of NFTs.
- **Public Accessibility:** Provides functions for public access to NFT metadata.

## Smart Contract Structure

The `CryptoPoops` contract structure includes NFTs, Collections, a Minter resource, and relevant initialization logic.

## Public Functions

### `getNFTMetadataByID(id: UInt64): CryptoPoops.NFT`

This function allows anyone to retrieve the metadata of a CryptoPoops NFT based on its ID.

### Other Public Functions

- **Additional public functions can be documented here.**

## Usage

To use the CryptoPoops smart contract, follow the deployment and interaction steps outlined in the [Installation](#installation) section.

## Installation

1. **Deploy the Contract:**

   - Deploy the CryptoPoops smart contract on the Flow blockchain.

2. **Initialize Collections:**

   - Initialize collections and mint NFTs using the provided functions.

3. **Interact with Public Functions:**
   - Users can interact with the `getNFTMetadataByID` function to retrieve NFT metadata.

## License

This project is licensed under the MIT License
