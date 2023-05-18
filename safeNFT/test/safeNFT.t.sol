// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.7;

import {Test} from "forge-std/Test.sol";
import "../src/safeNFT.sol";
import "../src/Attack.sol";

contract AttackTest is Test {
    Attack attack;
    SafeNFT safeNFT;

    address owner = makeAddr("owner");
    address attacker = makeAddr("attacker");

    function setUp() public {
        vm.deal(owner, 1000 ether);
        vm.startPrank(owner);

        safeNFT = new SafeNFT("SafeNFT", "sNFT", 0.01 ether);
    }

    function test_attack() public {
        vm.deal(attacker, 1 ether);
        changePrank(attacker);

        attack = new Attack{value: 0.01 ether}(address(safeNFT));
        bool isActive = safeNFT.canClaim(address(attack));
        assertEq(isActive, true);
        assertEq(0, safeNFT.totalSupply());
        attack.attack();
        assertEq(100, safeNFT.totalSupply());
    }
}
