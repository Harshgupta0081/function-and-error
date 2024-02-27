 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.23;

contract TokenExchange {
    address public admin;
    mapping(address => uint256) public userBalances;

    constructor() {
        admin = msg.sender;
    }

    function depositTokens(uint256 amount) external {
        if(msg.sender == admin){
            revert("Admin cannot deposit tokens");
        }

        userBalances[msg.sender] += amount;
    }

    function withdrawTokens(uint256 amount) external {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");

        userBalances[msg.sender] -= amount;
    }

    function withdrawcontractbalance( uint256 amount) external {
    
        assert(msg.sender == admin);

        require(userBalances[address(this)] >= amount, "Insufficient balance");
        
        userBalances[address(this)] -= amount;
        userBalances[msg.sender] += amount;
    }
}
