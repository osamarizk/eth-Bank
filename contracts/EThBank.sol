// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract EthBank {

    address public bankOwner;
    mapping(address =>uint256) private Balance;

    constructor()  {
        bankOwner=msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == bankOwner , "its the job of the bank owner only");
        _;
    }

    function deposite() public payable returns (bool) {
        require(msg.value >= 10 wei , "the deposite value should not less than 10 Wei");
        Balance[msg.sender] += msg.value;
        return true;
    }

    function withdrawal(uint256 _amount) public payable returns (bool) {
        require ( Balance[msg.sender] >= _amount , "you don't have sufficient funds");
        Balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        return true;
        
    }

    function getBalance () public view returns(uint256) {
        return Balance[msg.sender];
    }

    function getBankBanlance () public view onlyOwner returns(uint256) {
        return address(this).balance;
    } 

}