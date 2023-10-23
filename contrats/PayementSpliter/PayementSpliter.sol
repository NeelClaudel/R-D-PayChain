// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSplitter {
    address[] public creators;
    mapping(address => uint256) public shares;
    uint256 public totalShares;

    constructor(address[] memory _creators, uint256[] memory _shares) {
        require(
            _creators.length == _shares.length,
            "Arrays must be of equal length"
        );

        for (uint i = 0; i < _creators.length; i++) {
            require(_creators[i] != address(0), "No zero address");
            require(_shares[i] > 0, "Shares must be positive");

            creators.push(_creators[i]);
            shares[_creators[i]] = _shares[i];
            totalShares += _shares[i];
        }
    }

    function splitPayment() external payable {
        uint256 amount = msg.value;

        for (uint i = 0; i < creators.length; i++) {
            uint256 creatorShare = (amount * shares[creators[i]]) / totalShares;
            payable(creators[i]).transfer(creatorShare);
        }
    }

    function checkContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
