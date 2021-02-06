export class BenefitMasterModel{
    public healthPlanCode:string;
    public employerGroup:string;
    public benefitCode:string;
    public description:string;
    public dateRange:DateRange;
    public lineOfbusiness:LineOfBusiness;
    public set:Set;
    public memberFamilyLimit:MemberFamilyLimit;
    public note:Note
}
export class Note{
    public note:string;
}
export class MemberFamilyLimit{
    public HMO:HMOint;
    public PPO:PPOint;
}
export class HMOint{
    public oopMaximumMember:string;
    public oopMaximumSubscriber:string;
    public deductableForMember:string;
    public deductableForSubscriber:string;
}
export class PPOint{
    public inoopMaximumMember:string;
    public inoopMaximumSubscriber:string;
    public indeductableForMember:string;
    public indeductableForSubscriber:string;
    public outoopMaximumMember:string;
    public outoopMaximumSubscriber:string;
    public outoopdeductableMember:string;
    public outoopdeductableSubscriber:string;
    public oopMaximumCombinedMember:string;
    public oopMaximumCombinedSubscriber:string;
    public deductableCombinedMember:string;
    public deductableCombinedSubscriber:string;
}
export class DateRange{
    public effectiveFromDate:Date;
    public toDate:Date;
    public accumuilation:string
}
export class LineOfBusiness{
    public lineOfbusiness:string
}
export class Set{
    public financialResponsibility:string
}