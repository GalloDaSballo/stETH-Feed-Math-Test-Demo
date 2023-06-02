// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract FakeFeed {
    /// Real price
    uint256 price;
    int256 multiplier;
    uint256 constant MAX_BPS = 10_000;

    constructor(uint256 initialPrice) {
        price = initialPrice;
    }

    // Return Price here
    // Return value from ordinary operations
    function getPrice() external view returns (uint256) {
        int256 change = int256(price) * multiplier / int256(MAX_BPS);
        require(change < 0 ? -change < int256(price) : change < int256(price), "Abs");
        int256 editedPrice = int256(price) + change;

        return uint256(editedPrice);
    }

    // Enact Depeg by %
    function setMultiplier(int256 newMultiplier) external {
        require(newMultiplier < int256(MAX_BPS));
        require(newMultiplier > -int256(MAX_BPS));
        multiplier = newMultiplier;
    }
}
