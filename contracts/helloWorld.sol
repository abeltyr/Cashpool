// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    event UpdateMessages(string oldStr, string newStr);

    string public message;

    constructor (){
        message = "initMessage";
    }

    function update(string memory newMessage) public {
        string memory oldMsg = message;
        message = newMessage;
        emit UpdateMessages(oldMsg, message);
    }
}