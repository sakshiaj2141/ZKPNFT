# ZKP NFT

A **Zero-Knowledge Proof (ZKP)-based NFT** is a non-fungible token (NFT) that utilizes zero-knowledge proofs to verify users' eligibility without revealing their private data. This ensures enhanced privacy and security in NFT minting, making it ideal for identity-based token distribution, exclusive memberships, and private transactions.

## Features of ZKP NFT
- **Privacy-Preserving:** Users can verify ownership without revealing sensitive information.
- **Replay Attack Prevention:** Each proof is consumed upon use to prevent reusability.
- **Secure Minting:** Only verified users can mint NFTs using valid cryptographic proofs.
- **Identity-Based Access:** Ensures NFTs are granted only to pre-verified individuals.
- **Efficient and Transparent:** Uses smart contract logic to verify zero-knowledge proofs on-chain.

## Deployed Contract
- **Network:** EduChain
- **Contract Address:** `0x7E502AA4a3d10fE377f09efF7224ceC96Faf62db`

## Usage
1. Set a valid zero-knowledge proof using `setValidProof(bytes32 proof)`.
2. Mint an NFT by calling `mint(bytes32 proof)` with a valid proof.
3. Check ownership with `ownerOf(uint256 tokenId)`.
4. View balance using `balanceOf(address owner)`.

## License
This project is open-source and available under the MIT License.
