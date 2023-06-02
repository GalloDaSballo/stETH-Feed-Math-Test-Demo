// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";

import {FakeFeed} from "../src/FakeFeed.sol";
import {SampleReader} from "../src/SampleReader.sol";

contract ReadTest is Test {
    SampleReader reader;
    FakeFeed STETH_ETH_FEED;
    FakeFeed ETH_BTC_FEED;

    function setUp() public {
        reader = new SampleReader();
        // TODO: GET CL LATEST
        // https://etherscan.io/address/0x86392dc19c0b719886221c78ab11eb8cf5c52812#readContract
        STETH_ETH_FEED = new FakeFeed(999353858723467550);

        // https://etherscan.io/address/0xac559f25b1619171cbc396a50854a3240b6a4e99#readContract
        ETH_BTC_FEED = new FakeFeed(6975000);
    }

    // TEST 1
    // NORMAL
    function test_normalBehaviour() public {
        uint256 price_old = reader.oldFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());
        uint256 price_new = reader.newFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());

        console2.log("price_old", price_old);
        console2.log("price_new", price_new);
    }

    // TEST 2
    // UPWARDE DEPG STETH
    function test_upwardDepeg() public {
        // 10% upward
        STETH_ETH_FEED.setMultiplier(1000);

        uint256 price_old = reader.oldFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());
        uint256 price_new = reader.newFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());

        console2.log("price_old", price_old);
        console2.log("price_new", price_new);
    }

    // TEST 3
    // DOWNWARD DEPEG STETH
    function test_downwardDepeg() public {
        // 10% upward
        STETH_ETH_FEED.setMultiplier(-1000);

        uint256 price_old = reader.oldFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());
        uint256 price_new = reader.newFormula(ETH_BTC_FEED.getPrice(), STETH_ETH_FEED.getPrice());

        console2.log("price_old", price_old);
        console2.log("price_new", price_new);
    }
}
