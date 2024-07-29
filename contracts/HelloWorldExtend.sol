// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "./HelloWorld.sol";

// contract HelloWorldExtend is HelloWorld {

//     function setMessage2(string memory newMessage) public {
//         setMessage(string(abi.encodePacked(newMessage, "_1")));
//     }
// }


contract HelloWorldExtend2 is HelloWorld {

    function setMessage2(string memory _message) public {
        setMessage(string.concat(_message, "_1"));
    }
}