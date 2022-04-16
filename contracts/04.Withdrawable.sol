
// SPDX-License-Identifier: MIT
 

pragma solidity ^0.8.13;


import "./libraries/12.Ownable.sol";
import "./01.ERC721A.sol";
import "./02.AknetAble.sol";
import "./03.IERC20.sol";


abstract contract Withdrawable is Ownable, AknetAble,ERC721A {
  address[] public payableAddresses;
  uint256[] public payableFees = [35,30,20,15];
  uint256 public payableAddressCount = 4;

  function withdrawAll() public onlyOwner {
      require(address(this).balance > 0);
      require(winners[2].isEntriy && address(0) != winners[2]._address, "Withdrawable: No Winner Yet");
      require(winners[1].isEntriy && address(0) != winners[1]._address, "Withdrawable: No Winner Yet");
      require(winners[0].isEntriy && address(0) != winners[0]._address, "Withdrawable: No Winner Yet");

      _withdrawAll();
  }
  
  function withdrawByWinner() public {
      require(address(this).balance > 0);
      require(winners[2].isEntriy && address(0) != winners[2]._address, "Withdrawable: No Winner Yet");
      require(winners[1].isEntriy && address(0) != winners[1]._address, "Withdrawable: No Winner Yet");
      require(winners[0].isEntriy && address(0) != winners[0]._address, "Withdrawable: No Winner Yet");

    bool winnerData = (_msgSender() == winners[0]._address || _msgSender() == winners[1]._address || _msgSender() == winners[2]._address);
      require(winnerData, "Withdrawable: Only Winners can intiate Withdraw");
      _withdrawAll();
  }

  function _withdrawAll() private {
      uint256 balance = address(this).balance;
      payableAddresses[0] =  AKNETADDRESS;
      payableAddresses[1] =  winners[2]._address;
      payableAddresses[2] =  winners[1]._address;
      payableAddresses[3] =  winners[1]._address;
      for(uint i=0; i < payableAddressCount; i++ ) {
          _widthdraw(
              payableAddresses[i],
              (balance * payableFees[i]) / 100
          );
      }
  }
  
  function _widthdraw(address _address, uint256 _amount) private {
      (bool success, ) = _address.call{value: _amount}("");
      require(success, "Transfer failed.");
  }

  /**
    * @dev Allow contract owner to withdraw ERC-20 balance from contract
    * while still splitting royalty payments to all other team members.
    * in the event ERC-20 tokens are paid to the contract.
    * @param _tokenContract contract of ERC-20 token to withdraw
    * @param _amount balance to withdraw according to balanceOf of ERC-20 token
    */
  function withdrawAllERC20(address _tokenContract, uint256 _amount) public onlyOwner {
    require(_amount > 0);
    IERC20 tokenContract = IERC20(_tokenContract);
    require(tokenContract.balanceOf(address(this)) >= _amount, 'Contract does not own enough tokens');

    for(uint i=0; i < payableAddressCount; i++ ) {
        tokenContract.transfer(payableAddresses[i], (_amount * payableFees[i]) / 100);
    }
 }
}
