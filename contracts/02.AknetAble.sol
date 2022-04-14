// SPDX-License-Identifier: MIT
 

pragma solidity ^0.8.9;

abstract contract AknetAble {
    address public AKNETADDRESS = 0x0E1b37113B68202FB8e3437Aa113dcf035afBDb1;

    modifier isAKNET() {
        require(msg.sender == AKNETADDRESS, "Ownable: caller is not AKNET");
        _;
    }
}
