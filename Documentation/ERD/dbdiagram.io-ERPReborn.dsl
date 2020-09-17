TABLE "SchSysConfig.TblAppObject_AuthorizationSequence"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Owner_RefID" bigint
    "BusinessDocumentType_RefID" bigint
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."BusinessDocumentType_RefID" > "SchMaster.TblBusinessDocument"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."BusinessDocumentType_RefID" > "SchMaster.TblBusinessDocument"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Owner_RefID" > "SchHumanResource.TblOrganizationalDepartment"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Owner_RefID" > "SchHumanResource.TblOrganizationalDepartment"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Owner_RefID" > "SchProject.TblProject"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequence"."Owner_RefID" > "SchProject.TblProject"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(64)
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "AuthorizationSequenceVersion_RefID" bigint
    "PreviousAuthorizationSequenceNode_RefID" bigint
    "NextAuthorizationSequenceNode_RefID" bigint
    "PreviousVersionAuthorizationSequenceEdge_RefID" bigint
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."AuthorizationSequenceVersion_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."AuthorizationSequenceVersion_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."PreviousAuthorizationSequenceNode_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."PreviousAuthorizationSequenceNode_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."NextAuthorizationSequenceNode_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."NextAuthorizationSequenceNode_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."PreviousVersionAuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."PreviousVersionAuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "AuthorizationSequenceEdge_RefID" bigint
    "User_RefID" bigint
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."AuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."AuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMember"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(64)
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceEdgeMemberType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceNode"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "AuthorizationSequence_RefID" bigint
    "AuthorizationSequenceNodeType_RefID" bigint
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."AuthorizationSequence_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."AuthorizationSequence_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."AuthorizationSequenceNodeType_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNode"."AuthorizationSequenceNodeType_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(64)
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceNodeType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "AuthorizationSequence_RefID" bigint
    "Version" smallint
    }
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."AuthorizationSequence_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_AuthorizationSequenceVersion"."AuthorizationSequence_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequence"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_InstitutionBranch"
    {
    "Sys_PID" bigint 
    "Sys_SID" bigint 
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint 
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint 
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint 
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint 
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint 
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint 
    "Sys_Branch_RefID" bigint 
    "Sys_DataIntegrityShadow" varchar(32)
    "AppObject_InstitutionRegional_RefID" bigint 
    "Name" varchar(128)
    }
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."AppObject_InstitutionRegional_RefID" > "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionBranch"."AppObject_InstitutionRegional_RefID" > "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_InstitutionCompany"
    {
    "Sys_PID" bigint 
    "Sys_SID" bigint 
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint 
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint 
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint 
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint 
    "Sys_Data_Hidden_DateTimeTZ" timestamtz
    "Sys_Data_Authentication_LoginSession_RefID" bigint 
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint 
    "Sys_Branch_RefID" bigint 
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(128)
    }
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_InstitutionRegional"
    {
    "Sys_PID" bigint 
    "Sys_SID" bigint 
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint 
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint 
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint 
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint 
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint 
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint 
    "Sys_Branch_RefID" bigint 
    "Sys_DataIntegrityShadow" varchar(32)
    "AppObject_InstitutionCompany_RefID" bigint 
    "Name" varchar(128)
    }
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."AppObject_InstitutionCompany_RefID" > "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_InstitutionRegional"."AppObject_InstitutionCompany_RefID" > "SchSysConfig.TblAppObject_InstitutionCompany"."Sys_SID"



TABLE "SchSysConfig.TblAppObject_UserRole"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(256)
    }
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblAppObject_UserRole"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar(32)"
    "Partition_RemovableRecord_Parameter_RefID" bigint
    "Key" "varchar(128)"
    }
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Partition_RemovableRecord_Parameter_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Partition_RemovableRecord_Parameter_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_SID"



TABLE "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar(32)"
    "Parameter" "varchar(128)"
    }
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblDBObject_Schema"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar(32)"
    "Name" "varchar(128)"
    }
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Schema"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



Table "SchSysConfig.TblDBObject_Table" 
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar(32)"
    "Schema_RefID" bigint
    "Name" "varchar(128)"
    "Partition_RemovableRecord_Parameter_RefID" bigint
    }
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Schema_RefID" > "SchSysConfig.TblDBObject_Schema"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Schema_RefID" > "SchSysConfig.TblDBObject_Schema"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_Table"."Partition_RemovableRecord_Parameter_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_Table"."Partition_RemovableRecord_Parameter_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Parameter"."Sys_SID"



TABLE "SchSysConfig.TblDBObject_User"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar(32)"
    "PersonName" "varchar(256)"
    "UserName" "varchar(128)"
    "EncryptedPassword" bytea
    "PasswordShadow" "varchar(32)"
    }
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblDBObject_User"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblLDAPObject_User"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "UserID" varchar(128)
    "UserName" varchar(256)
    }
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblLDAPObject_User"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchSysConfig.TblLog_UserLoginSession"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" "varchar(1024)"
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" "varchar"
    "User_RefID" bigint
    "APIWebToken" "varchar"
    "OptionsList" json
    "Branch_RefID" bigint
    "UserRole_RefID" bigint
    "SessionStartDateTimeTZ" timestamptz
    "SessionFinishDateTimeTZ" timestamptz
    "SessionAutoStartDateTimeTZ" timestamptz
    "SessionAutoFinishDateTimeTZ" timestamptz
    }
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_SID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."UserRole_RefID" > "SchSysConfig.TblAppObject_UserRole"."Sys_PID"
Ref: "SchSysConfig.TblLog_UserLoginSession"."UserRole_RefID" > "SchSysConfig.TblAppObject_UserRole"."Sys_SID"



TABLE "SchSysConfig.TblMapper_LDAPUserToPerson"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "LDAPUser_RefID" bigint
    "Person_RefID" bigint
    }
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."LDAPUser_RefID" > "SchSysConfig.TblLDAPObject_User"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."LDAPUser_RefID" > "SchSysConfig.TblLDAPObject_User"."Sys_SID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Person_RefID" > "SchMaster.TblPerson"."Sys_PID"
Ref: "SchSysConfig.TblMapper_LDAPUserToPerson"."Person_RefID" > "SchMaster.TblPerson"."Sys_SID"



TABLE "SchSysConfig.TblMapper_UserToLDAPUser"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "User_RefID" bigint
    "LDAPUserID" varchar(256)
    "EncryptedPassword" bytea
    "PasswordShadow" varchar(32)
    }
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."LDAPUserID" > "SchSysConfig.TblLDAPObject_User"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToLDAPUser"."LDAPUserID" > "SchSysConfig.TblLDAPObject_User"."Sys_SID"



TABLE "SchSysConfig.TblMapper_UserToUserRole"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "User_RefID" bigint
    "UserRole_RefID" bigint
    "CallProjectSyntax" varchar(256)
    "ValidStartDateTimeTZ" timestamptz
    "ValidFinishDateTimeTZ" timestamptz
    }
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_SID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."UserRole_RefID" > "SchSysConfig.TblAppObject_UserRole"."Sys_PID"
Ref: "SchSysConfig.TblMapper_UserToUserRole"."UserRole_RefID" > "SchSysConfig.TblAppObject_UserRole"."Sys_SID"



TABLE "SchHumanResource.TblOrganizationalDepartment"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(256)
    "ValidStartDateTimeTZ" timestamptz
    "ValidFinishDateTimeTZ" timestamptz
    }
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchHumanResource.TblOrganizationalDepartment"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchMaster.TblBusinessDocument"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "SignDataAuthentication" boolean
    "BusinessDocumentType_RefID" bigint
    "DocumentNumber" varchar(32)
    }
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblBusinessDocument"."BusinessDocumentType_RefID" > "SchMaster.TblBusinessDocumentType"."Sys_PID"
Ref: "SchMaster.TblBusinessDocument"."BusinessDocumentType_RefID" > "SchMaster.TblBusinessDocumentType"."Sys_SID"



TABLE "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "BusinessDocumentVersion_RefID" bigint
    "AuthorizationSequenceEdge_RefID" bigint
    }
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."BusinessDocumentVersion_RefID" > "SchMaster.TblBusinessDocumentVersion"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."BusinessDocumentVersion_RefID" > "SchMaster.TblBusinessDocumentVersion"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."AuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationCurrentStage"."AuthorizationSequenceEdge_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceEdge"."Sys_SID"



TABLE "SchMaster.TblBusinessDocumentAuthorizationHistory"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "BusinessDocumentVersion_RefID" bigint
    "User_RefID" bigint
    "AuthorizationSequenceActionType_RefID" bigint
    }
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."BusinessDocumentVersion_RefID" > "SchMaster.TblBusinessDocumentVersion"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."BusinessDocumentVersion_RefID" > "SchMaster.TblBusinessDocumentVersion"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."User_RefID" > "SchSysConfig.TblDBObject_User"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."AuthorizationSequenceActionType_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentAuthorizationHistory"."AuthorizationSequenceActionType_RefID" > "SchSysConfig.TblAppObject_AuthorizationSequenceActionType"."Sys_SID"



TABLE "SchMaster.TblBusinessDocumentType"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "SignDataAuthentication" boolean
    "Name" varchar(256)
    }
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentType"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchMaster.TblBusinessDocumentVersion"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "SignDataAuthentication" boolean
    "BusinessDocument_RefID" bigint
    "Version" smallint
    "DocumentDateTimeTZ" timestamptz
    "Annotation" varchar(2048)
    "DocumentOwner_RefID" bigint
    }
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."BusinessDocument_RefID" > "SchMaster.TblBusinessDocument"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."BusinessDocument_RefID" > "SchMaster.TblBusinessDocument"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."DocumentOwner_RefID" > "SchHumanResource.TblOrganizationalDepartment"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."DocumentOwner_RefID" > "SchHumanResource.TblOrganizationalDepartment"."Sys_SID"
Ref: "SchMaster.TblBusinessDocumentVersion"."DocumentOwner_RefID" > "SchProject.TblProject"."Sys_PID"
Ref: "SchMaster.TblBusinessDocumentVersion"."DocumentOwner_RefID" > "SchProject.TblProject"."Sys_SID"


TABLE "SchMaster.TblCountry"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "InternationalName" varchar(256)
    "IndonesianName" varchar(256)
    }
Ref: "SchMaster.TblCountry"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblCountry"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblCountry"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchMaster.TblCountryAdministrativeAreaLevel1"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Country_RefID" bigint
    "Name" varchar(256)
    }
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Country_RefID" > "SchMaster.TblCountry"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel1"."Country_RefID" > "SchMaster.TblCountry"."Sys_SID"



TABLE "SchMaster.TblCountryAdministrativeAreaLevel2"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "CountryAdministrativeAreaLevel1_RefID" bigint
    "Name" varchar(256)
    }
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."CountryAdministrativeAreaLevel1_RefID" > "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel2"."CountryAdministrativeAreaLevel1_RefID" > "SchMaster.TblCountryAdministrativeAreaLevel1"."Sys_SID"



TABLE "SchMaster.TblCountryAdministrativeAreaLevel3"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "CountryAdministrativeAreaLevel2_RefID" bigint
    "Name" varchar(256)
    }
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."CountryAdministrativeAreaLevel2_RefID" > "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel3"."CountryAdministrativeAreaLevel2_RefID" > "SchMaster.TblCountryAdministrativeAreaLevel2"."Sys_SID"



TABLE "SchMaster.TblCountryAdministrativeAreaLevel4"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "CountryAdministrativeAreaLevel3_RefID" bigint
    "Name" varchar(256)
    }
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblCountryAdministrativeAreaLevel4"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchMaster.TblPerson"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "Name" varchar(256)
    "Photo_RefID" bigint
    }
Ref: "SchMaster.TblPerson"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchMaster.TblPerson"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchMaster.TblPerson"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchProject.TblProject"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "SignDataAuthentication" boolean
    "Code" varchar(32)
    "Name" varchar(256)
    "ValidStartDate" date
    "ValidFinishDate" date
    "Customer_RefID" bigint
    }
Ref: "SchProject.TblProject"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchProject.TblProject"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchProject.TblProject"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"



TABLE "SchProject.TblProjectSection"
    {
    "Sys_PID" bigint
    "Sys_SID" bigint
    "Sys_RPK" bigint [pk]
    "Sys_Data_Annotation" varchar(1024)
    "Sys_Data_Entry_LoginSession_RefID" bigint
    "Sys_Data_Entry_DateTimeTZ" timestamptz
    "Sys_Data_Edit_LoginSession_RefID" bigint
    "Sys_Data_Edit_DateTimeTZ" timestamptz
    "Sys_Data_Delete_LoginSession_RefID" bigint
    "Sys_Data_Delete_DateTimeTZ" timestamptz
    "Sys_Data_Hidden_LoginSession_RefID" bigint
    "Sys_Data_Hidden_DateTimeTZ" timestamptz
    "Sys_Data_Authentication_LoginSession_RefID" bigint
    "Sys_Data_Authentication_DateTimeTZ" timestamptz
    "Sys_Partition_RemovableRecord_Key_RefID" bigint
    "Sys_Branch_RefID" bigint
    "Sys_DataIntegrityShadow" varchar(32)
    "SignDataAuthentication" boolean
    "Project_RefID" bigint
    "Name" varchar(256)
    }
Ref: "SchProject.TblProjectSection"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Entry_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Edit_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Delete_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Hidden_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Data_Authentication_LoginSession_RefID" > "SchSysConfig.TblLog_UserLoginSession"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Partition_RemovableRecord_Key_RefID" > "SchSysConfig.TblDBObject_Partition_RemovableRecord_Key"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Sys_Branch_RefID" > "SchSysConfig.TblAppObject_InstitutionBranch"."Sys_SID"
Ref: "SchProject.TblProjectSection"."Project_RefID" > "SchProject.TblProject"."Sys_PID"
Ref: "SchProject.TblProjectSection"."Project_RefID" > "SchProject.TblProject"."Sys_SID"
