(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["LazyComponents-verification-verification-module"],{

/***/ "./src/app/LazyComponents/verification/verification.module.ts":
/*!********************************************************************!*\
  !*** ./src/app/LazyComponents/verification/verification.module.ts ***!
  \********************************************************************/
/*! exports provided: VerificationModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "VerificationModule", function() { return VerificationModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var src_app_verification_verification_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! src/app/verification/verification.component */ "./src/app/verification/verification.component.ts");
/* harmony import */ var src_app_material_material_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! src/app/material/material.module */ "./src/app/material/material.module.ts");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");
/* harmony import */ var src_app_OriginRouting_verification_route_verification_route_module__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! src/app/OriginRouting/verification-route/verification-route.module */ "./src/app/OriginRouting/verification-route/verification-route.module.ts");







class VerificationModule {
}
VerificationModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: VerificationModule });
VerificationModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function VerificationModule_Factory(t) { return new (t || VerificationModule)(); }, imports: [[
            _angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
            src_app_material_material_module__WEBPACK_IMPORTED_MODULE_3__["MaterialModule"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_4__["FormsModule"],
            src_app_OriginRouting_verification_route_verification_route_module__WEBPACK_IMPORTED_MODULE_5__["VerificationRouteModule"]
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](VerificationModule, { declarations: [src_app_verification_verification_component__WEBPACK_IMPORTED_MODULE_2__["VerificationComponent"]], imports: [_angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
        src_app_material_material_module__WEBPACK_IMPORTED_MODULE_3__["MaterialModule"],
        _angular_forms__WEBPACK_IMPORTED_MODULE_4__["FormsModule"],
        src_app_OriginRouting_verification_route_verification_route_module__WEBPACK_IMPORTED_MODULE_5__["VerificationRouteModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](VerificationModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [src_app_verification_verification_component__WEBPACK_IMPORTED_MODULE_2__["VerificationComponent"]],
                imports: [
                    _angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
                    src_app_material_material_module__WEBPACK_IMPORTED_MODULE_3__["MaterialModule"],
                    _angular_forms__WEBPACK_IMPORTED_MODULE_4__["FormsModule"],
                    src_app_OriginRouting_verification_route_verification_route_module__WEBPACK_IMPORTED_MODULE_5__["VerificationRouteModule"]
                ]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/OriginRouting/verification-route/verification-route.module.ts":
/*!*******************************************************************************!*\
  !*** ./src/app/OriginRouting/verification-route/verification-route.module.ts ***!
  \*******************************************************************************/
/*! exports provided: VerificationRouteModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "VerificationRouteModule", function() { return VerificationRouteModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var src_app_verification_verification_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! src/app/verification/verification.component */ "./src/app/verification/verification.component.ts");





const appRoutes = [
    {
        path: '', component: src_app_verification_verification_component__WEBPACK_IMPORTED_MODULE_2__["VerificationComponent"]
    }
];
class VerificationRouteModule {
}
VerificationRouteModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: VerificationRouteModule });
VerificationRouteModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function VerificationRouteModule_Factory(t) { return new (t || VerificationRouteModule)(); }, imports: [[
            _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(appRoutes)
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](VerificationRouteModule, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](VerificationRouteModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                declarations: [],
                imports: [
                    _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(appRoutes)
                ]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/verification/verification.component.ts":
/*!********************************************************!*\
  !*** ./src/app/verification/verification.component.ts ***!
  \********************************************************/
/*! exports provided: VerificationComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "VerificationComponent", function() { return VerificationComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _dialog_message_message_component__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../dialog/message/message.component */ "./src/app/dialog/message/message.component.ts");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _services_apicontact_service__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../services/apicontact.service */ "./src/app/services/apicontact.service.ts");
/* harmony import */ var _services_communicate_service__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../services/communicate.service */ "./src/app/services/communicate.service.ts");
/* harmony import */ var _angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/material/dialog */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/dialog.js");
/* harmony import */ var _angular_material_toolbar__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/material/toolbar */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/toolbar.js");
/* harmony import */ var _angular_material_card__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/material/card */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/card.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/__ivy_ngcc__/fesm2015/forms.js");
/* harmony import */ var _angular_material_button__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/material/button */ "./node_modules/@angular/material/__ivy_ngcc__/fesm2015/button.js");











class VerificationComponent {
    constructor(route, apiContact, comm, matDialog) {
        this.route = route;
        this.apiContact = apiContact;
        this.comm = comm;
        this.matDialog = matDialog;
    }
    ngOnInit() {
        this.route.queryParams.subscribe((params) => {
            this.token = params['token'];
            this.email = params['email'];
        });
    }
    send() {
        if (this.password !== this.confirmpassword) {
            this.matDialog.open(_dialog_message_message_component__WEBPACK_IMPORTED_MODULE_1__["MessageComponent"], {
                width: "50vw",
                data: { title: "change password", content: "New Password and Confirm Password doesn't match" }
            });
        }
        else {
            this.apiContact.resetPassword({ Email: this.email, Password: this.password, ConfirmPassword: this.confirmpassword, token: this.token });
        }
    }
}
VerificationComponent.ɵfac = function VerificationComponent_Factory(t) { return new (t || VerificationComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_router__WEBPACK_IMPORTED_MODULE_2__["ActivatedRoute"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_apicontact_service__WEBPACK_IMPORTED_MODULE_3__["ApicontactService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_communicate_service__WEBPACK_IMPORTED_MODULE_4__["CommunicateService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__["MatDialog"])); };
VerificationComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: VerificationComponent, selectors: [["app-verification"]], decls: 13, vars: 2, consts: [[1, "background-img"], ["color", "warn"], [2, "width", "fit-content", "margin-left", "40vw", "margin-top", "30vh"], ["type", "password", "placeholder", "new password", 3, "ngModel", "ngModelChange"], ["type", "password", "placeholder", "confirm password", 3, "ngModel", "ngModelChange"], ["mat-raised-button", "", "color", "warn", 3, "click"]], template: function VerificationComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "body", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "mat-toolbar", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](2, "span");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](3, "Angular Medical Group");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](4, "mat-card", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](5, "mat-card-title");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](6, "Email");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](7, "mat-card-content");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](8, "input", 3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("ngModelChange", function VerificationComponent_Template_input_ngModelChange_8_listener($event) { return ctx.password = $event; });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](9, "input", 4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("ngModelChange", function VerificationComponent_Template_input_ngModelChange_9_listener($event) { return ctx.confirmpassword = $event; });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](10, "mat-card-actions");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](11, "button", 5);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function VerificationComponent_Template_button_click_11_listener() { return ctx.send(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](12, "submit");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](8);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngModel", ctx.password);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngModel", ctx.confirmpassword);
    } }, directives: [_angular_material_toolbar__WEBPACK_IMPORTED_MODULE_6__["MatToolbar"], _angular_material_card__WEBPACK_IMPORTED_MODULE_7__["MatCard"], _angular_material_card__WEBPACK_IMPORTED_MODULE_7__["MatCardTitle"], _angular_material_card__WEBPACK_IMPORTED_MODULE_7__["MatCardContent"], _angular_forms__WEBPACK_IMPORTED_MODULE_8__["DefaultValueAccessor"], _angular_forms__WEBPACK_IMPORTED_MODULE_8__["NgControlStatus"], _angular_forms__WEBPACK_IMPORTED_MODULE_8__["NgModel"], _angular_material_card__WEBPACK_IMPORTED_MODULE_7__["MatCardActions"], _angular_material_button__WEBPACK_IMPORTED_MODULE_9__["MatButton"]], styles: [".background-img[_ngcontent-%COMP%]{\r\n    background-image: url(\"https://images.unsplash.com/photo-1576091160550-2173dba999ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80\");\r\n    margin-top: none;\r\n    background-size: cover;\r\n    background-repeat: no-repeat;\r\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvdmVyaWZpY2F0aW9uL3ZlcmlmaWNhdGlvbi5jb21wb25lbnQuY3NzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0lBQ0ksK0pBQStKO0lBQy9KLGdCQUFnQjtJQUNoQixzQkFBc0I7SUFDdEIsNEJBQTRCO0FBQ2hDIiwiZmlsZSI6InNyYy9hcHAvdmVyaWZpY2F0aW9uL3ZlcmlmaWNhdGlvbi5jb21wb25lbnQuY3NzIiwic291cmNlc0NvbnRlbnQiOlsiLmJhY2tncm91bmQtaW1ne1xyXG4gICAgYmFja2dyb3VuZC1pbWFnZTogdXJsKFwiaHR0cHM6Ly9pbWFnZXMudW5zcGxhc2guY29tL3Bob3RvLTE1NzYwOTExNjA1NTAtMjE3M2RiYTk5OWVmP2l4bGliPXJiLTEuMi4xJml4aWQ9ZXlKaGNIQmZhV1FpT2pFeU1EZDkmYXV0bz1mb3JtYXQmZml0PWNyb3Amdz0xNTAwJnE9ODBcIik7XHJcbiAgICBtYXJnaW4tdG9wOiBub25lO1xyXG4gICAgYmFja2dyb3VuZC1zaXplOiBjb3ZlcjtcclxuICAgIGJhY2tncm91bmQtcmVwZWF0OiBuby1yZXBlYXQ7XHJcbn0iXX0= */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](VerificationComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-verification',
                templateUrl: './verification.component.html',
                styleUrls: ['./verification.component.css']
            }]
    }], function () { return [{ type: _angular_router__WEBPACK_IMPORTED_MODULE_2__["ActivatedRoute"] }, { type: _services_apicontact_service__WEBPACK_IMPORTED_MODULE_3__["ApicontactService"] }, { type: _services_communicate_service__WEBPACK_IMPORTED_MODULE_4__["CommunicateService"] }, { type: _angular_material_dialog__WEBPACK_IMPORTED_MODULE_5__["MatDialog"] }]; }, null); })();


/***/ })

}]);
//# sourceMappingURL=LazyComponents-verification-verification-module.js.map