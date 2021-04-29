import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormArray } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { weblink } from 'src/app/raw/defaultdata';

@Component({
  selector: 'app-claim-view',
  templateUrl: './claim-view.component.html',
  styleUrls: ['./claim-view.component.css']
})
export class ClaimViewComponent implements OnInit {
  claimsGroup:FormGroup;
  constructor(private activeRoute:ActivatedRoute,private comm:ApicontactService) {
      this.activeRoute.queryParams.subscribe(data=>{
        comm.getClaimsData(data["claimid"]).subscribe(r=>{
          console.log(r[0])
          for(var srv in r[0].servicelines){
            (<FormArray>this.claimsGroup.get("servicelines")).push(new FormGroup({
              'ClmSrvid':new FormControl(),
              'SrvFrmdt':new FormControl(),
              'SrvTodt':new FormControl(),
              'Pos':new FormControl(),
              'ProcCode':new FormControl(),
              'Modfi1':new FormControl(),
              'Modfi2':new FormControl(),
              'Modfi3':new FormControl(),
              'Modfi4':new FormControl(),
              'DiaPoint1':new FormControl(),
              'DiaPoint2':new FormControl(),
              'DiaPoint3':new FormControl(),
              'DiaPoint4':new FormControl(),
              'BilledCharg':new FormControl(),
              'UnitType':new FormControl(),
              'Quantity':new FormControl(),
              'Emg':new FormControl(),
              'EPSDT':new FormControl(),
              'FamPlan':new FormControl(),
              'NDC':new FormControl()
            }))
          }
          this.claimsGroup.setValue(r[0]);
        })
      })
   }

  ngOnInit(): void {
    this.claimsGroup=new FormGroup({
      'claimid':new FormControl(),
      'Fileid':new FormControl(),
      'PatientLast':new FormControl(),
      'PatientFirst':new FormControl(),
      'PatientGender':new FormControl(),
      'PatientDob':new FormControl(),
      'OtherPatientId':new FormControl(),
      'PatientDateOfDeath':new FormControl(),
      'SubscriberHealthPlan':new FormControl(),
      'SubscriberHealthPlanID':new FormControl(),
      'SubscriberLast':new FormControl(),
      'SubscriberFirst':new FormControl(),
      'SubscriberGender':new FormControl(),
      'SubscriberDOB':new FormControl(),
      'MemberID':new FormControl(),
      'ExtAuthRef':new FormControl(),
      'SubscriberGroupName':new FormControl(),
      'SubscriberGroup':new FormControl(),
      'Auth':new FormControl(),
      'PatRel':new FormControl(),
      'BillProvLast':new FormControl(),
      'BillProvFirst':new FormControl(),
      'BillingProvId':new FormControl(),
      'BillingProvAddres1':new FormControl(),
      'BillingProvAddres2':new FormControl(),
      'BillingProvCity':new FormControl(),
      'BillingProvStat':new FormControl(),
      'BillingProvZip':new FormControl(),
      'BillingProviderNpi':new FormControl(),
      'BillingProvTaxid':new FormControl(),
      'PtoAisOrgInd':new FormControl(),
      'PtoALast':new FormControl(),
      'PtoAFirst':new FormControl(),
      'PtoAAddress1':new FormControl(),
      'PtoAAddress2':new FormControl(),
      'PtoAAdressCity':new FormControl(),
      'PtoAAdressStat':new FormControl(),
      'PtoAAdressZip':new FormControl(),
      'RendProvLast':new FormControl(),
      'RendProvFirst':new FormControl(),
      'RendProvNpi':new FormControl(),
      'RendProvOth':new FormControl(),
      'RefProvLast':new FormControl(),
      'RefProvFirst':new FormControl(),
      'RefProvNpi':new FormControl(),
      'RefProvNpiOth':new FormControl(),
      'FacilityType':new FormControl(),
      'FacilityOrganizationName':new FormControl(),
      'FacilityAddress1':new FormControl(),
      'FacilityAddress2':new FormControl(),
      'FacilityCity':new FormControl(),
      'FacilityState':new FormControl(),
      'FacilityZip':new FormControl(),
      'FacilityNPI':new FormControl(),
      'FacilityOthProvID':new FormControl(),
      'GenralPatAccuntNo':new FormControl(),
      'GenralClaimFreq':new FormControl(),
      'GenralOriginalRef':new FormControl(),
      'GenralOriginalClaim':new FormControl(),
      'AnotherPartyResponsible':new FormControl(),
      'EmpRelated':new FormControl(),
      'OthAcc':new FormControl(),
      'AutoAcc':new FormControl(),
      'AccidentDate':new FormControl(),
      'GenralState':new FormControl(),
      'GenralCountry':new FormControl(),
      'LastSeenDate':new FormControl(),
      'DischargeDate':new FormControl(),
      'IllnessDate':new FormControl(),
      'LastWorkedDate':new FormControl(),
      'ReturnToWorkDate':new FormControl(),
      'AdmissionDate':new FormControl(),
      'SimilarSymptomsDate':new FormControl(),
      'RecevedDate':new FormControl(),
      'DiagCode1':new FormControl(),
      'DiagCode2':new FormControl(),
      'DiagCode3':new FormControl(),
      'DiagCode4':new FormControl(),
      'DiagCode5':new FormControl(),
      'DiagCode6':new FormControl(),
      'DiagCode7':new FormControl(),
      'DiagCode8':new FormControl(),
      'DiagCode9':new FormControl(),
      'DiagCode10':new FormControl(),
      'DiagCode11':new FormControl(),
      'DiagCode12':new FormControl(),
      'AmbPatWeight':new FormControl(),
      'ReasonCode':new FormControl(),
      'TransportDistance':new FormControl(),
      'POS':new FormControl(),
      'AmbPikAdd1':new FormControl(),
      'AmbPikAdd2':new FormControl(),
      'AmbPikCity':new FormControl(),
      'AmbPikSt':new FormControl(),
      'AmbPikZip':new FormControl(),
      'TotalChrg':new FormControl(),
      'PatPaid':new FormControl(),
      'PayerPaidAmt':new FormControl(),
      'AmbDrpAdd1':new FormControl(),
      'AmbDrpAdd2':new FormControl(),
      'AmbDrpCity':new FormControl(),
      'AmbDrpSt':new FormControl(),
      'AmbDrpZip':new FormControl(),
      'servicelines':new FormArray([])
    })
  }
  SearchMember(){
    const win=window.open(weblink+"searchmember","_blank","width:100;height:100");
  }
  close(){
    window.close();
  }

}
