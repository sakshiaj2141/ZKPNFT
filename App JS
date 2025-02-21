const contractAddress = "0x78eC469a36A2fD2d4833211aBe023615439dA92F";
const contractABI = [
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "user",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "Minted",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "mintNFT",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "verifyUser",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "isVerified",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "ownerOf",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "tokenOwnership",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "totalSupply",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

let provider, signer, contract, account;

// Three.js Setup
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({ canvas: document.getElementById("threejs-canvas"), alpha: true });
renderer.setSize(window.innerWidth, window.innerHeight);
camera.position.z = 5;

const geometry = new THREE.TorusKnotGeometry(1, 0.3, 100, 16);
const material = new THREE.MeshBasicMaterial({ color: 0x34D399, wireframe: true });
const nft3D = new THREE.Mesh(geometry, material);
scene.add(nft3D);

function animate() {
    requestAnimationFrame(animate);
    nft3D.rotation.x += 0.01;
    nft3D.rotation.y += 0.01;
    renderer.render(scene, camera);
}
animate();

// Contract Interaction
async function init() {
    document.getElementById("connectWallet").onclick = connectWallet;
    document.getElementById("verifyBtn").onclick = verifyUser;
    document.getElementById("mintBtn").onclick = mintNFT;
    startSlideshow();
}

async function connectWallet() {
    if (window.ethereum) {
        provider = new ethers.providers.Web3Provider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        signer = provider.getSigner();
        account = await signer.getAddress();
        contract = new ethers.Contract(contractAddress, contractABI, signer);
        document.getElementById("walletAddress").innerText = Wallet: ${account.slice(0, 6)}...${account.slice(-4)};
        updateStatus();
    } else {
        alert("Install MetaMask!");
    }
}

async function updateStatus() {
    if (!contract) return;
    const isVerified = await contract.isVerified(account);
    const tokenId = await contract.tokenOwnership(account);
    document.getElementById("status").innerText = `${isVerified ? "Verified" : "Not Verified"} | NFT: ${tokenId > 0 ? ID ${tokenId} : "None"}`;
}

async function verifyUser() {
    try {
        const tx = await contract.verifyUser();
        await tx.wait();
        alert("Verified! ZKP Power Unleashed!");
        updateStatus();
    } catch (e) {
        alert("Error: " + e.message);
    }
}

async function mintNFT() {
    try {
        const tx = await contract.mintNFT();
        await tx.wait();
        alert("NFT Minted! Welcome to the Elite!");
        updateStatus();
        updateSlideshow();
    } catch (e) {
        alert("Error: " + e.message);
    }
}

// Slideshow
async function startSlideshow() {
    const slideshow = document.getElementById("nftSlideshow");
    setInterval(async () => {
        if (!contract) return;
        const total = await contract.totalSupply();
        slideshow.innerHTML = "";
        for (let i = 1; i <= total; i++) {
            const slide = document.createElement("div");
            slide.className = "slide p-2";
            slide.innerText = NFT #${i};
            slide.style.transform = translateX(-${(i-1)*100}%);
            slideshow.appendChild(slide);
        }
    }, 3000);
}

window.onload = init;
window.onresize = () => renderer.setSize(window.innerWidth, window.innerHeight);
document.addEventListener("DOMContentLoaded", async function() {
    const statusText = document.getElementById("status");
    const connectButton = document.getElementById("connectButton");

    // Check if MetaMask is installed
    if (typeof window.ethereum !== "undefined") {
        statusText.textContent = "MetaMask Detected, Not Connected";

        connectButton.addEventListener("click", async () => {
            try {
                // Request access to MetaMask accounts
                const accounts = await ethereum.request({ method: "eth_requestAccounts" });
                
                if (accounts.length > 0) {
                    statusText.textContent = Connected: ${accounts[0]};
                } else {
                    statusText.textContent = "Not Connected";
                }
            } catch (error) {
                console.error(error);
                statusText.textContent = "Connection Failed!";
            }
        });

        // Detect account changes
        ethereum.on("accountsChanged", (accounts) => {
            if (accounts.length > 0) {
                statusText.textContent = Connected: ${accounts[0]};
            } else {
                statusText.textContent = "Not Connected";
            }
        });

        // Detect network changes
        ethereum.on("chainChanged", () => {
            window.location.reload(); // Refresh the page on network change
        });
    } else {
        statusText.textContent = "MetaMask Not Installed";
    }
});
document.addEventListener("DOMContentLoaded", async function() {
    const statusText = document.getElementById("status");
    const connectButton = document.getElementById("connectButton");
    const walletAddress = document.getElementById("walletAddress");

    // Check if MetaMask is installed
    if (typeof window.ethereum !== "undefined") {
        statusText.textContent = "MetaMask Detected, Not Connected";

        connectButton.addEventListener("click", async () => {
            try {
                // Request wallet connection
                const accounts = await ethereum.request({ method: "eth_requestAccounts" });
                
                if (accounts.length > 0) {
                    statusText.textContent = "Connected ✅";
                    walletAddress.textContent = Wallet Address: ${accounts[0]};
                } else {
                    statusText.textContent = "Not Connected ❌";
                    walletAddress.textContent = "";
                }
            } catch (error) {
                console.error(error);
                statusText.textContent = "Connection Failed! ❌";
            }
        });

        // Detect account changes
        ethereum.on("accountsChanged", (accounts) => {
            if (accounts.length > 0) {
                walletAddress.textContent = Wallet Address: ${accounts[0]};
                statusText.textContent = "Connected ✅";
            } else {
                walletAddress.textContent = "";
                statusText.textContent = "Not Connected ❌";
            }
        });

        // Detect network changes
        ethereum.on("chainChanged", () => {
            window.location.reload(); // Refresh the page on network change
        });
    } else {
        statusText.textContent = "MetaMask Not Installed";
        connectButton.disabled = true; // Disable button if MetaMask is not installed
    }
});
document.addEventListener("DOMContentLoaded", function () {
    // NFT Slideshow Data
    const nftImages = ["nft1.jpg", "nft2.jpg", "nft3.jpg"];
    const nftDescriptions = [
        "NFT 1 - Rare Artwork",
        "NFT 2 - Digital Collectible",
        "NFT 3 - Exclusive NFT"
    ];

    let currentIndex = 0;
    const nftImage = document.getElementById("nftImage");
    const nftDescription = document.getElementById("nftDescription");

    function changeNFT() {
        currentIndex = (currentIndex + 1) % nftImages.length;
        nftImage.src = nftImages[currentIndex];
        nftDescription.textContent = nftDescriptions[currentIndex];
    }

    // Change NFT every 3 seconds
    setInterval(changeNFT, 3000);

    // Button Event Listeners
    document.getElementById("addMetadata").addEventListener("click", function () {
        alert("Add Metadata Functionality Coming Soon!");
    });

    document.getElementById("verifyUser").addEventListener("click", function () {
        alert("User Verification Feature in Progress!");
    });

    document.getElementById("myNFTs").addEventListener("click", function () {
        alert("Fetching Your NFTs...");
    });

    document.getElementById("transferNFT").addEventListener("click", function () {
        alert("NFT Transfer Feature Coming Soon!");
    });

    document.getElementById("tradeNFT").addEventListener("click", function () {
        alert("NFT Trading Platform Under Development!");
    });
});
