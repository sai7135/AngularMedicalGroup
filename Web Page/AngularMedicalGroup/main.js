(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./$$_lazy_route_resource lazy recursive":
/*!******************************************************!*\
  !*** ./$$_lazy_route_resource lazy namespace object ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app-routing.module.ts":
/*!***************************************!*\
  !*** ./src/app/app-routing.module.ts ***!
  \***************************************/
/*! exports provided: AppRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function() { return AppRoutingModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _ipa_ipa_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./ipa/ipa.component */ "./src/app/ipa/ipa.component.ts");
/* harmony import */ var _login_login_gaurd_service__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./login/login-gaurd.service */ "./src/app/login/login-gaurd.service.ts");
/* harmony import */ var _ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./ipa/ipaactivate.service */ "./src/app/ipa/ipaactivate.service.ts");







const routes = [
    { path: '', redirectTo: 'login', pathMatch: "full" },
    { path: 'verification', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-verification-verification-module */ "LazyComponents-verification-verification-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/verification/verification.module */ "./src/app/LazyComponents/verification/verification.module.ts")).then(m => m.VerificationModule) },
    { path: 'statesearch', loadChildren: () => Promise.all(/*! import() | LazyComponents-state-search-window-state-search-window-module */[__webpack_require__.e("default~LazyComponents-non-credential-non-credential-module~LazyComponents-state-search-window-state~4dd18297"), __webpack_require__.e("LazyComponents-state-search-window-state-search-window-module")]).then(__webpack_require__.bind(null, /*! ./LazyComponents/state-search-window/state-search-window.module */ "./src/app/LazyComponents/state-search-window/state-search-window.module.ts")).then(m => m.StateSearchWindowModule) },
    { path: 'login', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-login-login-module */ "LazyComponents-login-login-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/login/login.module */ "./src/app/LazyComponents/login/login.module.ts")).then(m => m.LoginModule), canActivate: [_login_login_gaurd_service__WEBPACK_IMPORTED_MODULE_3__["LoginGaurdService"]] },
    { path: 'ipa', component: _ipa_ipa_component__WEBPACK_IMPORTED_MODULE_2__["IpaComponent"], canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]], loadChildren: () => __webpack_require__.e(/*! import() | iparouting-iparouting-module */ "iparouting-iparouting-module").then(__webpack_require__.bind(null, /*! ./iparouting/iparouting.module */ "./src/app/iparouting/iparouting.module.ts")).then(m => m.IparoutingModule)
    },
    { path: 'searchpcp', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-search-pcp-search-pcp-module */ "LazyComponents-search-pcp-search-pcp-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/search-pcp/search-pcp.module */ "./src/app/LazyComponents/search-pcp/search-pcp.module.ts")).then(m => m.SearchPcpModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: 'searchbenefitmaster', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-search-benfit-master-search-benfit-master-module */ "LazyComponents-search-benfit-master-search-benfit-master-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/search-benfit-master/search-benfit-master.module */ "./src/app/LazyComponents/search-benfit-master/search-benfit-master.module.ts")).then(m => m.SearchBenfitMasterModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: 'non-cred', loadChildren: () => Promise.all(/*! import() | LazyComponents-non-credential-non-credential-module */[__webpack_require__.e("default~LazyComponents-non-credential-non-credential-module~LazyComponents-practionar-data-practiona~bc30a37e"), __webpack_require__.e("default~LazyComponents-non-credential-non-credential-module~LazyComponents-state-search-window-state~4dd18297"), __webpack_require__.e("LazyComponents-non-credential-non-credential-module")]).then(__webpack_require__.bind(null, /*! ./LazyComponents/non-credential/non-credential.module */ "./src/app/LazyComponents/non-credential/non-credential.module.ts")).then(m => m.NonCredentialModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: 'claim-view', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-claim-view-component-claim-view-component-module */ "LazyComponents-claim-view-component-claim-view-component-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/claim-view-component/claim-view-component.module */ "./src/app/LazyComponents/claim-view-component/claim-view-component.module.ts")).then(m => m.ClaimViewComponentModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: 'forgotpassword', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-forgot-password-forgot-password-module */ "LazyComponents-forgot-password-forgot-password-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/forgot-password/forgot-password.module */ "./src/app/LazyComponents/forgot-password/forgot-password.module.ts")).then(m => m.ForgotPasswordModule) },
    { path: 'organizationsearch', loadChildren: () => Promise.all(/*! import() | LazyComponents-organization-search-window-organization-search-window-module */[__webpack_require__.e("default~LazyComponents-organization-module-organization-module-module~LazyComponents-organization-se~e6b2d4f0"), __webpack_require__.e("LazyComponents-organization-search-window-organization-search-window-module")]).then(__webpack_require__.bind(null, /*! ./LazyComponents/organization-search-window/organization-search-window.module */ "./src/app/LazyComponents/organization-search-window/organization-search-window.module.ts")).then(m => m.OrganizationSearchWindowModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: 'searchmember', loadChildren: () => __webpack_require__.e(/*! import() | LazyComponents-search-member-l-search-member-l-module */ "LazyComponents-search-member-l-search-member-l-module").then(__webpack_require__.bind(null, /*! ./LazyComponents/search-member-l/search-member-l.module */ "./src/app/LazyComponents/search-member-l/search-member-l.module.ts")).then(m => m.SearchMemberLModule), canActivate: [_ipa_ipaactivate_service__WEBPACK_IMPORTED_MODULE_4__["IpaactivateService"]] },
    { path: '**', redirectTo: 'ipa' }
];
class AppRoutingModule {
}
AppRoutingModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: AppRoutingModule });
AppRoutingModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function AppRoutingModule_Factory(t) { return new (t || AppRoutingModule)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forRoot(routes, { useHash: true })],
        _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](AppRoutingModule, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]], exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](AppRoutingModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forRoot(routes, { useHash: true })],
                exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _services_communicate_service__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./services/communicate.service */ "./src/app/services/communicate.service.ts");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/material/progress-spinner */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/progress-spinner.js");







function AppComponent_div_1_Template(rf, ctx) { if (rf & 1) {
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "div");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](1, "div", 1);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](2, "mat-spinner", 2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
} }
class AppComponent {
    constructor(router, comm) {
        this.router = router;
        this.comm = comm;
        this.spin = true;
        this.router.events.subscribe((event) => {
            if (event instanceof _angular_router__WEBPACK_IMPORTED_MODULE_1__["NavigationStart"]) {
                this.spin = true;
            }
            if (event instanceof _angular_router__WEBPACK_IMPORTED_MODULE_1__["NavigationEnd"]) {
                this.spin = false;
            }
        });
        this.comm.communicate.subscribe(shouldspin => {
            this.spin = shouldspin;
        });
    }
}
AppComponent.ɵfac = function AppComponent_Factory(t) { return new (t || AppComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_router__WEBPACK_IMPORTED_MODULE_1__["Router"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_communicate_service__WEBPACK_IMPORTED_MODULE_2__["CommunicateService"])); };
AppComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: AppComponent, selectors: [["app-root"]], decls: 2, vars: 1, consts: [[4, "ngIf"], [1, "blacksheet"], ["color", "warn", 1, "spining"]], template: function AppComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](0, "router-outlet");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](1, AppComponent_div_1_Template, 3, 0, "div", 0);
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngIf", ctx.spin);
    } }, directives: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterOutlet"], _angular_common__WEBPACK_IMPORTED_MODULE_3__["NgIf"], _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_4__["MatSpinner"]], styles: [".blacksheet[_ngcontent-%COMP%] {\r\n    background-color:rgba(0,0,0,0.5);\r\n    position:absolute;\r\n    display:flex;\r\n    top:0;\r\n    left:0;\r\n    width:100vw;\r\n    height:100vh;\r\n    z-index:50;\r\n}\r\n.spining[_ngcontent-%COMP%]{\r\n    position: absolute;\r\n    position:fixed;\r\n    top:50%;\r\n    left:50%;\r\n    z-index:100;\r\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvYXBwLmNvbXBvbmVudC5jc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7SUFDSSxnQ0FBZ0M7SUFDaEMsaUJBQWlCO0lBQ2pCLFlBQVk7SUFDWixLQUFLO0lBQ0wsTUFBTTtJQUNOLFdBQVc7SUFDWCxZQUFZO0lBQ1osVUFBVTtBQUNkO0FBQ0E7SUFDSSxrQkFBa0I7SUFDbEIsY0FBYztJQUNkLE9BQU87SUFDUCxRQUFRO0lBQ1IsV0FBVztBQUNmIiwiZmlsZSI6InNyYy9hcHAvYXBwLmNvbXBvbmVudC5jc3MiLCJzb3VyY2VzQ29udGVudCI6WyIuYmxhY2tzaGVldCB7XHJcbiAgICBiYWNrZ3JvdW5kLWNvbG9yOnJnYmEoMCwwLDAsMC41KTtcclxuICAgIHBvc2l0aW9uOmFic29sdXRlO1xyXG4gICAgZGlzcGxheTpmbGV4O1xyXG4gICAgdG9wOjA7XHJcbiAgICBsZWZ0OjA7XHJcbiAgICB3aWR0aDoxMDB2dztcclxuICAgIGhlaWdodDoxMDB2aDtcclxuICAgIHotaW5kZXg6NTA7XHJcbn1cclxuLnNwaW5pbmd7XHJcbiAgICBwb3NpdGlvbjogYWJzb2x1dGU7XHJcbiAgICBwb3NpdGlvbjpmaXhlZDtcclxuICAgIHRvcDo1MCU7XHJcbiAgICBsZWZ0OjUwJTtcclxuICAgIHotaW5kZXg6MTAwO1xyXG59Il19 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](AppComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-root',
                templateUrl: './app.component.html',
                styleUrls: ['./app.component.css']
            }]
    }], function () { return [{ type: _angular_router__WEBPACK_IMPORTED_MODULE_1__["Router"] }, { type: _services_communicate_service__WEBPACK_IMPORTED_MODULE_2__["CommunicateService"] }]; }, null); })();


/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/__ivy_ngcc__/fesm2015/platform-browser.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _app_routing_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app-routing.module */ "./src/app/app-routing.module.ts");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _ipa_ipa_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./ipa/ipa.component */ "./src/app/ipa/ipa.component.ts");
/* harmony import */ var _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/platform-browser/animations */ "./node_modules/@angular/platform-browser/__ivy_ngcc__/fesm2015/animations.js");
/* harmony import */ var _material_material_module__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./material/material.module */ "./src/app/material/material.module.ts");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var _services_auth_intercept_service__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./services/auth-intercept.service */ "./src/app/services/auth-intercept.service.ts");
/* harmony import */ var _ipa_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./ipa/navbar/navbarvalues.service */ "./src/app/ipa/navbar/navbarvalues.service.ts");
/* harmony import */ var _angular_cdk_portal__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! @angular/cdk/portal */ "./node_modules/@angular/cdk/__ivy_ngcc__/fesm2015/portal.js");












class AppModule {
}
AppModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵdefineNgModule"]({ type: AppModule, bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_3__["AppComponent"]] });
AppModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵdefineInjector"]({ factory: function AppModule_Factory(t) { return new (t || AppModule)(); }, providers: [{ provide: _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HTTP_INTERCEPTORS"], multi: true, useClass: _services_auth_intercept_service__WEBPACK_IMPORTED_MODULE_8__["AuthInterceptService"] }, { provide: _ipa_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_9__["navbartoken"], useClass: _ipa_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_9__["NavbarvaluesService"] }], imports: [[
            _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
            _app_routing_module__WEBPACK_IMPORTED_MODULE_2__["AppRoutingModule"],
            _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_5__["BrowserAnimationsModule"],
            _material_material_module__WEBPACK_IMPORTED_MODULE_6__["MaterialModule"],
            _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HttpClientModule"],
            _angular_cdk_portal__WEBPACK_IMPORTED_MODULE_10__["PortalModule"]
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵsetNgModuleScope"](AppModule, { declarations: [_app_component__WEBPACK_IMPORTED_MODULE_3__["AppComponent"],
        _ipa_ipa_component__WEBPACK_IMPORTED_MODULE_4__["IpaComponent"]], imports: [_angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
        _app_routing_module__WEBPACK_IMPORTED_MODULE_2__["AppRoutingModule"],
        _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_5__["BrowserAnimationsModule"],
        _material_material_module__WEBPACK_IMPORTED_MODULE_6__["MaterialModule"],
        _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HttpClientModule"],
        _angular_cdk_portal__WEBPACK_IMPORTED_MODULE_10__["PortalModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵsetClassMetadata"](AppModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"],
        args: [{
                declarations: [
                    _app_component__WEBPACK_IMPORTED_MODULE_3__["AppComponent"],
                    _ipa_ipa_component__WEBPACK_IMPORTED_MODULE_4__["IpaComponent"]
                ],
                imports: [
                    _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
                    _app_routing_module__WEBPACK_IMPORTED_MODULE_2__["AppRoutingModule"],
                    _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_5__["BrowserAnimationsModule"],
                    _material_material_module__WEBPACK_IMPORTED_MODULE_6__["MaterialModule"],
                    _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HttpClientModule"],
                    _angular_cdk_portal__WEBPACK_IMPORTED_MODULE_10__["PortalModule"]
                ],
                providers: [{ provide: _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HTTP_INTERCEPTORS"], multi: true, useClass: _services_auth_intercept_service__WEBPACK_IMPORTED_MODULE_8__["AuthInterceptService"] }, { provide: _ipa_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_9__["navbartoken"], useClass: _ipa_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_9__["NavbarvaluesService"] }],
                bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_3__["AppComponent"]]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/date-picker-cust/date-picker-cust.component.ts":
/*!****************************************************************!*\
  !*** ./src/app/date-picker-cust/date-picker-cust.component.ts ***!
  \****************************************************************/
/*! exports provided: DatePickerCustComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "DatePickerCustComponent", function() { return DatePickerCustComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");
/* harmony import */ var _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/material/datepicker */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/datepicker.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");






const _c0 = function (a0) { return { "showinvalidcolumns": a0 }; };
class DatePickerCustComponent {
    constructor() {
        this.disabled = false;
    }
    writeValue(obj) {
        this.value1 = obj;
        // if(obj){
        // const dt=new Date(obj);
        // this.value=dt.getDate()+"/";
        // this.value+=dt.getMonth()+"/";
        // this.value+=dt.getFullYear();
        // console.log("write value");
        // }
        // else{
        //   this.value="";
        // }
    }
    onChanged(obj) {
        var date = new Date(obj);
        if (!isNaN(date.getMonth())) {
            this.vl = (date.getMonth() + 1) + "/";
            this.vl += date.getDate() + "/";
            this.vl += date.getFullYear();
            this.onChange(this.vl);
        }
        else {
            document.getElementById(this.uqvalue).value = null;
        }
    }
    onTouches(vl) {
        this.onTouched();
    }
    registerOnChange(fn) {
        this.onChange = fn;
    }
    registerOnTouched(fn) {
        this.onTouched = fn;
    }
    setDisabledState(isDisabled) {
        this.disabled = isDisabled;
    }
    ngOnInit() {
        setTimeout(() => {
            this.uqvalue = this.pickerref.id;
        });
    }
}
DatePickerCustComponent.ɵfac = function DatePickerCustComponent_Factory(t) { return new (t || DatePickerCustComponent)(); };
DatePickerCustComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: DatePickerCustComponent, selectors: [["app-date-picker-cust"]], inputs: { pickerref: "pickerref", showErrors: "showErrors" }, features: [_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵProvidersFeature"]([
            {
                provide: _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NG_VALUE_ACCESSOR"],
                useExisting: DatePickerCustComponent,
                multi: true
            }
        ])], decls: 1, vars: 7, consts: [["type", "text", 1, "form-control", 2, "width", "5vw", 3, "id", "ngClass", "disabled", "ngModel", "matDatepicker", "ngModelChange", "blur"]], template: function DatePickerCustComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "input", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("ngModelChange", function DatePickerCustComponent_Template_input_ngModelChange_0_listener($event) { return ctx.value1 = $event; })("blur", function DatePickerCustComponent_Template_input_blur_0_listener($event) { return ctx.onChanged($event.target.value); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("id", ctx.uqvalue)("ngClass", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpureFunction1"](5, _c0, ctx.showErrors))("disabled", ctx.disabled)("ngModel", ctx.value1)("matDatepicker", ctx.pickerref);
    } }, directives: [_angular_forms__WEBPACK_IMPORTED_MODULE_1__["DefaultValueAccessor"], _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_2__["MatDatepickerInput"], _angular_common__WEBPACK_IMPORTED_MODULE_3__["NgClass"], _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NgControlStatus"], _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NgModel"]], styles: [".showinvalidcolumns[_ngcontent-%COMP%]{\r\n    outline-color: red;\r\n    border-color: red;\r\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvZGF0ZS1waWNrZXItY3VzdC9kYXRlLXBpY2tlci1jdXN0LmNvbXBvbmVudC5jc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7SUFDSSxrQkFBa0I7SUFDbEIsaUJBQWlCO0FBQ3JCIiwiZmlsZSI6InNyYy9hcHAvZGF0ZS1waWNrZXItY3VzdC9kYXRlLXBpY2tlci1jdXN0LmNvbXBvbmVudC5jc3MiLCJzb3VyY2VzQ29udGVudCI6WyIuc2hvd2ludmFsaWRjb2x1bW5ze1xyXG4gICAgb3V0bGluZS1jb2xvcjogcmVkO1xyXG4gICAgYm9yZGVyLWNvbG9yOiByZWQ7XHJcbn0iXX0= */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](DatePickerCustComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-date-picker-cust',
                templateUrl: './date-picker-cust.component.html',
                styleUrls: ['./date-picker-cust.component.css'],
                providers: [
                    {
                        provide: _angular_forms__WEBPACK_IMPORTED_MODULE_1__["NG_VALUE_ACCESSOR"],
                        useExisting: DatePickerCustComponent,
                        multi: true
                    }
                ]
            }]
    }], function () { return []; }, { pickerref: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }], showErrors: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }] }); })();


/***/ }),

/***/ "./src/app/dialog/message/message.component.ts":
/*!*****************************************************!*\
  !*** ./src/app/dialog/message/message.component.ts ***!
  \*****************************************************/
/*! exports provided: MessageComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "MessageComponent", function() { return MessageComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_material_dialog__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/material/dialog */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/dialog.js");




class MessageComponent {
    constructor(dialogRef, data) {
        this.dialogRef = dialogRef;
        this.data = data;
    }
    ngOnInit() {
    }
    ok() {
        this.dialogRef.close();
    }
}
MessageComponent.ɵfac = function MessageComponent_Factory(t) { return new (t || MessageComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_material_dialog__WEBPACK_IMPORTED_MODULE_1__["MatDialogRef"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_material_dialog__WEBPACK_IMPORTED_MODULE_1__["MAT_DIALOG_DATA"])); };
MessageComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: MessageComponent, selectors: [["app-message"]], decls: 7, vars: 2, consts: [["mat-dialog-title", ""], ["mat-dialog-content", ""], ["mat-dialog-actions", ""], ["mat-raised-button", "", "color", "warn", 3, "click"]], template: function MessageComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "h1", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](2, "div", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](4, "div", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](5, "button", 3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function MessageComponent_Template_button_click_5_listener() { return ctx.ok(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](6, "Ok");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](ctx.data.title);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](ctx.data.content);
    } }, styles: ["\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2RpYWxvZy9tZXNzYWdlL21lc3NhZ2UuY29tcG9uZW50LmNzcyJ9 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](MessageComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-message',
                templateUrl: './message.component.html',
                styleUrls: ['./message.component.css']
            }]
    }], function () { return [{ type: _angular_material_dialog__WEBPACK_IMPORTED_MODULE_1__["MatDialogRef"] }, { type: undefined, decorators: [{
                type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Inject"],
                args: [_angular_material_dialog__WEBPACK_IMPORTED_MODULE_1__["MAT_DIALOG_DATA"]]
            }] }]; }, null); })();


/***/ }),

/***/ "./src/app/ipa/ipa.component.ts":
/*!**************************************!*\
  !*** ./src/app/ipa/ipa.component.ts ***!
  \**************************************/
/*! exports provided: IpaComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "IpaComponent", function() { return IpaComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./navbar/navbarvalues.service */ "./src/app/ipa/navbar/navbarvalues.service.ts");
/* harmony import */ var _services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../services/token-manager.service */ "./src/app/services/token-manager.service.ts");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/material/toolbar */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/toolbar.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var _angular_material_button__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/material/button */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/button.js");
/* harmony import */ var _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/material/sidenav */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/sidenav.js");
/* harmony import */ var _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @angular/material/expansion */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/expansion.js");
/* harmony import */ var _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/material/icon */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/icon.js");












function IpaComponent_button_5_Template(rf, ctx) { if (rf & 1) {
    const _r3 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵgetCurrentView"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "button", 4);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function IpaComponent_button_5_Template_button_click_0_listener() { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵrestoreView"](_r3); const ctx_r2 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵnextContext"](); return ctx_r2.navlink("register"); });
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](1, "Register New User");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
} }
function IpaComponent_mat_expansion_panel_22_mat_action_row_3_Template(rf, ctx) { if (rf & 1) {
    const _r8 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵgetCurrentView"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "mat-action-row", 14);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function IpaComponent_mat_expansion_panel_22_mat_action_row_3_Template_mat_action_row_click_0_listener() { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵrestoreView"](_r8); const each_r6 = ctx.$implicit; const ctx_r7 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵnextContext"](2); return ctx_r7.navlink(each_r6.url); });
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "span", 15);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
} if (rf & 2) {
    const each_r6 = ctx.$implicit;
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](each_r6.name);
} }
function IpaComponent_mat_expansion_panel_22_Template(rf, ctx) { if (rf & 1) {
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "mat-expansion-panel", 11);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "mat-expansion-panel-header", 12);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](3, IpaComponent_mat_expansion_panel_22_mat_action_row_3_Template, 3, 1, "mat-action-row", 13);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
} if (rf & 2) {
    const eachs_r4 = ctx.$implicit;
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("hideToggle", "true");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("expandedHeight", "50px")("collapsedHeight", "50px");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate1"](" ", eachs_r4.name, " ");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngForOf", eachs_r4.list);
} }
class IpaComponent {
    constructor(tm, router, values, route) {
        this.tm = tm;
        this.router = router;
        this.values = values;
        this.route = route;
        this.open = true;
        this.displayedColumns = ["name"];
    }
    ngOnInit() {
        this.today = new Date();
        this.isAdmin = localStorage.getItem("role") === "admin";
    }
    logout() {
        this.tm.removeToken();
    }
    changepassword() {
        this.router.navigate(["changepassword"], { relativeTo: this.route });
    }
    navlink(link) {
        this.router.navigate([link], { relativeTo: this.route });
    }
    drawer() {
        this.open = this.open ? false : true;
    }
}
IpaComponent.ɵfac = function IpaComponent_Factory(t) { return new (t || IpaComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__["TokenManagerService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_1__["navbartoken"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_router__WEBPACK_IMPORTED_MODULE_3__["ActivatedRoute"])); };
IpaComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: IpaComponent, selectors: [["app-ipa"]], decls: 28, vars: 10, consts: [[1, "space"], ["mat-raised-button", "", "color", "warn", 3, "click", 4, "ngIf"], [1, "space-logout"], ["mat-raised-button", "", "color", "warn"], ["mat-raised-button", "", "color", "warn", 3, "click"], ["color", "warn", 1, "time-show"], [1, "mat-subheading-1"], [1, "setscrollstyle", 3, "mode", "opened"], [3, "displayMode"], [3, "hideToggle", 4, "ngFor", "ngForOf"], [3, "click"], [3, "hideToggle"], [3, "expandedHeight", "collapsedHeight"], ["style", "color:blue;background-color:aqua;width: 100%;height:10%;", 3, "click", 4, "ngFor", "ngForOf"], [2, "color", "blue", "background-color", "aqua", "width", "100%", "height", "10%", 3, "click"], [2, "margin-right", "auto", "size", "10%", "user-select", "none"]], template: function IpaComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "mat-toolbar");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "mat-toolbar-row");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](2, "span");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](3, "Angular Medical Group");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](4, "span", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](5, IpaComponent_button_5_Template, 2, 0, "button", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](6, "span", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](7, "button", 3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](8, "support");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](9, "span", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](10, "button", 4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function IpaComponent_Template_button_click_10_listener() { return ctx.changepassword(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](11, "Change Password");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](12, "span", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](13, "button", 4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function IpaComponent_Template_button_click_13_listener() { return ctx.logout(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](14, "logout");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](15, "mat-toolbar", 5);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](16, "span", 6);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](17);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipe"](18, "date");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](19, "mat-drawer-container");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](20, "mat-drawer", 7);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](21, "mat-accordion", 8);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](22, IpaComponent_mat_expansion_panel_22_Template, 4, 5, "mat-expansion-panel", 9);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](23, "mat-drawer-content");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](24, "button", 10);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function IpaComponent_Template_button_click_24_listener() { return ctx.drawer(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](25, "mat-icon");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](26);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](27, "router-outlet");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](5);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngIf", ctx.isAdmin);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](12);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipeBind2"](18, 7, ctx.today, "MMMM dd, yyyy hh:mm a"));
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("mode", "side")("opened", ctx.open);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("displayMode", "flat");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngForOf", ctx.values.value);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](ctx.open ? "arrow_left" : "arrow_right");
    } }, directives: [_angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__["MatToolbar"], _angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__["MatToolbarRow"], _angular_common__WEBPACK_IMPORTED_MODULE_5__["NgIf"], _angular_material_button__WEBPACK_IMPORTED_MODULE_6__["MatButton"], _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatDrawerContainer"], _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatDrawer"], _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatAccordion"], _angular_common__WEBPACK_IMPORTED_MODULE_5__["NgForOf"], _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatDrawerContent"], _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__["MatIcon"], _angular_router__WEBPACK_IMPORTED_MODULE_3__["RouterOutlet"], _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionPanel"], _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionPanelHeader"], _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionPanelActionRow"]], pipes: [_angular_common__WEBPACK_IMPORTED_MODULE_5__["DatePipe"]], styles: [".space[_ngcontent-%COMP%]{\r\n    flex:7 1 auto;\r\n}\r\n.space-logout[_ngcontent-%COMP%]{\r\n    flex:1 1 auto;\r\n}\r\n.time-show[_ngcontent-%COMP%]{\r\n    height: -webkit-fit-content;\r\n    height: -moz-fit-content;\r\n    height: fit-content;\r\n}\r\n.mat-subheading-1[_ngcontent-%COMP%]{\r\n    margin-bottom: 0%;\r\n}\r\nmat-panel-title[_ngcontent-%COMP%]{\r\n    width:-webkit-fit-content;\r\n    width:-moz-fit-content;\r\n    width:fit-content;\r\n}\r\nmat-expansion-panel[_ngcontent-%COMP%]{\r\n    width: 18vw;\r\n}\r\nmat-list-item[_ngcontent-%COMP%]{\r\n    margin: 0% !important;\r\n    padding:0% !important;\r\n}\r\nmat-drawer-container[_ngcontent-%COMP%]{\r\n    width:100%;\r\n    height: 100%;\r\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvaXBhL2lwYS5jb21wb25lbnQuY3NzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0lBQ0ksYUFBYTtBQUNqQjtBQUNBO0lBQ0ksYUFBYTtBQUNqQjtBQUNBO0lBQ0ksMkJBQW1CO0lBQW5CLHdCQUFtQjtJQUFuQixtQkFBbUI7QUFDdkI7QUFDQTtJQUNJLGlCQUFpQjtBQUNyQjtBQUNBO0lBQ0kseUJBQWlCO0lBQWpCLHNCQUFpQjtJQUFqQixpQkFBaUI7QUFDckI7QUFDQTtJQUNJLFdBQVc7QUFDZjtBQUNBO0lBQ0kscUJBQXFCO0lBQ3JCLHFCQUFxQjtBQUN6QjtBQUNBO0lBQ0ksVUFBVTtJQUNWLFlBQVk7QUFDaEIiLCJmaWxlIjoic3JjL2FwcC9pcGEvaXBhLmNvbXBvbmVudC5jc3MiLCJzb3VyY2VzQ29udGVudCI6WyIuc3BhY2V7XHJcbiAgICBmbGV4OjcgMSBhdXRvO1xyXG59XHJcbi5zcGFjZS1sb2dvdXR7XHJcbiAgICBmbGV4OjEgMSBhdXRvO1xyXG59XHJcbi50aW1lLXNob3d7XHJcbiAgICBoZWlnaHQ6IGZpdC1jb250ZW50O1xyXG59XHJcbi5tYXQtc3ViaGVhZGluZy0xe1xyXG4gICAgbWFyZ2luLWJvdHRvbTogMCU7XHJcbn1cclxubWF0LXBhbmVsLXRpdGxle1xyXG4gICAgd2lkdGg6Zml0LWNvbnRlbnQ7XHJcbn1cclxubWF0LWV4cGFuc2lvbi1wYW5lbHtcclxuICAgIHdpZHRoOiAxOHZ3O1xyXG59XHJcbm1hdC1saXN0LWl0ZW17XHJcbiAgICBtYXJnaW46IDAlICFpbXBvcnRhbnQ7XHJcbiAgICBwYWRkaW5nOjAlICFpbXBvcnRhbnQ7XHJcbn1cclxubWF0LWRyYXdlci1jb250YWluZXJ7XHJcbiAgICB3aWR0aDoxMDAlO1xyXG4gICAgaGVpZ2h0OiAxMDAlO1xyXG59XHJcblxyXG5cclxuIl19 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](IpaComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-ipa',
                templateUrl: './ipa.component.html',
                styleUrls: ['./ipa.component.css'],
            }]
    }], function () { return [{ type: _services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__["TokenManagerService"] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"] }, { type: _navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_1__["NavbarvaluesService"], decorators: [{
                type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Inject"],
                args: [_navbar_navbarvalues_service__WEBPACK_IMPORTED_MODULE_1__["navbartoken"]]
            }] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_3__["ActivatedRoute"] }]; }, null); })();


/***/ }),

/***/ "./src/app/ipa/ipaactivate.service.ts":
/*!********************************************!*\
  !*** ./src/app/ipa/ipaactivate.service.ts ***!
  \********************************************/
/*! exports provided: IpaactivateService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "IpaactivateService", function() { return IpaactivateService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../services/token-manager.service */ "./src/app/services/token-manager.service.ts");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");





class IpaactivateService {
    constructor(tm, router) {
        this.tm = tm;
        this.router = router;
    }
    canActivate() {
        return this.tm.isAuthoroized().pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_1__["map"])(r => {
            if (r) {
                return r;
            }
            else {
                this.router.navigate(["/login"]);
            }
        }));
    }
}
IpaactivateService.ɵfac = function IpaactivateService_Factory(t) { return new (t || IpaactivateService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__["TokenManagerService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"])); };
IpaactivateService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: IpaactivateService, factory: IpaactivateService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](IpaactivateService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _services_token_manager_service__WEBPACK_IMPORTED_MODULE_2__["TokenManagerService"] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"] }]; }, null); })();


/***/ }),

/***/ "./src/app/ipa/navbar/navbarvalues.service.ts":
/*!****************************************************!*\
  !*** ./src/app/ipa/navbar/navbarvalues.service.ts ***!
  \****************************************************/
/*! exports provided: navbartoken, NavbarvaluesService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "navbartoken", function() { return navbartoken; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "NavbarvaluesService", function() { return NavbarvaluesService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");


let navbartoken = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["InjectionToken"]("navbarvalues");
class NavbarvaluesService {
    constructor() {
        this.value = [
            {
                name: 'Authorization/Referal',
                list: [
                    { name: 'Auth/UM Workflow - Outpatient' },
                    { name: 'Auth/UM Workflow - Inpatient' },
                    { name: 'Auth/UM Workflow' },
                    { name: 'View/Search Authorization' },
                    { name: 'Quick Review' },
                    { name: 'Auth/Referral Submission' },
                    { name: 'User Fields Configuration' },
                    { name: 'Batch Printing' },
                    { name: 'Auth Auto Adjudication' },
                    { name: 'Auth Auto Routing Set' },
                    { name: 'Auth Auto Routing' }
                ]
            },
            {
                name: 'Benefit Plan',
                list: [
                    { name: 'Financial Responsibility Config' },
                    { name: 'Healthplan Contracts' },
                    { name: 'Employer Group' },
                    { name: 'Benefit Rule' },
                    { name: 'Benefit Master', url: 'benefit-master' },
                    { name: 'Tracking Maintanance' },
                    { name: 'Detail Option Maintanance' }
                ]
            },
            {
                name: 'Capitation',
                list: [
                    { name: 'Capitation Master Screens' },
                    { name: 'Capitation Rate Configuration' },
                    { name: 'Member Months' },
                    { name: 'PCP Capitation Processing' },
                    { name: 'Speciality Process' },
                    { name: 'Speciality Configuration' },
                    { name: 'Speciality Earning Master' },
                    { name: 'Organization Payments' }
                ]
            },
            {
                name: 'Claims',
                list: [
                    { name: 'Claims Workflow' },
                    { name: 'Claims Adjudication' },
                    { name: 'Provider - Claim Submission' },
                    { name: 'Claims Search/Status' },
                    { name: 'Interest Configuration' },
                    { name: 'Batch Processing' },
                    { name: 'Assign Rule Set' },
                    { name: 'Auto Adjudication Set' },
                    { name: 'Auto Adjudication' },
                    { name: 'Auto Routing Set' },
                    { name: 'Auto Routing' },
                    { name: 'Refunds' },
                    { name: 'Drug Prices' },
                    { name: 'Adjustment Reason Code' },
                    { name: 'Timely Filing' }
                ]
            },
            {
                name: 'Contracting',
                list: [
                    { name: 'Contract Assignments' },
                    { name: 'Contract Templates' },
                    { name: 'Exception Extended FeeSchedules' },
                    { name: 'Extended Fee Schedule' },
                    { name: 'Fee Schedule' },
                    { name: 'Service Modifier Table' },
                    { name: 'Single Unit Scheme' },
                    { name: 'Withhold Table' },
                    { name: 'Component Unit Scheme' },
                    { name: 'FeeSet Utility Configuration' }
                ]
            },
            {
                name: 'Credentialing',
                list: [
                    { name: 'Provider Taxonomy Codes' },
                    { name: 'Credentialing Dashboard' },
                    { name: 'Initial Application Requests' },
                    { name: 'Practesionar Data', url: 'practesionar-data' },
                    { name: 'Organizations', url: 'organization' }
                ]
            },
            {
                name: 'Customer Service',
                list: [
                    { name: 'Ticket Dashboard' },
                    { name: 'Add Support Tickets' },
                    { name: 'Search Tickets' },
                    { name: 'Customer Service Request' }
                ]
            },
            {
                name: 'Codes & Types',
                list: [
                    { name: 'Service Code / Revenue Code' },
                    { name: 'Diagnosis Code' },
                    { name: 'Contract Types' },
                    { name: 'Case Management' },
                    { name: 'NDC Code' },
                    { name: 'Clinical Alerts' },
                    { name: 'Customer Service' },
                    { name: 'Authorization / Referral' },
                    { name: 'Benefit Plan' },
                    { name: 'Claims' },
                    { name: 'Contracting' },
                    { name: 'Credentialing' },
                    { name: 'EDI Services' },
                    { name: 'Eligibility' },
                    { name: 'Maintenance' }
                ]
            },
            {
                name: 'Dashboard',
                list: [
                    { name: 'Actionable Dashboard' },
                    { name: 'Dashboard Configuration' }
                ]
            },
            {
                name: 'EDI Services',
                list: [
                    { name: 'Online EDI Enrollment' },
                    { name: '277 Upload' },
                    { name: '837P Enc. Mgmt' },
                    { name: '837I Enc. Mgmt' },
                    { name: '837P Upload', url: '837PUpload' },
                    { name: '835 Download' },
                    { name: '837I Upload' },
                    { name: 'Cross Maping' },
                    { name: '834 Ben. Mgmt' },
                    { name: 'EDI Admin' },
                    { name: '837P Failed Claims Dashboard' },
                    { name: '837I Failed Claims Dashboard' },
                    { name: 'Trading Partner Enrollment' },
                    { name: 'EDI Service Log Monitor' }
                ]
            },
            {
                name: 'Eligibility',
                list: [
                    { name: 'Eligibility Import' },
                    { name: 'Assessments' },
                    { name: 'Report Eligibility Discrepency' },
                    { name: 'Eligiblity Import Configuration' },
                    { name: 'Global Transactions' },
                    { name: 'Member\'s Health Assessments' },
                    { name: 'Member Verfication' },
                    { name: 'Members', url: 'members' },
                    { name: 'Member Portal Management' },
                    { name: 'Subscriber' },
                    { name: 'Assessment Template Configuration' },
                    { name: 'Eligibility Investigation' },
                    { name: 'RAF Dashboard' },
                    { name: 'Eligbility Level2 mappings and corrections' }
                ]
            },
            {
                name: 'Fax',
                list: [
                    { name: 'Inbound Fax' },
                    { name: 'Fax Status' },
                    { name: 'Fax Blast' }
                ]
            },
            {
                name: 'Information',
                list: [
                    { name: 'Provider Search(Map)' },
                    { name: 'Code Reference-CPT' },
                    { name: 'Code Reference-ICD' },
                    { name: 'Code Reference - Modifier' },
                    { name: 'DOFR Lookup' },
                    { name: 'Member Search' },
                    { name: 'Provider Search' },
                    { name: 'Provider Search - External' },
                    { name: 'Release Notes' },
                    { name: 'Document Management' }
                ]
            },
            {
                name: 'Maintanance',
                list: [
                    { name: 'Company Configuration' },
                    { name: 'Masster Configuration' },
                    { name: 'Terms Of Use' },
                    { name: 'CalendarTable' },
                    { name: 'Draw Diagram' },
                    { name: 'Measurement Tracking Master' },
                    { name: 'Apollo Login' },
                    { name: 'Help Document Details' },
                    { name: 'Upload Data Files' },
                    { name: 'CPT Classification' },
                    { name: 'Document Category' },
                    { name: 'CMS Organization Group Config' },
                    { name: 'Annoucement' },
                    { name: 'Letter Template' },
                    { name: 'Problem Category / Defenition' },
                    { name: 'Reason Master' },
                    { name: 'Virtual Group' },
                    { name: 'Notification Configuration' }
                ]
            },
            {
                name: 'Finance',
                list: [
                    { name: 'Claims Analysis' },
                    { name: 'FFS By Speciality By' },
                    { name: 'Profitability Report' },
                    { name: 'Pool Earning Master' },
                    { name: 'Refunds' }
                ]
            },
            {
                name: 'PDR',
                list: [
                    { name: 'PDR Dashboard-Summary' },
                    { name: 'PDR Submission/Search' },
                    { name: 'PDR DAshboard-New' }
                ]
            },
            {
                name: 'Payement Processing',
                list: [
                    { name: 'Check Register' },
                    { name: 'Claims EOB' },
                    { name: 'Claims Payment Processing' },
                    { name: 'Capitation Explanation Of Benefits' }
                ]
            },
            {
                name: 'Profitability',
                list: [
                    { name: 'Revenue Recept' },
                    { name: 'Detail-NEW' }
                ]
            },
            {
                name: 'Reports',
                list: [
                    { name: 'My Favorites' },
                    { name: 'Authorization/Referal' },
                    { name: 'Capitation' },
                    { name: 'Claims' },
                    { name: 'Common Reports' },
                    { name: 'Credentialing' },
                    { name: 'Customer Service' },
                    { name: 'Eligibility' },
                    { name: 'PDR' },
                    { name: 'Profitability' },
                    { name: 'Provider' },
                    { name: 'Query Bilder' },
                    { name: 'Security' },
                    { name: 'Third Party Liability Reports' },
                    { name: 'UM Reports' },
                    { name: 'PCP Reports' },
                    { name: 'Externel Report' },
                    { name: 'Report Trail' },
                ]
            },
            {
                name: 'Security',
                list: [
                    { name: 'Login Audit' },
                    { name: 'Audit Trail' },
                    { name: 'Copy To Company' },
                    { name: 'Department' },
                    { name: 'Job Title' },
                    { name: 'Linked Job Department' },
                    { name: 'Employee' },
                    { name: 'IP Configuration' },
                    { name: 'Manage User Access' },
                    { name: 'Request To Login' },
                    { name: 'Site Links' },
                    { name: 'Site Modules' },
                    { name: 'UM Descision Security' },
                    { name: 'User' },
                    { name: 'User Master' },
                    { name: 'User Role(s)' }
                ]
            },
            {
                name: 'Training Videos',
                list: [
                    { name: 'Provider Portal' }
                ]
            },
            {
                name: 'Infratructure',
                list: [
                    { name: 'IT Dashboard[Beta]' }
                ]
            },
            {
                name: 'Case Management',
                list: [
                    { name: 'Case Management Workflow' },
                    { name: 'New Referral Submission' },
                    { name: 'Referral Search' },
                    { name: 'New Case Submission' },
                    { name: 'Case Search' },
                    { name: 'Task Dashboard' },
                    { name: 'Care Plan Template' }
                ]
            },
            {
                name: 'Documents',
                list: [
                    { name: 'Provider Manual' },
                    { name: 'Security Policies and Security Incident Reporting Procedure' },
                    { name: 'HPIPA Fraud,Waste and Abuse Reporting' }
                ]
            },
            {
                name: 'Letter Template',
                list: [
                    { name: 'Create Template' },
                    { name: 'Template Maping' },
                    { name: 'Letter Dashboard' },
                    { name: 'Batch Printing' },
                    { name: 'Letter Trail' }
                ]
            },
            {
                name: 'Webinar Videos',
                list: []
            }
        ];
    }
}
NavbarvaluesService.ɵfac = function NavbarvaluesService_Factory(t) { return new (t || NavbarvaluesService)(); };
NavbarvaluesService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: NavbarvaluesService, factory: NavbarvaluesService.ɵfac });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](NavbarvaluesService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"]
    }], function () { return []; }, null); })();


/***/ }),

/***/ "./src/app/login/login-gaurd.service.ts":
/*!**********************************************!*\
  !*** ./src/app/login/login-gaurd.service.ts ***!
  \**********************************************/
/*! exports provided: LoginGaurdService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "LoginGaurdService", function() { return LoginGaurdService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _services_token_manager_service__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../services/token-manager.service */ "./src/app/services/token-manager.service.ts");





class LoginGaurdService {
    constructor(router, tm) {
        this.router = router;
        this.tm = tm;
    }
    canActivate() {
        return this.tm.isAuthoroized().pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_1__["map"])(r => {
            if (r) {
                this.router.navigate(["/ipa"]);
            }
            else {
                return true;
            }
        }));
        // if(localStorage.getItem("angularToken")===null){
        //   return true;
        // }
        // else{
        //   this.router.navigate(["/ipa"]);
        // }
    }
}
LoginGaurdService.ɵfac = function LoginGaurdService_Factory(t) { return new (t || LoginGaurdService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_router__WEBPACK_IMPORTED_MODULE_2__["Router"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_services_token_manager_service__WEBPACK_IMPORTED_MODULE_3__["TokenManagerService"])); };
LoginGaurdService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: LoginGaurdService, factory: LoginGaurdService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](LoginGaurdService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _angular_router__WEBPACK_IMPORTED_MODULE_2__["Router"] }, { type: _services_token_manager_service__WEBPACK_IMPORTED_MODULE_3__["TokenManagerService"] }]; }, null); })();


/***/ }),

/***/ "./src/app/material/material.module.ts":
/*!*********************************************!*\
  !*** ./src/app/material/material.module.ts ***!
  \*********************************************/
/*! exports provided: MaterialModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "MaterialModule", function() { return MaterialModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_material_card__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/material/card */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/card.js");
/* harmony import */ var _angular_material_form_field__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/material/form-field */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/form-field.js");
/* harmony import */ var _angular_material_input__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/material/input */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/input.js");
/* harmony import */ var _angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/material/toolbar */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/toolbar.js");
/* harmony import */ var _angular_material_button__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/material/button */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/button.js");
/* harmony import */ var _angular_material_snack_bar__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/material/snack-bar */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/snack-bar.js");
/* harmony import */ var _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/material/sidenav */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/sidenav.js");
/* harmony import */ var _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @angular/material/expansion */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/expansion.js");
/* harmony import */ var _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/material/icon */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/icon.js");
/* harmony import */ var _angular_material_grid_list__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! @angular/material/grid-list */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/grid-list.js");
/* harmony import */ var _angular_material_divider__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! @angular/material/divider */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/divider.js");
/* harmony import */ var _angular_material_tree__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! @angular/material/tree */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/tree.js");
/* harmony import */ var _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! @angular/material/progress-spinner */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/progress-spinner.js");
/* harmony import */ var _angular_material_dialog__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! @angular/material/dialog */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/dialog.js");
/* harmony import */ var _angular_material_table__WEBPACK_IMPORTED_MODULE_15__ = __webpack_require__(/*! @angular/material/table */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/table.js");
/* harmony import */ var _angular_material_paginator__WEBPACK_IMPORTED_MODULE_16__ = __webpack_require__(/*! @angular/material/paginator */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/paginator.js");
/* harmony import */ var _angular_material_select__WEBPACK_IMPORTED_MODULE_17__ = __webpack_require__(/*! @angular/material/select */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/select.js");
/* harmony import */ var _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__ = __webpack_require__(/*! @angular/material/datepicker */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/datepicker.js");
/* harmony import */ var _angular_material_core__WEBPACK_IMPORTED_MODULE_19__ = __webpack_require__(/*! @angular/material/core */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_material_tabs__WEBPACK_IMPORTED_MODULE_20__ = __webpack_require__(/*! @angular/material/tabs */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/tabs.js");
/* harmony import */ var _date_picker_cust_date_picker_cust_component__WEBPACK_IMPORTED_MODULE_21__ = __webpack_require__(/*! ../date-picker-cust/date-picker-cust.component */ "./src/app/date-picker-cust/date-picker-cust.component.ts");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_22__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_23__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");

























class MaterialModule {
}
MaterialModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: MaterialModule });
MaterialModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function MaterialModule_Factory(t) { return new (t || MaterialModule)(); }, imports: [[_angular_common__WEBPACK_IMPORTED_MODULE_22__["CommonModule"], _angular_forms__WEBPACK_IMPORTED_MODULE_23__["FormsModule"], _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
            _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"]],
        _angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__["MatToolbarModule"],
        _angular_material_card__WEBPACK_IMPORTED_MODULE_1__["MatCardModule"],
        _angular_material_form_field__WEBPACK_IMPORTED_MODULE_2__["MatFormFieldModule"],
        _angular_material_input__WEBPACK_IMPORTED_MODULE_3__["MatInputModule"],
        _angular_material_button__WEBPACK_IMPORTED_MODULE_5__["MatButtonModule"],
        _angular_material_snack_bar__WEBPACK_IMPORTED_MODULE_6__["MatSnackBarModule"],
        _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatSidenavModule"],
        _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionModule"],
        _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__["MatIconModule"],
        _angular_material_grid_list__WEBPACK_IMPORTED_MODULE_10__["MatGridListModule"],
        _angular_material_divider__WEBPACK_IMPORTED_MODULE_11__["MatDividerModule"],
        _angular_material_tree__WEBPACK_IMPORTED_MODULE_12__["MatTreeModule"],
        _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_13__["MatProgressSpinnerModule"],
        _angular_material_dialog__WEBPACK_IMPORTED_MODULE_14__["MatDialogModule"],
        _angular_material_table__WEBPACK_IMPORTED_MODULE_15__["MatTableModule"],
        _angular_material_paginator__WEBPACK_IMPORTED_MODULE_16__["MatPaginatorModule"],
        _angular_material_select__WEBPACK_IMPORTED_MODULE_17__["MatSelectModule"],
        _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
        _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"],
        _angular_material_tabs__WEBPACK_IMPORTED_MODULE_20__["MatTabsModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](MaterialModule, { declarations: [_date_picker_cust_date_picker_cust_component__WEBPACK_IMPORTED_MODULE_21__["DatePickerCustComponent"]], imports: [_angular_common__WEBPACK_IMPORTED_MODULE_22__["CommonModule"], _angular_forms__WEBPACK_IMPORTED_MODULE_23__["FormsModule"], _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
        _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"]], exports: [_angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__["MatToolbarModule"],
        _angular_material_card__WEBPACK_IMPORTED_MODULE_1__["MatCardModule"],
        _date_picker_cust_date_picker_cust_component__WEBPACK_IMPORTED_MODULE_21__["DatePickerCustComponent"],
        _angular_material_form_field__WEBPACK_IMPORTED_MODULE_2__["MatFormFieldModule"],
        _angular_material_input__WEBPACK_IMPORTED_MODULE_3__["MatInputModule"],
        _angular_material_button__WEBPACK_IMPORTED_MODULE_5__["MatButtonModule"],
        _angular_material_snack_bar__WEBPACK_IMPORTED_MODULE_6__["MatSnackBarModule"],
        _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatSidenavModule"],
        _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionModule"],
        _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__["MatIconModule"],
        _angular_material_grid_list__WEBPACK_IMPORTED_MODULE_10__["MatGridListModule"],
        _angular_material_divider__WEBPACK_IMPORTED_MODULE_11__["MatDividerModule"],
        _angular_material_tree__WEBPACK_IMPORTED_MODULE_12__["MatTreeModule"],
        _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_13__["MatProgressSpinnerModule"],
        _angular_material_dialog__WEBPACK_IMPORTED_MODULE_14__["MatDialogModule"],
        _angular_material_table__WEBPACK_IMPORTED_MODULE_15__["MatTableModule"],
        _angular_material_paginator__WEBPACK_IMPORTED_MODULE_16__["MatPaginatorModule"],
        _angular_material_select__WEBPACK_IMPORTED_MODULE_17__["MatSelectModule"],
        _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
        _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"],
        _angular_material_tabs__WEBPACK_IMPORTED_MODULE_20__["MatTabsModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](MaterialModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [_date_picker_cust_date_picker_cust_component__WEBPACK_IMPORTED_MODULE_21__["DatePickerCustComponent"]],
                imports: [_angular_common__WEBPACK_IMPORTED_MODULE_22__["CommonModule"], _angular_forms__WEBPACK_IMPORTED_MODULE_23__["FormsModule"], _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
                    _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"]],
                exports: [_angular_material_toolbar__WEBPACK_IMPORTED_MODULE_4__["MatToolbarModule"],
                    _angular_material_card__WEBPACK_IMPORTED_MODULE_1__["MatCardModule"],
                    _date_picker_cust_date_picker_cust_component__WEBPACK_IMPORTED_MODULE_21__["DatePickerCustComponent"],
                    _angular_material_form_field__WEBPACK_IMPORTED_MODULE_2__["MatFormFieldModule"],
                    _angular_material_input__WEBPACK_IMPORTED_MODULE_3__["MatInputModule"],
                    _angular_material_button__WEBPACK_IMPORTED_MODULE_5__["MatButtonModule"],
                    _angular_material_snack_bar__WEBPACK_IMPORTED_MODULE_6__["MatSnackBarModule"],
                    _angular_material_sidenav__WEBPACK_IMPORTED_MODULE_7__["MatSidenavModule"],
                    _angular_material_expansion__WEBPACK_IMPORTED_MODULE_8__["MatExpansionModule"],
                    _angular_material_icon__WEBPACK_IMPORTED_MODULE_9__["MatIconModule"],
                    _angular_material_grid_list__WEBPACK_IMPORTED_MODULE_10__["MatGridListModule"],
                    _angular_material_divider__WEBPACK_IMPORTED_MODULE_11__["MatDividerModule"],
                    _angular_material_tree__WEBPACK_IMPORTED_MODULE_12__["MatTreeModule"],
                    _angular_material_progress_spinner__WEBPACK_IMPORTED_MODULE_13__["MatProgressSpinnerModule"],
                    _angular_material_dialog__WEBPACK_IMPORTED_MODULE_14__["MatDialogModule"],
                    _angular_material_table__WEBPACK_IMPORTED_MODULE_15__["MatTableModule"],
                    _angular_material_paginator__WEBPACK_IMPORTED_MODULE_16__["MatPaginatorModule"],
                    _angular_material_select__WEBPACK_IMPORTED_MODULE_17__["MatSelectModule"],
                    _angular_material_datepicker__WEBPACK_IMPORTED_MODULE_18__["MatDatepickerModule"],
                    _angular_material_core__WEBPACK_IMPORTED_MODULE_19__["MatNativeDateModule"],
                    _angular_material_tabs__WEBPACK_IMPORTED_MODULE_20__["MatTabsModule"]
                ]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/raw/defaultdata.ts":
/*!************************************!*\
  !*** ./src/app/raw/defaultdata.ts ***!
  \************************************/
/*! exports provided: apilink, weblink */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "apilink", function() { return apilink; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "weblink", function() { return weblink; });
const apilink = "https://localhost:44345/api/";
const weblink = "https://localhost:44344/AngularMedicalGroup/#/";


/***/ }),

/***/ "./src/app/services/apicontact.service.ts":
/*!************************************************!*\
  !*** ./src/app/services/apicontact.service.ts ***!
  \************************************************/
/*! exports provided: ApicontactService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ApicontactService", function() { return ApicontactService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var _dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../dialog/message/message.component */ "./src/app/dialog/message/message.component.ts");
/* harmony import */ var file_saver__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! file-saver */ "./node_modules/file-saver/dist/FileSaver.min.js");
/* harmony import */ var file_saver__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(file_saver__WEBPACK_IMPORTED_MODULE_3__);
/* harmony import */ var _raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../raw/defaultdata */ "./src/app/raw/defaultdata.ts");
/* harmony import */ var _angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/material/dialog */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/dialog.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _services_communicate_service__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ../services/communicate.service */ "./src/app/services/communicate.service.ts");










class ApicontactService {
    constructor(http, matDialog, router, comm) {
        this.http = http;
        this.matDialog = matDialog;
        this.router = router;
        this.comm = comm;
    }
    getfiletext(fileid) {
        const REQUEST_PARAMS = new _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpParams"]().set("fileName", fileid + ".txt");
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/getEDI?fileid=" + fileid, {
            params: REQUEST_PARAMS,
            responseType: 'arraybuffer'
        }).subscribe(data => {
            Object(file_saver__WEBPACK_IMPORTED_MODULE_3__["saveAs"])(new Blob([data], { type: 'text/plain' }), fileid + ".txt");
        });
    }
    searchMemberClaim(data) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/searchMemberClaim", data);
    }
    getFileData(searchdata) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/GetFileData", searchdata);
    }
    getClaimsData(claimid) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/GetClaimsData?claimid=" + claimid);
    }
    getMemberPCPs(memberId, healthPlan) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/getPCPs?memberid=" + memberId + "&healthplan=" + healthPlan);
    }
    saveMemberPCPs(saveData, memberid, healthplan) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/postPCPs?memberid=" + memberid + "&healthplan=" + healthplan, saveData);
    }
    saveMemberHPs(saveData, memberid, healthplan) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/postHPs?memberid=" + memberid + "&healthplan=" + healthplan, saveData);
    }
    getMemberHps(memberId, healthPlan) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/getHealthPlans?memberid=" + memberId + "&healthplan=" + healthPlan);
    }
    modifyMember(member) {
        return this.http.put(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/setMember", member);
    }
    searchMember(ms) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/searchMember", ms);
    }
    selectMember(memberId, healthPlan) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/GetMember?memberid=" + memberId + "&healthplan=" + healthPlan);
    }
    searchPCP(pcpid, npi, lastName, firstName, organizationName, address1, address2, city, state, postalCode) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/searchProvider?pcpid=" + pcpid + "&pcpnpi=" + npi + "&lastName=" + lastName + "&firstName=" + firstName + "&organizationName=" + organizationName + "&address1=" + address1 + "&address2=" + address2 + "&city=" + city + "&state=" + state + "&postalCode=" + postalCode);
    }
    searchBenefitMaster(hp, benCode) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/searchBenefit?healthplan=" + hp + "&healthplancode=" + benCode);
    }
    createMember(model) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/createMember", model);
    }
    getPcpOrganization(pcpid) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/getPcpOrganization?pcpid=" + pcpid);
    }
    getBenefitMasterDescription(hpCode, benefitcode) {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/searchBenefitCode?healthPlanCode=" + hpCode + "&benefitCode=" + benefitcode);
    }
    getAllClaims() {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/allclaims");
    }
    searchOrganization(query = null) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/SearchOrganization?searchquery=" + encodeURIComponent(query), {});
    }
    addBenefitMaster(model) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/BenefitMasterAdd", model, { headers: new _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpHeaders"]({ 'Content-Type': 'application/json' }) });
    }
    getBenefitMaster() {
        return this.http.get(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/GetBenefitMaster");
    }
    uploadEdi(formData) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/EdiUpload", formData);
    }
    addProviders(formData) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/addProviders", formData, {
            reportProgress: true,
            observe: 'events'
        });
    }
    addProvider(providerdata) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/addProvider", providerdata);
    }
    checkuser(user) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Account/useridcheck?userid=" + user, "");
    }
    resetPassword(model) {
        this.comm.communicate.emit(true);
        this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Account/RechangePassword", model, {
            headers: new _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpHeaders"]().set("Content_Type", "application/json")
        }).subscribe(r => {
            this.comm.communicate.emit(false);
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'password changed', content: 'password changed' }
            });
            this.router.navigate(["login"]);
        }, r => {
            this.comm.communicate.emit(false);
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'password not changed', content: 'some error occured please try again' }
            });
        });
    }
    addOrganiztion(model) {
        model.payToAddress.phone = this.phoneformater(model.payToAddress.phone);
        model.payToAddress.faxNumber = this.phoneformater(model.payToAddress.faxNumber);
        model.billingAddress.phone = this.phoneformater(model.billingAddress.phone);
        model.billingAddress.faxNumber = this.phoneformater(model.billingAddress.faxNumber);
        this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Users/addOrganization", model).subscribe(r => {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'organization added', content: 'organization has successfully added' }
            });
            this.router.navigate(['ipa/organization']);
        }, r => {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'organization not added', content: 'organization has not added' }
            });
        });
    }
    phoneformater(phone) {
        var newVal = phone.replace(/\D/g, '');
        if (newVal.length <= 10) {
            newVal = newVal.replace(/^(\d{0,3})(\d{0,3})(.*)/, '($1) $2-$3');
        }
        return newVal;
    }
    registerUser(model) {
        this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Account/Register", model).subscribe(r => {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'User Registered', content: 'user has been registered' }
            });
            this.router.navigate(["ipa"]);
        }, r => {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: 'User Not Registered', content: 'user not registered some error occured' }
            });
        });
    }
    getToken(logindetails) {
        return this.http.post("https://localhost:44345/token", `username=${logindetails.username}&password=${logindetails.password}&grant_type=password`, {
            headers: new _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpHeaders"]({
                'Content_Type': 'application/x-www-formurlencoded'
            })
        });
    }
    ApiChangePassword(changepassword) {
        return this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Account/ChangePassword", changepassword);
    }
    ForgetPasswordToken(emails) {
        this.comm.communicate.emit(true);
        this.http.post(_raw_defaultdata__WEBPACK_IMPORTED_MODULE_4__["apilink"] + "Account/ForgotPasswordToken?email=" + emails, {
        // headers:new HttpHeaders().set('Content_Type','application/json')
        }).subscribe(r => {
            this.comm.communicate.emit(false);
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: "confirmation", content: "confirmation mail sent" }
            });
            this.router.navigate(["/login"]);
        }, r => {
            this.comm.communicate.emit(false);
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_2__["MessageComponent"], {
                width: '50vw',
                data: { title: "change password", content: "a problem occured" }
            });
        });
    }
}
ApicontactService.ɵfac = function ApicontactService_Factory(t) { return new (t || ApicontactService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpClient"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__["MatDialog"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_router__WEBPACK_IMPORTED_MODULE_6__["Router"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_services_communicate_service__WEBPACK_IMPORTED_MODULE_7__["CommunicateService"])); };
ApicontactService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: ApicontactService, factory: ApicontactService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ApicontactService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpClient"] }, { type: _angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__["MatDialog"] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_6__["Router"] }, { type: _services_communicate_service__WEBPACK_IMPORTED_MODULE_7__["CommunicateService"] }]; }, null); })();


/***/ }),

/***/ "./src/app/services/auth-intercept.service.ts":
/*!****************************************************!*\
  !*** ./src/app/services/auth-intercept.service.ts ***!
  \****************************************************/
/*! exports provided: AuthInterceptService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AuthInterceptService", function() { return AuthInterceptService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");





class AuthInterceptService {
    constructor(router) {
        this.router = router;
    }
    intercept(req, next) {
        if (!!localStorage.getItem('angularToken')) {
            var nreq = req.clone({
                headers: req.headers.append('authorization', 'bearer ' + localStorage.getItem('angularToken'))
            });
            return next.handle(nreq).pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["tap"])(() => { }, (err) => {
                if (err instanceof _angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpErrorResponse"]) {
                    if (err.status !== 401) {
                        return;
                    }
                    localStorage.removeItem('angularToken');
                    this.router.navigate(['login']);
                }
            }));
        }
        else {
            return next.handle(req);
        }
    }
}
AuthInterceptService.ɵfac = function AuthInterceptService_Factory(t) { return new (t || AuthInterceptService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"])); };
AuthInterceptService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: AuthInterceptService, factory: AuthInterceptService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](AuthInterceptService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _angular_router__WEBPACK_IMPORTED_MODULE_3__["Router"] }]; }, null); })();


/***/ }),

/***/ "./src/app/services/communicate.service.ts":
/*!*************************************************!*\
  !*** ./src/app/services/communicate.service.ts ***!
  \*************************************************/
/*! exports provided: CommunicateService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "CommunicateService", function() { return CommunicateService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");


class CommunicateService {
    constructor() {
        this.communicate = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"]();
    }
}
CommunicateService.ɵfac = function CommunicateService_Factory(t) { return new (t || CommunicateService)(); };
CommunicateService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: CommunicateService, factory: CommunicateService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](CommunicateService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return []; }, null); })();


/***/ }),

/***/ "./src/app/services/token-manager.service.ts":
/*!***************************************************!*\
  !*** ./src/app/services/token-manager.service.ts ***!
  \***************************************************/
/*! exports provided: TokenManagerService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TokenManagerService", function() { return TokenManagerService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _dialog_message_message_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../dialog/message/message.component */ "./src/app/dialog/message/message.component.ts");
/* harmony import */ var _angular_material_dialog__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/material/dialog */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/dialog.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _services_communicate_service__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ../services/communicate.service */ "./src/app/services/communicate.service.ts");
/* harmony import */ var _services_apicontact_service__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ../services/apicontact.service */ "./src/app/services/apicontact.service.ts");










class TokenManagerService {
    constructor(matDialog, http, router, comm, api) {
        this.matDialog = matDialog;
        this.http = http;
        this.router = router;
        this.comm = comm;
        this.api = api;
    }
    saveToken(token, role) {
        localStorage.setItem('angularToken', token);
        localStorage.setItem('role', role);
    }
    changepassword(passwords) {
        this.api.ApiChangePassword(passwords).subscribe(r => {
            this.removeToken();
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_3__["MessageComponent"], {
                width: '50vw',
                data: { title: "change password", content: "password has been changed" }
            });
        }, r => {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_3__["MessageComponent"], {
                width: '50vw',
                data: { title: "change password", content: "password not changed" }
            });
        });
    }
    removeToken() {
        this.comm.communicate.emit(true);
        this.http.post("https://localhost:44345/api/Account/Logout", {}).subscribe(r => {
            this.router.navigate(["/login"]);
            localStorage.removeItem('angularToken');
        });
    }
    isAuthoroized() {
        if (!!localStorage.getItem('angularToken')) {
            return this.http.get("https://localhost:44345/api/users").pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["map"])(r => {
                return true;
            }, r => {
                console.log(r);
                return false;
            }));
        }
        else {
            return rxjs__WEBPACK_IMPORTED_MODULE_1__["Observable"].create(ob => {
                ob.next(false);
            });
        }
    }
}
TokenManagerService.ɵfac = function TokenManagerService_Factory(t) { return new (t || TokenManagerService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_material_dialog__WEBPACK_IMPORTED_MODULE_4__["MatDialog"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_common_http__WEBPACK_IMPORTED_MODULE_5__["HttpClient"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_router__WEBPACK_IMPORTED_MODULE_6__["Router"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_services_communicate_service__WEBPACK_IMPORTED_MODULE_7__["CommunicateService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_services_apicontact_service__WEBPACK_IMPORTED_MODULE_8__["ApicontactService"])); };
TokenManagerService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: TokenManagerService, factory: TokenManagerService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](TokenManagerService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _angular_material_dialog__WEBPACK_IMPORTED_MODULE_4__["MatDialog"] }, { type: _angular_common_http__WEBPACK_IMPORTED_MODULE_5__["HttpClient"] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_6__["Router"] }, { type: _services_communicate_service__WEBPACK_IMPORTED_MODULE_7__["CommunicateService"] }, { type: _services_apicontact_service__WEBPACK_IMPORTED_MODULE_8__["ApicontactService"] }]; }, null); })();


/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.
const environment = {
    production: false
};
/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/__ivy_ngcc__/fesm2015/platform-browser.js");




if (_environments_environment__WEBPACK_IMPORTED_MODULE_1__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["enableProdMode"])();
}
_angular_platform_browser__WEBPACK_IMPORTED_MODULE_3__["platformBrowser"]().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_2__["AppModule"])
    .catch(err => console.error(err));


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! C:\Users\saikiran\source\repos\MyIPA\Angular Medical Group Material\AngularMedicalGroup\src\main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main.js.map