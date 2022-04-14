

// SPDX-License-Identifier: MIT
 

pragma solidity ^0.8.9;


import "./libraries/01.SafeMath.sol";
import "./libraries/10.ReentrancyGuard.sol";
import "./libraries/12.Ownable.sol";
import "./01.ERC721A.sol";
import "./04.Withdrawable.sol";
abstract contract AknetERC721A is 
    Ownable,
    ERC721A,
    Withdrawable,
    ReentrancyGuard  {
    constructor(
        string memory tokenName,
        string memory tokenSymbol
    ) ERC721A(tokenName, tokenSymbol, 10 ) {}
    using SafeMath for uint256;

    uint8 public CONTRACT_VERSION = 2;
    string public _baseTokenURI = "ipfs://QmbMfkUgQsxHQDVGL5WYZS7BzVJMZdgriPrSzntQriGpyq/";

    bool public mintingOpen = true;
    
    uint256 public mintingFee = 0.1 ether;
     
    
    /////////////// Admin Mint Functions
    /**
    * @dev Mints a token to an address with a tokenURI.
    * This is owner only and allows a fee-free drop
    * @param _to address of the future owner of the token
    */
    function mintToAdmin(address _to, uint256 tokenId) public onlyOwner {
        require(tokenId <= collectionSize, "Cannot mint over supply cap");
        _mint(_to, tokenId);
    }

    
    /////////////// GENERIC MINT FUNCTIONS
    /**
    * @dev Mints a single token to an address.
    * fee may or may not be required*
    * @param _to address of the future owner of the token
    */
    function buyTicket(address _to, uint256 tokenId) public payable {
        require(tokenId <= collectionSize, "Cannot mint over supply cap");
        require(mintingOpen == true, "Minting is not open right now!");
        
        require(msg.value >= mintingFee, "Value needs to be equal or higher the mint fee!");
        
        _mint(_to, tokenId);
        
    }

    function openMinting() public onlyOwner {
        mintingOpen = true;
    }

    function setWinners() public onlyOwner returns (bool){
        return _setWinner();
    }

    function stopMinting() public onlyOwner {
        mintingOpen = false;
    }

    function updateMintingFee(uint256 _feeInWei) public onlyOwner {
        mintingFee = _feeInWei;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function baseTokenURI() public view returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string calldata baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    function getOwnershipData(uint256 tokenId) external view returns (TokenOwnership memory) {
        return ownershipOf(tokenId);
    }
}
