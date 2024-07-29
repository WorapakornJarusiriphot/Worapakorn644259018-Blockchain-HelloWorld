// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

contract HelloWorld {
    string public message;

    constructor () {
        message = "Hello World";
    }

    function setMessage(string memory _message) public virtual {
        message = _message;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}