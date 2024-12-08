// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "solmate/tokens/ERC20.sol";

contract Token is ERC20 {
    constructor (
        string memory name,
        string memory symbol,
        uint8 decimals
    ) ERC20(name, symbol, decimals) {} 

    function mintToken(address to, uint256 amount) public payable {
        _mint(to, amount);
    }  
}

