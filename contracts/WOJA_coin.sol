// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WOJAToken is ERC20 {

    uint exChangeRateForOneEther = 10;

    //event Buy(address indexed from, address indexed to , uint tokens)

    constructor() ERC20("WOJAToken", "WOJA")  {    
        _mint(address(this), 50000000 * 10 ** decimals());
    }

    function buy() payable public{
        uint tokenReceived = msg.value * exChangeRateForOneEther;
        _transfer(address(this), msg.sender , tokenReceived);
    }
}
