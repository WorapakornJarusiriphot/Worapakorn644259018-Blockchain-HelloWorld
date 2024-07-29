// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;//pragma solidity ^0.8.21;: ระบุเวอร์ชันของ Solidity compiler ที่ใช้.

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";: นำเข้า library ERC20 จาก OpenZeppelin.

contract WOJAToken is ERC20 { //contract WOJAToken is ERC20 { ... }: สร้าง contract ใหม่ชื่อ WOJAToken ที่สืบทอดจาก ERC20.

    uint exChangeRateForOneEther = 10; //uint exChangeRateForOneEther = 10;: กำหนดอัตราแลกเปลี่ยน token per ether.

    constructor() ERC20("WOJAToken", "WOJA")  {    //constructor() ERC20("WOJAToken", "WOJA") { ... }: constructor ที่กำหนดชื่อและ symbol ของ token และ mint tokens.
        _mint(address(this), 50000000 * 10 ** decimals()); //_mint(address(this), 50000000 * 10 ** decimals());: mint 50 ล้าน token ไปยัง contract address.
    }

    function buy() payable public{ //function buy() payable public{ ... }: ฟังก์ชันสำหรับซื้อ token ด้วย ether.
        uint tokenReceived = msg.value * exChangeRateForOneEther; //uint tokenReceived = msg.value * exChangeRateForOneEther;: คำนวณจำนวน token ที่จะได้รับ.
        _transfer(address(this), msg.sender , tokenReceived); //_transfer(address(this), msg.sender , tokenReceived);: transfer token จาก contract address ไปยังผู้ที่ส่ง ether.
    }
}
