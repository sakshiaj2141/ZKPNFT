pragma solidity ^0.8.0;

contract ZKPNFT {
    // NFT contract name and symbol
    string public name = "ZKP Verified NFT";
    string public symbol = "ZKPNFT";
    uint256 private tokenIdCounter;
    
    // Mapping to track ownership of tokens
    mapping(uint256 => address) private owners;
    mapping(address => uint256) private balances;
    
    // Mapping to store valid zero-knowledge proofs
    mapping(bytes32 => bool) private validProofs;

    // Event emitted when an NFT is transferred
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    // Function to store a valid ZKP hash for verification
    function setValidProof(bytes32 proof) public {
        validProofs[proof] = true;
    }

    // Function to mint a new NFT if a valid ZKP is provided
    function mint(bytes32 proof) public {
        require(validProofs[proof], "Invalid proof"); // Ensure proof is valid
        validProofs[proof] = false; // Prevent replay attack
        
        uint256 tokenId = ++tokenIdCounter; // Increment token ID counter
        owners[tokenId] = msg.sender; // Assign ownership
        balances[msg.sender] += 1; // Update balance
        
        emit Transfer(address(0), msg.sender, tokenId); // Emit transfer event
    }

    // Function to get the owner of a specific token
    function ownerOf(uint256 tokenId) public view returns (address) {
        require(owners[tokenId] != address(0), "Token does not exist"); // Ensure token exists
        return owners[tokenId];
    }

    // Function to check balance of a given address
    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0), "Invalid address"); // Ensure valid address
        return balances[owner];
    }
}
