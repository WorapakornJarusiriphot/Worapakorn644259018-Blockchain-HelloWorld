// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EasyBank {
    mapping (address => uint256) balances;

    function getBalances() public view returns (uint256) {
        return balances[msg.sender];
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw (uint256 money) public {
        // require(balances[msg.sender] >= money, "Insufficient funds");
        // payable(msg.sender).transfer(money);
        // balances[msg.sender] -= money;

        require(balances[msg.sender] >= money, "Insufficient funds");
        balances[msg.sender] -= money;
        (bool success, ) = msg.sender.call{value: money}("");
        //msg.sender.call{value: money}("");
        require(success, "withdraw failed!!");
    }
}