# function-and-error

A  smart contract manages token deposits, withdrawals, and swaps. It uses require() for condition checks, assert() for invariants, and revert() implicitly in case of failures, demonstrating secure and controlled token operations.


This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The TokenExchange smart contract manages token deposits, withdrawals, and swaps. It uses require() for condition checks, assert() for invariants, and revert() implicitly in case of failures, demonstrating secure and controlled token operations.

Getting Started
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.,function_and_error). Copy and paste the following code into the file:

 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract TokenExchange {
    address public admin;
    mapping(address => uint256) public userBalances;

    constructor() {
        admin = msg.sender;
    }

    // Function to deposit tokens into the exchange
    function depositTokens(uint256 amount) external {
        if(msg.sender == admin){
            revert("Admin cannot deposit tokens");
        }

        // Increase the user's balance
        userBalances[msg.sender] += amount;
    }

    // Function to withdraw tokens from the exchange
    function withdrawTokens(uint256 amount) external {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");

        // Decrease the user's balance
        userBalances[msg.sender] -= amount;
    }

    // Function for admin to withdraw tokes
    function withdrawcontractbalance( uint256 amount) external {
        // Ensure the sender is the admin
        assert(msg.sender == admin);

        require(userBalances[address(this)] >= amount, "Insufficient balance");
        
        // If the swap is successful, deduct the amount from the contract balance
        userBalances[address(this)] -= amount;
        userBalances[msg.sender] += amount;
    }
}




To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile TokenExchange" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "TokenExchange" contract from the dropdown menu, and then click on the "Deploy" button. 

You will see what you deploy in your terminal 
