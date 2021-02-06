(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["iparouting-iparouting-module"],{

/***/ "./src/app/iparouting/iparouting.module.ts":
/*!*************************************************!*\
  !*** ./src/app/iparouting/iparouting.module.ts ***!
  \*************************************************/
/*! exports provided: IparoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "IparoutingModule", function() { return IparoutingModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _ipa_organization_organization_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../ipa/organization/organization.component */ "./src/app/ipa/organization/organization.component.ts");
/* harmony import */ var _ipa_addorganization_addorganization_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../ipa/addorganization/addorganization.component */ "./src/app/ipa/addorganization/addorganization.component.ts");
/* harmony import */ var _ipa_changepassword_changepassword_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../ipa/changepassword/changepassword.component */ "./src/app/ipa/changepassword/changepassword.component.ts");







const route = [
    { path: 'organization', component: _ipa_organization_organization_component__WEBPACK_IMPORTED_MODULE_2__["OrganizationComponent"] },
    { path: 'addorganization', component: _ipa_addorganization_addorganization_component__WEBPACK_IMPORTED_MODULE_3__["AddorganizationComponent"] },
    { path: 'changepassword', component: _ipa_changepassword_changepassword_component__WEBPACK_IMPORTED_MODULE_4__["ChangepasswordComponent"] }
];
class IparoutingModule {
}
IparoutingModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: IparoutingModule });
IparoutingModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function IparoutingModule_Factory(t) { return new (t || IparoutingModule)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(route)]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](IparoutingModule, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](IparoutingModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [],
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(route)]
            }]
    }], null, null); })();


/***/ })

}]);
//# sourceMappingURL=iparouting-iparouting-module.js.map