// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MohitERC20 is ERC20 {
    // Constructor used to initialize  token with a name and symbol
    address public owner;
    modifier onlyOwner() 
    {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    constructor() ERC20("HealthCoin", "HLTH") 
    {
        owner = msg.sender;
        _mint(owner, 100 * 10**decimals());
    }
    
    // decimals function to set the number of decimal places to 10
    function decimals() public pure override returns (uint8) 
    {
        return 10;
    }
     // Function to mint new tokens and assign them to a specific address
    function mintTokens(address add, uint value) public onlyOwner
    {
        _mint(add, value);
    }
    // Function to burn (destroy) tokens from a specific address
    function burn(uint amount) public 
    {
        _burn(msg.sender , amount);
    }
    // function used add tranfer token to specific addresss
    function transferTokens(address to, uint amount) public 
    {
        transfer(to, amount);
    }
}
