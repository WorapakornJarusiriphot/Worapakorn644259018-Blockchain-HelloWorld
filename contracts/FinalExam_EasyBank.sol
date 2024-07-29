// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EasyBank {
    mapping (address => uint256) public balance;

    function deposet() public view returns (uint256) {
        return balance[msg.sender];
    }
    function depoint () public payable {
        balance[msg.sender] += msg.value;
    }

    function wither (uint256 money) public {
        require(balance[msg.sender] >= money, "No Money");
        balance[msg.sender] -= money;
        (bool success, ) = _______.call{value: money}("");
        require(success, "Error");
    }
}
