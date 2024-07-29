// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC1155/ERC1155.sol";

contract WOJA_Hero is ERC1155 {
    constructor() ERC1155("https://raw.githubusercontent.com/WorapakornJarusiriphot/My_NFT_Workshop/main/WOJA_Hero.json")     
    {
        _mint(msg.sender, 1, 10, "");
    }
}