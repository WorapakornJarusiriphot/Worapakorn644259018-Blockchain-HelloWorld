// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ComplicatedBank {
    mapping (address => uint256) public balances;
    address[] public accounts;
    uint public rate = 3; // คำถามที่ 1: อัตราดอกเบี้ยเริ่มต้นของสัญญาคืออะไร?
    address public owner;

    constructor() {
        owner = msg.sender; // คำถามที่ 2: ใครจะถูกกำหนดเป็นเจ้าของของสัญญาเมื่อถูกสร้าง?
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can do this"); // คำถามที่ 3: เติมเงื่อนไขการตรวจสอบเจ้าของ
        _;
    }

    function getBalances() public view returns (uint256) {
        return balances[msg.sender]; // คำถามที่ 4: ช่องว่างนี้ควรเติมอะไรเพื่อคืนค่ายอดเงินของผู้เรียก?
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value; // คำถามที่ 5: อัปเดตยอดเงินของผู้ฝากด้วยค่าใด?
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds"); // คำถามที่ 6: เติมช่องว่างเพื่อตรวจสอบว่ามียอดเงินเพียงพอก่อนถอนหรือไม่
        balances[msg.sender] -= amount; // คำถามที่ 7: อัปเดตยอดเงินหลังจากการถอน
        (bool success, ) = msg.sender.call{value: amount}(""); // คำถามที่ 8: เติมช่องว่างเพื่อส่ง Ether กลับไปยังผู้เรียก
        require(success, "Withdrawal failed");
    }

    function getSystemBalance() public onlyOwner view returns (uint256) {
        return address(this).balance; // คำถามที่ 9: คุณสมบัติของสัญญาใดที่ควรถูกคืนค่า?
    }

    function calculateInterest(address _address) public onlyOwner view returns (uint256) {
        uint256 interest = balances[_address] * rate / 100; // คำถามที่ 10: ดอกเบี้ยคำนวณอย่างไร?
        return interest;
    }
}