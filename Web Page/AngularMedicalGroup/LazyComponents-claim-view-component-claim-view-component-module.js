(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["LazyComponents-claim-view-component-claim-view-component-module"],{

/***/ "./src/app/LazyComponents/claim-view-component/claim-view-component.module.ts":
/*!************************************************************************************!*\
  !*** ./src/app/LazyComponents/claim-view-component/claim-view-component.module.ts ***!
  \************************************************************************************/
/*! exports provided: ClaimViewComponentModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ClaimViewComponentModule", function() { return ClaimViewComponentModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var src_app_ipa_claim_view_claim_view_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! src/app/ipa/claim-view/claim-view.component */ "./src/app/ipa/claim-view/claim-view.component.ts");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");
/* harmony import */ var src_app_OriginRouting_claim_view_route_claim_view_route_module__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! src/app/OriginRouting/claim-view-route/claim-view-route.module */ "./src/app/OriginRouting/claim-view-route/claim-view-route.module.ts");






class ClaimViewComponentModule {
}
ClaimViewComponentModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: ClaimViewComponentModule });
ClaimViewComponentModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function ClaimViewComponentModule_Factory(t) { return new (t || ClaimViewComponentModule)(); }, imports: [[
            _angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_3__["ReactiveFormsModule"],
            src_app_OriginRouting_claim_view_route_claim_view_route_module__WEBPACK_IMPORTED_MODULE_4__["ClaimViewRouteModule"]
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](ClaimViewComponentModule, { declarations: [src_app_ipa_claim_view_claim_view_component__WEBPACK_IMPORTED_MODULE_2__["ClaimViewComponent"]], imports: [_angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
        _angular_forms__WEBPACK_IMPORTED_MODULE_3__["ReactiveFormsModule"],
        src_app_OriginRouting_claim_view_route_claim_view_route_module__WEBPACK_IMPORTED_MODULE_4__["ClaimViewRouteModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ClaimViewComponentModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [src_app_ipa_claim_view_claim_view_component__WEBPACK_IMPORTED_MODULE_2__["ClaimViewComponent"]],
                imports: [
                    _angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
                    _angular_forms__WEBPACK_IMPORTED_MODULE_3__["ReactiveFormsModule"],
                    src_app_OriginRouting_claim_view_route_claim_view_route_module__WEBPACK_IMPORTED_MODULE_4__["ClaimViewRouteModule"]
                ]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/OriginRouting/claim-view-route/claim-view-route.module.ts":
/*!***************************************************************************!*\
  !*** ./src/app/OriginRouting/claim-view-route/claim-view-route.module.ts ***!
  \***************************************************************************/
/*! exports provided: ClaimViewRouteModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ClaimViewRouteModule", function() { return ClaimViewRouteModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var src_app_ipa_claim_view_claim_view_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! src/app/ipa/claim-view/claim-view.component */ "./src/app/ipa/claim-view/claim-view.component.ts");





const appRoutes = [
    {
        path: '', component: src_app_ipa_claim_view_claim_view_component__WEBPACK_IMPORTED_MODULE_2__["ClaimViewComponent"]
    }
];
class ClaimViewRouteModule {
}
ClaimViewRouteModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: ClaimViewRouteModule });
ClaimViewRouteModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function ClaimViewRouteModule_Factory(t) { return new (t || ClaimViewRouteModule)(); }, imports: [[
            _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(appRoutes)
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](ClaimViewRouteModule, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ClaimViewRouteModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [],
                imports: [
                    _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(appRoutes)
                ]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/ipa/claim-view/claim-view.component.ts":
/*!********************************************************!*\
  !*** ./src/app/ipa/claim-view/claim-view.component.ts ***!
  \********************************************************/
/*! exports provided: ClaimViewComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ClaimViewComponent", function() { return ClaimViewComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");



class ClaimViewComponent {
    constructor() { }
    ngOnInit() {
    }
}
ClaimViewComponent.ɵfac = function ClaimViewComponent_Factory(t) { return new (t || ClaimViewComponent)(); };
ClaimViewComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: ClaimViewComponent, selectors: [["app-claim-view"]], decls: 1, vars: 0, template: function ClaimViewComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](0, "form");
    } }, directives: [_angular_forms__WEBPACK_IMPORTED_MODULE_1__["ɵangular_packages_forms_forms_y"], _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NgControlStatusGroup"], _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NgForm"]], styles: ["\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2lwYS9jbGFpbS12aWV3L2NsYWltLXZpZXcuY29tcG9uZW50LmNzcyJ9 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ClaimViewComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-claim-view',
                templateUrl: './claim-view.component.html',
                styleUrls: ['./claim-view.component.css']
            }]
    }], function () { return []; }, null); })();


/***/ })

}]);
//# sourceMappingURL=LazyComponents-claim-view-component-claim-view-component-module.js.map