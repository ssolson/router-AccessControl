//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InitializableStorage {
    bytes32 private constant _SLOT_INITIALIZABLE_STORAGE =
        keccak256(abi.encode("io.synthetix.sample-project.Initializable"));       

    struct RoleData {
        mapping(address => bool) members;
        bytes32 adminRole;
    }

    struct InitializableStore {
        bool initialized;

        // ROLE Storage
        bytes32 DEFAULT_ADMIN_ROLE;
        mapping(bytes32 => RoleData) _roles;
    }

    function _initializableStore() internal pure returns (InitializableStore storage store) {
        bytes32 s = _SLOT_INITIALIZABLE_STORAGE;
        assembly {
            store.slot := s
        }
    }

}
