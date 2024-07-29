// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ComplicatedBank {
    mapping (address => uint256) balances;
    address[] accounts;
    uint rate = 3;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Only owner can do this");
        _;
    }

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

    //     function withdraw2 () public payable {
    //     // require(balances[msg.sender] >= money, "Insufficient funds");
    //     // payable(msg.sender).transfer(money);
    //     // balances[msg.sender] -= money;

    //     // require(balances[msg.sender] - msg.value < 0, "Insufficient funds");
    //     balances[msg.sender] -= msg.value;
    //     // (bool success, ) = msg.sender.call{value: msg.value}("");
    //     //msg.sender.call{value: money}("");
    //     // require(success, "withdraw failed!!");
    // }

    function getSystemBalance() public onlyOwner view returns (uint256) {
        //require(msg.sender == owner, "Only owner can do this");
        return address(this).balance;
    }

    // function calculateInterest (uint256 _calculateInterest , address _address) public view returns (uint256)  {
    //     _calculateInterest = balances[_address] * rate / 100 ;
    //     return address(this).balance;
    // }

    // function calculateInterest(address _address) public view returns (uint256) {
    //     uint256 interest = balances[_address] * rate / 100;
    //     return interest;
    // }

    // New function to calculate interest
    // function calculateInterest(address account) public view returns (uint256) {
    //     uint256 principal = balances[account];
    //     uint256 interest = (principal * rate) / 100;
    //     return interest;
    // }

    // Updated function to calculate interest for the caller
    // function calculateInterest() public view returns (uint256) {
    //     uint256 principal = balances[msg.sender];
    //     uint256 interest = (principal * rate) / 100;
    //     return interest;
    // }

    function calculateInterest(address _address) public onlyOwner view returns (uint256) {
        uint256 interest = balances[_address] * rate/100;
        return interest;
    }
}