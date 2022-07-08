// SPDX-License-Identifier: Unilicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max no. of addresses allowed
    uint8 public maxWhitelistAddresses;

    // create mapping of addresses
    // if address is whitelisted, true. false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    //track no.of addresses whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistAddresses = _maxWhitelistedAddresses;
    }

    // Add address of sender to whitelist
    function addAddressToWhitelist() public {
        //check if already whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        //check if no. whitelist adr < max whitelist adr, else error
        require(
            numAddressesWhitelisted < maxWhitelistAddresses,
            "Limit reached. No more addresses can be added"
        );
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        //increase no.of whitelist addresses
        numAddressesWhitelisted += 1;
    }
}
