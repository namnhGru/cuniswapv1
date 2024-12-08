// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;
import "solmate/tokens/ERC20.sol";

contract Exchange {
    ERC20 public token;

    constructor (ERC20 _token) {
        token = _token;
    }

    event CheckBalance(uint256 balances);
    function addLiquidity(address from, uint256 _tokenAmount) public payable {
        token.transferFrom(from, address(this), _tokenAmount);
        emit CheckBalance(address(this).balance);
        emit CheckBalance(from.balance);
    }

    // function getReserve() public view returns (uint256) {
    //     return token.balanceOf(address(this));
    // }
}
