// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol"; 
import {Exchange} from "src/contracts/Exchange.sol";
import {Token} from "src/contracts/Token.sol";

contract ExchangeTest is Test {
    Exchange public exchange;
    Token public token;
    uint256 tokenAmount = 100 ether;
    address user = address(1); //foundry không kiểm soát được msg.sender, vì vậy nên tạo 1 user độc lập để test gửi nhận bằng prank

    function setUp() public {
        token = new Token("Clone USDT","CUSD",18);
        exchange = new Exchange(token);     
    }

    function test_AddLiquidity() public {
        token.mintToken(user, 1000 ether);
        vm.startPrank(user);
        token.approve(address(exchange),1000 ether);
        exchange.addLiquidity(user, tokenAmount);
        vm.stopPrank();
        assertEq(token.balanceOf(address(exchange)), tokenAmount, "Token balance mismatch");
    }
}