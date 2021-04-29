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




const route = [
    { path: 'organization', loadChildren: () => Promise.all(/*! import() | LazyComponents-organization-module-organization-module-module */[__webpack_require__.e("default~LazyComponents-organization-module-organization-module-module~LazyComponents-organization-se~e6b2d4f0"), __webpack_require__.e("LazyComponents-organization-module-organization-module-module")]).then(__webpack_require__.bind(null, /*! ../LazyComponents/organization-module/organization-module.module */ "./src/app/LazyComponents/organization-module/organization-module.module.ts")).then(m => m.OrganizationModuleModule) },
    { path: 'addorganization', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-add-organization-add-organization-module */ "LazyComponents-add-organization-add-organization-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/add-organization/add-organization.module */ "./src/app/LazyComponents/add-organization/add-organization.module.ts")).then(m => m.AddOrganizationModule) },
    { path: 'changepassword', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-change-password-module-change-password-module-module */ "LazyComponents-change-password-module-change-password-module-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/change-password-module/change-password-module.module */ "./src/app/LazyComponents/change-password-module/change-password-module.module.ts")).then(m => m.ChangePasswordModuleModule) },
    { path: 'members', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-members-module-members-module-module */ "LazyComponents-members-module-members-module-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/members-module/members-module.module */ "./src/app/LazyComponents/members-module/members-module.module.ts")).then(m => m.MembersModuleModule) },
    { path: 'register', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-registration-component-registration-component-module */ "LazyComponents-registration-component-registration-component-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/registration-component/registration-component.module */ "./src/app/LazyComponents/registration-component/registration-component.module.ts")).then(m => m.RegistrationComponentModule) },
    { path: 'practesionar-data', loadChildren: () => Promise.all(/*! import() | LazyComponents-practionar-data-practionar-data-module */[__webpack_require__.e("default~LazyComponents-non-credential-non-credential-module~LazyComponents-practionar-data-practiona~bc30a37e"), __webpack_require__.e("LazyComponents-practionar-data-practionar-data-module")]).then(__webpack_require__.bind(null, /*! ../LazyComponents/practionar-data/practionar-data.module */ "./src/app/LazyComponents/practionar-data/practionar-data.module.ts")).then(m => m.PractionarDataModule) },
    { path: 'benefit-master', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-benefit-master-benefit-master-module */ "LazyComponents-benefit-master-benefit-master-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/benefit-master/benefit-master.module */ "./src/app/LazyComponents/benefit-master/benefit-master.module.ts")).then(m => m.BenefitMasterModule) },
    { path: 'addbenefit-master', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-add-benfit-master-add-benfit-master-module */ "LazyComponents-add-benfit-master-add-benfit-master-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/add-benfit-master/add-benfit-master.module */ "./src/app/LazyComponents/add-benfit-master/add-benfit-master.module.ts")).then(m => m.AddBenfitMasterModule) },
    { path: '837PUpload', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-upload837-p-upload837-p-module */ "LazyComponents-upload837-p-upload837-p-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/upload837-p/upload837-p.module */ "./src/app/LazyComponents/upload837-p/upload837-p.module.ts")).then(m => m.Upload837PModule) },
    { path: 'Claim-list', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-claim-list-claim-list-module */ "LazyComponents-claim-list-claim-list-module").then(__webpack_require__.bind(null, /*! ../LazyComponents/claim-list/claim-list.module */ "./src/app/LazyComponents/claim-list/claim-list.module.ts")).then(m => m.ClaimListModule) }
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