// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// import "https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol";
contract Bank {
    address public bankOwner;
    string public bankName;
    mapping(address => uint256) public customerBalance;
    string public empty = "";
    constructor() {
        bankOwner = msg.sender;
    }

    function depositMoney() public payable {
        require(msg.value != 0, "You need to deposit some amount of money!");
        customerBalance[msg.sender] += msg.value;
    }

    function setBankName(string memory _name) external {
        // require(_name != ,"Name cannot be empty");
        require(keccak256(bytes(_name)) != keccak256(bytes(empty)),"Name cannot be an empty string");
        require(
            msg.sender == bankOwner,
            "You must be the owner to set the name of the bank"
        );
        //check !_name="" 
        bankName = _name;
    }

    function withdrawMoney(address payable _to, uint256 _total) public {
        require(
            _total <= customerBalance[msg.sender],
            "You have insuffient funds to withdraw"
        );

        customerBalance[msg.sender] -= _total;
        _to.transfer(_total);
    }

    function getCustomerBalance(address _customer) external view returns (uint256) { //check given customer balance
        require(_customer == msg.sender,"You dont have permpermission to this account");
        return customerBalance[_customer];
    }

    function getBankBalance() public view returns (uint256) { 
        require(
            msg.sender == bankOwner,
            "You must be the owner of the bank to see all balances."
        );
        return address(this).balance;
    }
}
