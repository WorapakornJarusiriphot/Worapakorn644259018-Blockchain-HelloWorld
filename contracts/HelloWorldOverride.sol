// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

// import "./HelloWorld.sol";

// contract HelloWorldOverride is HelloWorld {

//     function setMessage(string memory newMessage) public override {
//         super.setMessage(string(abi.encodePacked(newMessage, "_Override")));
//     }
// }


import "./HelloWorld.sol";

contract HelloWorldOverride is HelloWorld {

    function setMessage(string memory _message) public override {
        message = string.concat(_message, "_1_Override");
    }
}