// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ComplicatedBank {
    mapping (address => uint256) public balances;
    address[] public accounts;
    uint public rate = 3; // คำถามที่ 1: เติมอัตราดอกเบี้ยเริ่มต้นของสัญญา.
    address public owner;

    constructor() {
        owner = msg.sender; // คำถามที่ 2: เติมใครควรจะเป็นเจ้าของหลังจากการสร้างสัญญา.
    }

    modifier onlyOwner{
        require(owner == accounts, "Only owner can do this"); // คำถามที่ 3: กรอกเงื่อนไขการตรวจสอบเจ้าของ.
        _;
    }

    function getBalances() public view returns (uint256) {
        return balances[msg.sender]; // คำถามที่ 4: เติมช่องว่างเพื่อคืนค่ายอดเงินของผู้เรียก.
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value; // คำถามที่ 5: เติมช่องว่างเพื่ออัปเดตยอดเงินของผู้ฝากถูกต้อง.
    }

    function withdraw(uint256 money) public {
        require(balances[msg.sender] >= money, "Insufficient funds"); // คำถามที่ 6: ตรวจสอบให้แน่ใจว่าผู้เรียกมียอดเงินเพียงพอที่จะถอน.
        balances[msg.sender] -= money; // คำถามที่ 7: อัปเดตยอดเงินของผู้เรียกหลังการถอน.
        (bool success, ) = msg.sender.call{value: money}(""); // คำถามที่ 8: เติมช่องว่างเพื่อส่ง Ether กลับไปยังผู้เรียก.
        require(success, "Withdrawal failed");
    }

    function getSystemBalance() public onlyOwner view returns (uint256) {
        return address(this).balance; // คำถามที่ 9: กรอกคุณสมบัติของสัญญาที่จะถูกคืนค่าโดยฟังก์ชันนี้.
    }

    function calculateInterest(address _address) public onlyOwner view returns (uint256) {
        uint256 interest = balances[_address] * rate / 100; // คำถามที่ 10: เติมช่องว่างเพื่อคำนวณดอกเบี้ยอย่างถูกต้อง.
        return interest;
    }
}
