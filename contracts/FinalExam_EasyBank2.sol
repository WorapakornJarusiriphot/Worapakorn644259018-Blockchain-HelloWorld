// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EasyBank {
    mapping (address => uint256) public balances;

    function getBalances() public view returns (uint256) {
        return balances[msg.sender];
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] > 0, "Insufficient funds");
        balances[msg.sender] -= amount;
        (bool success, ) = (msg.sender).call{value: amount}("");
        require(success, "Withdrawal failed");
    }
}
