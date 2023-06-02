// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleReader {
    // TODO: FIX
    uint256 _stEthEthDecimals = 18;
    uint256 _ethBtcDecimals = 8;

    uint256 constant DECIMAL_PRECISION = 1e18;

    // Read and apply the old and new formulas
    function oldFormula(uint256 _ethBtcAnswer, uint256 _stEthEthAnswer) external view returns (uint256) {
        return (
            ((10 ** (_stEthEthDecimals - _ethBtcDecimals)) * (uint256(_ethBtcAnswer) * DECIMAL_PRECISION))
                / uint256(_stEthEthAnswer)
        );
    }

    function newFormula(uint256 _ethBtcAnswer, uint256 _stEthEthAnswer) external view returns (uint256) {
        return (
            ((10 ** (_stEthEthDecimals - _ethBtcDecimals)) * (uint256(_ethBtcAnswer) * uint256(_stEthEthAnswer)))
                / DECIMAL_PRECISION
        );
    }
}
