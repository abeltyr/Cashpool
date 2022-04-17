

// SPDX-License-Identifier: MIT
 

pragma solidity ^0.8.13;


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

 
  function createRandom(uint256 number) public view returns(uint256){
      return uint256(keccak256(abi.encodePacked(block.timestamp,block.difficulty, msg.sender))) % number;
  }

  function setWinner() public onlyOwner returns (bool) {
    require(endDate <= block.timestamp, "ERC721A: Date has not passed");
    
    require(!winners[2].isEntriy || address(0) == winners[2]._address, "ERC721A: 1rd place  Already selected"); 
    require(!winners[1].isEntriy || address(0) == winners[1]._address, "ERC721A: 2rd place  Already selected"); 
    require(!winners[0].isEntriy || address(0) == winners[0]._address, "ERC721A: 3rd place  Already selected"); 
    
    uint256 random1 = createRandom(50);
    uint256 random2 = createRandom(50);
    while(random1 == random2){
        random2 = createRandom(50);
        if(random1 != random2) break;
    }

    uint256 random3 = createRandom(50);
    while(random1 == random3 || random2 == random3){
        random3 = createRandom(50);
        if(random1 != random3 && random2 != random3) break;
    }

    winners[2].winnerPostion = random1;
    winners[1].winnerPostion = random2;
    winners[0].winnerPostion = random3;
    return true;
  }


  function firstPlaceWinner() public onlyOwner returns (bool) {
    require(endDate <= block.timestamp, "ERC721A: Date has not passed");
    require(!winners[2].isEntriy || address(0) == winners[2]._address, "ERC721A: 1rd place  Already selected"); 
    uint256 random = createRandom(50);
    if(winners[0].winnerPostion == random || winners[1].winnerPostion == random) return false;
    winners[2].winnerPostion = random;
    return true;
  }


  function secondPlaceWinner() public onlyOwner returns (bool) {
    require(endDate <= block.timestamp, "ERC721A: Date has not passed");
    require(!winners[1].isEntriy || address(0) == winners[1]._address, "ERC721A: 2rd place  Already selected"); 
    
    uint256 random = createRandom(50);
    if(winners[0].winnerPostion == random || winners[2].winnerPostion == random) return false;
    winners[1].winnerPostion = random;
    return true;
  }



  function thirdPlaceWinner() public onlyOwner returns (bool) {
    require(endDate <= block.timestamp, "ERC721A: Date has not passed");
    require(!winners[0].isEntriy || address(0) == winners[0]._address, "ERC721A: 3rd place  Already selected"); 
    
    uint256 random = createRandom(50);
    if(winners[1].winnerPostion == random || winners[2].winnerPostion == random) return false;
    winners[0].winnerPostion = random;
    return true;
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
