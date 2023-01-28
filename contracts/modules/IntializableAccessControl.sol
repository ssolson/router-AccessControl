//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/IInitializableModule.sol";
import "../utils/AccessControl.sol";


contract InitializableAccessControl is AccessControl, IInitializableModule {

    function _isInitialized() internal view override returns (bool) {
        return _initializableStore().initialized;
    }

    function isInitializableModuleInitialized() external view override returns (bool) {
        return _isInitialized();
    }

    function initializeInitializableModule() external override onlyIfNotInitialized {
        _initializableStore().initialized = true;

        // Access Control
        _initializableStore().DEFAULT_ADMIN_ROLE = 0x00;
        _setupRole(_initializableStore().DEFAULT_ADMIN_ROLE, msg.sender);
    }

}