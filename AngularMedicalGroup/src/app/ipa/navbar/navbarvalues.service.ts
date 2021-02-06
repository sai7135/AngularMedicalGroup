import { Injectable,InjectionToken } from '@angular/core';
import {Value} from './navbarmodel';

export let navbartoken=new InjectionToken<NavbarvaluesService>("navbarvalues")
@Injectable()
export class NavbarvaluesService {
  public value:Value[];
  constructor() {
    this.value=[
       {
        name:'Authorization/Referal',
        list:[
          {name:'Auth/UM Workflow - Outpatient'},
          {name:'Auth/UM Workflow - Inpatient'},
          {name:'Auth/UM Workflow'},
          {name:'View/Search Authorization'},
          {name:'Quick Review'},
          {name:'Auth/Referral Submission'},
          {name:'User Fields Configuration'},
          {name:'Batch Printing'},
          {name:'Auth Auto Adjudication'},
          {name:'Auth Auto Routing Set'},
          {name:'Auth Auto Routing'}
        ]
      },
      {
        name:'Benefit Plan',
        list:[
          {name:'Financial Responsibility Config'},
          {name:'Healthplan Contracts'},
          {name:'Employer Group'},
          {name:'Benefit Rule'},
          {name:'Benefit Master',url:'benefit-master'},
          {name:'Tracking Maintanance'},
          {name:'Detail Option Maintanance'}
        ]
      },
      {
        name:'Capitation',
        list:[
          {name:'Capitation Master Screens'},
          {name:'Capitation Rate Configuration'},
          {name:'Member Months'},
          {name:'PCP Capitation Processing'},
          {name:'Speciality Process'},
          {name:'Speciality Configuration'},
          {name:'Speciality Earning Master'},
          {name:'Organization Payments'}
        ]
      },
      {
        name:'Claims',
        list:[
          {name:'Claims Workflow'},
          {name:'Claims Adjudication'},
          {name:'Provider - Claim Submission'},
          {name:'Claims Search/Status'},
          {name:'Interest Configuration'},
          {name:'Batch Processing'},
          {name:'Assign Rule Set'},
          {name:'Auto Adjudication Set'},
          {name:'Auto Adjudication'},
          {name:'Auto Routing Set'},
          {name:'Auto Routing'},
          {name:'Refunds'},
          {name:'Drug Prices'},
          {name:'Adjustment Reason Code'},
          {name:'Timely Filing'}
        ]
      },
      {
        name:'Contracting',
        list:[
          {name:'Contract Assignments'},
          {name:'Contract Templates'},
          {name:'Exception Extended FeeSchedules'},
          {name:'Extended Fee Schedule'},
          {name:'Fee Schedule'},
          {name:'Service Modifier Table'},
          {name:'Single Unit Scheme'},
          {name:'Withhold Table'},
          {name:'Component Unit Scheme'},
          {name:'FeeSet Utility Configuration'}
        ]
      },
      {
        name:'Credentialing',
        list:[
          {name:'Provider Taxonomy Codes'},
          {name:'Credentialing Dashboard'},
          {name:'Initial Application Requests'},
          {name:'Practesionar Data',url:'practesionar-data'},
          {name:'Organizations',url:'organization'}
        ]
      },
      {
        name:'Customer Service',
        list:[
          {name:'Ticket Dashboard'},
          {name:'Add Support Tickets'},
          {name:'Search Tickets'},
          {name:'Customer Service Request'}
        ]
      },
      {
        name:'Codes & Types',
        list:[
          {name:'Service Code / Revenue Code'},
          {name:'Diagnosis Code'},
          {name:'Contract Types'},
          {name:'Case Management'},
          {name:'NDC Code'},
          {name:'Clinical Alerts'},
          {name:'Customer Service'},
          {name:'Authorization / Referral'},
          {name:'Benefit Plan'},
          {name:'Claims'},
          {name:'Contracting'},
          {name:'Credentialing'},
          {name:'EDI Services'},
          {name:'Eligibility'},
          {name:'Maintenance'}
        ]
      },
      {
        name:'Dashboard',
        list:[
          {name:'Actionable Dashboard'},
          {name:'Dashboard Configuration'}
        ]
      },
      {
        name:'EDI Services',
        list:[
          {name:'Online EDI Enrollment'},
          {name:'277 Upload'},
          {name:'837P Enc. Mgmt'},
          {name:'837I Enc. Mgmt'},
          {name:'837P Upload',url:'837PUpload'},
          {name:'835 Download'},
          {name:'837I Upload'},
          {name:'Cross Maping'},
          {name:'834 Ben. Mgmt'},
          {name:'EDI Admin'},
          {name:'837P Failed Claims Dashboard'},
          {name:'837I Failed Claims Dashboard'},
          {name:'Trading Partner Enrollment'},
          {name:'EDI Service Log Monitor'}
        ]
      },
      {
        name:'Eligibility',
        list:[
          {name:'Eligibility Import'},
          {name:'Assessments'},
          {name:'Report Eligibility Discrepency'},
          {name:'Eligiblity Import Configuration'},
          {name:'Global Transactions'},
          {name:'Member\'s Health Assessments'},
          {name:'Member Verfication'},
          {name:'Members',url:'members'},
          {name:'Member Portal Management'},
          {name:'Subscriber'},
          {name:'Assessment Template Configuration'},
          {name:'Eligibility Investigation'},
          {name:'RAF Dashboard'},
          {name:'Eligbility Level2 mappings and corrections'}
        ]
      },
      {
        name:'Fax',
        list:[
          {name:'Inbound Fax'},
          {name:'Fax Status'},
          {name:'Fax Blast'}
        ]
      },
      {
        name:'Information',
        list:[
          {name:'Provider Search(Map)'},
          {name:'Code Reference-CPT'},
          {name:'Code Reference-ICD'},
          {name:'Code Reference - Modifier'},
          {name:'DOFR Lookup'},
          {name:'Member Search'},
          {name:'Provider Search'},
          {name:'Provider Search - External'},
          {name:'Release Notes'},
          {name:'Document Management'}
        ]
      },
      {
        name:'Maintanance',
        list:[
          {name:'Company Configuration'},
          {name:'Masster Configuration'},
          {name:'Terms Of Use'},
          {name:'CalendarTable'},
          {name:'Draw Diagram'},
          {name:'Measurement Tracking Master'},
          {name:'Apollo Login'},
          {name:'Help Document Details'},
          {name:'Upload Data Files'},
          {name:'CPT Classification'},
          {name:'Document Category'},
          {name:'CMS Organization Group Config'},
          {name:'Annoucement'},
          {name:'Letter Template'},
          {name:'Problem Category / Defenition'},
          {name:'Reason Master'},
          {name:'Virtual Group'},
          {name:'Notification Configuration'}
        ]
      },
      {
        name:'Finance',
        list:[
          {name:'Claims Analysis'},
          {name:'FFS By Speciality By'},
          {name:'Profitability Report'},
          {name:'Pool Earning Master'},
          {name:'Refunds'}
        ]
      },
      {
        name:'PDR',
        list:[
          {name:'PDR Dashboard-Summary'},
          {name:'PDR Submission/Search'},
          {name:'PDR DAshboard-New'}
        ]
      },
      {
        name:'Payement Processing',
        list:[
          {name:'Check Register'},
          {name:'Claims EOB'},
          {name:'Claims Payment Processing'},
          {name:'Capitation Explanation Of Benefits'}
        ]
      },
      {
        name:'Profitability',
        list:[
          {name:'Revenue Recept'},
          {name:'Detail-NEW'}
        ]
      },
      {
        name:'Reports',
        list:[
          {name:'My Favorites'},
          {name:'Authorization/Referal'},
          {name:'Capitation'},
          {name:'Claims'},
          {name:'Common Reports'},
          {name:'Credentialing'},
          {name:'Customer Service'},
          {name:'Eligibility'},
          {name:'PDR'},
          {name:'Profitability'},
          {name:'Provider'},
          {name:'Query Bilder'},
          {name:'Security'},
          {name:'Third Party Liability Reports'},
          {name:'UM Reports'},
          {name:'PCP Reports'},
          {name:'Externel Report'},
          {name:'Report Trail'},
        ]
      },
      {
        name:'Security',
        list:[
          {name:'Login Audit'},
          {name:'Audit Trail'},
          {name:'Copy To Company'},
          {name:'Department'},
          {name:'Job Title'},
          {name:'Linked Job Department'},
          {name:'Employee'},
          {name:'IP Configuration'},
          {name:'Manage User Access'},
          {name:'Request To Login'},
          {name:'Site Links'},
          {name:'Site Modules'},
          {name:'UM Descision Security'},
          {name:'User'},
          {name:'User Master'},
          {name:'User Role(s)'}
        ]
      },
      {
        name:'Training Videos',
        list:[
            {name:'Provider Portal'}
        ]
      },
      {
        name:'Infratructure',
        list:[
          {name:'IT Dashboard[Beta]'}
        ]
      },
      {
        name:'Case Management',
        list:[
          {name:'Case Management Workflow'},
          {name:'New Referral Submission'},
          {name:'Referral Search'},
          {name:'New Case Submission'},
          {name:'Case Search'},
          {name:'Task Dashboard'},
          {name:'Care Plan Template'}
        ]
      },
      {
        name:'Documents',
        list:[
          {name:'Provider Manual'},
          {name:'Security Policies and Security Incident Reporting Procedure'},
          {name:'HPIPA Fraud,Waste and Abuse Reporting'}
        ]
      },
      {
        name:'Letter Template',
        list:[
          {name:'Create Template'},
          {name:'Template Maping'},
          {name:'Letter Dashboard'},
          {name:'Batch Printing'},
          {name:'Letter Trail'}
        ]
      },
      {
        name:'Webinar Videos',
        list:[ 
        ]
      }
    ]
   }
}
