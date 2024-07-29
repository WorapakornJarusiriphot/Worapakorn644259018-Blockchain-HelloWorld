// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WOJAToken is ERC20 {
    uint public exChangeRateForOneEther = 10; // คำถามที่ 1: อัตราแลกเปลี่ยนสำหรับ 1 Ether ในการซื้อโทเคนคือเท่าไหร่?

    constructor() ERC20("WOJAToken", "WOJA")  {    
        _mint(address(this), WOJAToken * 10 ** decimals()); // คำถามที่ 2: เติมใครควรได้รับโทเคนเมื่อสัญญาถูกสร้าง และจำนวนโทเคนที่พวกเขาควรได้รับคือเท่าไหร่?
    }

    function buy() payable public {
        uint tokenReceived = msg.value * exChangeRateForOneEther; // คำถามที่ 3: คำนวณจำนวนโทเคนที่ควรได้รับเมื่อซื้อด้วย ether.
        _transfer(address(this), msg.sender, exChangeRateForOneEther); // คำถามที่ 4: ใครควรจะเป็นผู้ส่ง, ผู้รับ และจำนวนโทเคนที่ควรโอนคือเท่าไหร่?
    }
}
