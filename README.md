# ZKP NFT

A **Zero-Knowledge Proof (ZKP)-based NFT** is a non-fungible token (NFT) that utilizes zero-knowledge proofs to verify users' eligibility without revealing their private data. Zero-knowledge proofs allow one party (the prover) to demonstrate knowledge of a value to another party (the verifier) without disclosing the actual information. This enhances security and privacy while ensuring access is restricted to verified individuals.

## Features of ZKP NFT
- **Privacy-Preserving:** Users can verify eligibility without exposing personal data.
- **Replay Attack Prevention:** Each proof is used only once to prevent fraudulent reuse.
- **Secure Minting:** Only verified users can mint NFTs using valid cryptographic proofs.
- **Identity-Based Access:** Ensures NFTs are assigned to pre-verified individuals only.
- **Efficient and Transparent:** Uses smart contract logic to authenticate zero-knowledge proofs on-chain.
- **Decentralized and Trustless:** Eliminates the need for third-party verification.

## Deployed Contract
- **Network:** EduChain
- **Contract Address:** `0x7E502AA4a3d10fE377f09efF7224ceC96Faf62db`

## How It Works
1. **Proof Submission:** Users generate and submit a zero-knowledge proof.
2. **Validation:** The contract verifies the proof against stored valid hashes.
3. **Minting Process:** If the proof is valid, an NFT is minted and assigned to the user.
4. **One-Time Use:** The proof is invalidated after use, preventing replay attacks.
5. **Ownership Tracking:** The contract maintains an ownership record of minted NFTs.
6. **Balance Check:** Users can check their NFT holdings using balance queries.

## Usage
- **Register a Proof:** `setValidProof(bytes32 proof)` - Admin sets a valid proof.
- **Mint an NFT:** `mint(bytes32 proof)` - Users provide a valid proof to mint an NFT.
- **Check Ownership:** `ownerOf(uint256 tokenId)` - Retrieves the owner of a specific NFT.
- **View Balance:** `balanceOf(address owner)` - Displays the number of NFTs owned by an address.

## Advantages of ZKP in NFTs
- **Enhanced Security:** Eliminates the risk of unauthorized access or forgery.
- **User Anonymity:** Users remain anonymous while proving eligibility.
- **Reduced Fraud:** Prevents reuse of proofs and unauthorized minting.
- **Scalability:** Can be integrated into large-scale identity verification systems.

## Potential Use Cases
- **Exclusive Memberships:** Only verified members can access NFT-based communities.
- **Digital Certificates:** Securely issue and verify educational or professional credentials.
- **Access Control:** Restrict access to certain services based on NFT ownership.
- **Gaming and Metaverse:** Enable anonymous yet verified in-game asset ownership.

## License
This project is open-source and available under the MIT License
