--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

-- Started on 2021-10-13 22:57:00 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 350363)
-- Name: SchSysConfig; Type: SCHEMA; Schema: -; Owner: SysEngine
--

CREATE SCHEMA "SchSysConfig";


ALTER SCHEMA "SchSysConfig" OWNER TO "SysEngine";

--
-- TOC entry 6 (class 2615 OID 350364)
-- Name: SchSystem; Type: SCHEMA; Schema: -; Owner: SysEngine
--

CREATE SCHEMA "SchSystem";


ALTER SCHEMA "SchSystem" OWNER TO "SysEngine";

--
-- TOC entry 2 (class 3079 OID 350365)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- TOC entry 1238 (class 1247 OID 350413)
-- Name: HoldFuncSys_General_FeedBackQuery; Type: TYPE; Schema: SchSystem; Owner: SysEngine
--

CREATE TYPE "SchSystem"."HoldFuncSys_General_FeedBackQuery" AS (
	"SignSuccess" smallint,
	"SignRecordType" character varying,
	"SignRecordID" bigint,
	"SignMessage" character varying
);


ALTER TYPE "SchSystem"."HoldFuncSys_General_FeedBackQuery" OWNER TO "SysEngine";

--
-- TOC entry 550 (class 1255 OID 350414)
-- Name: Func_TblAppObject_AuthorizationSequenceActionType_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceActionType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceActionType"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceActionType_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceActionType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 559 (class 1255 OID 350415)
-- Name: Func_TblAppObject_AuthorizationSequenceActionType_UPDATE(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceActionType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceActionType"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceActionType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 560 (class 1255 OID 350416)
-- Name: Func_TblAppObject_AuthorizationSequenceEdgeMemberType_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMemberType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMemberType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 561 (class 1255 OID 350417)
-- Name: Func_TblAppObject_AuthorizationSequenceEdgeMemberType_UPDATE(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMemberType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMemberType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 562 (class 1255 OID 350418)
-- Name: Func_TblAppObject_AuthorizationSequenceEdgeMember_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMember_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequenceEdge_RefID			ALIAS FOR $6;
	varUser_RefID								ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AuthorizationSequenceEdge_RefID",
    		"User_RefID"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAuthorizationSequenceEdge_RefID,
    		varUser_RefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMember_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 563 (class 1255 OID 350419)
-- Name: Func_TblAppObject_AuthorizationSequenceEdgeMember_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMember_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequenceEdge_RefID			ALIAS FOR $6;
	varUser_RefID								ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AuthorizationSequenceEdge_RefID" = varAuthorizationSequenceEdge_RefID,
		"User_RefID" = varUser_RefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdgeMember_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 564 (class 1255 OID 350420)
-- Name: Func_TblAppObject_AuthorizationSequenceEdge_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdge_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation								ALIAS FOR $1;
	varIDSession										ALIAS FOR $2;
	varEntryDateTimeTZ									ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID				ALIAS FOR $4;
	varBranchRefID										ALIAS FOR $5;

	varAuthorizationSequenceVersion_RefID				ALIAS FOR $6;
	varPreviousAuthorizationSequenceNode_RefID			ALIAS FOR $7;
	varNextAuthorizationSequenceNode_RefID				ALIAS FOR $8;
	varPreviousVersionAuthorizationSequenceEdge_RefID	ALIAS FOR $9;
	
	varRecSetOutput										"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdge"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AuthorizationSequenceVersion_RefID",
    		"PreviousAuthorizationSequenceNode_RefID",
			"NextAuthorizationSequenceNode_RefID",
			"PreviousVersionAuthorizationSequenceEdge_RefID"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAuthorizationSequenceVersion_RefID,
    		varPreviousAuthorizationSequenceNode_RefID,
			varNextAuthorizationSequenceNode_RefID,
			varPreviousVersionAuthorizationSequenceEdge_RefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdge_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdge_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 565 (class 1255 OID 350421)
-- Name: Func_TblAppObject_AuthorizationSequenceEdge_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdge_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID												ALIAS FOR $1;
	varIDSession										ALIAS FOR $2;
	varEditDateTimeTZ									ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID				ALIAS FOR $4;
	varBranchRefID										ALIAS FOR $5;

	varAuthorizationSequenceVersion_RefID				ALIAS FOR $6;
	varPreviousAuthorizationSequenceNode_RefID			ALIAS FOR $7;
	varNextAuthorizationSequenceNode_RefID				ALIAS FOR $8;
	varPreviousVersionAuthorizationSequenceEdge_RefID	ALIAS FOR $9;

	varRecSetOutput										"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceEdge"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AuthorizationSequenceVersion_RefID" = varAuthorizationSequenceVersion_RefID,
		"PreviousAuthorizationSequenceNode_RefID" = varPreviousAuthorizationSequenceNode_RefID,
		"NextAuthorizationSequenceNode_RefID" = varNextAuthorizationSequenceNode_RefID,
		"PreviousVersionAuthorizationSequenceEdge_RefID" = varPreviousVersionAuthorizationSequenceEdge_RefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceEdge_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 566 (class 1255 OID 350422)
-- Name: Func_TblAppObject_AuthorizationSequenceNodeType_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNodeType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNodeType_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 567 (class 1255 OID 350423)
-- Name: Func_TblAppObject_AuthorizationSequenceNodeType_UPDATE(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNodeType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNodeType_UPDATE"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 568 (class 1255 OID 350424)
-- Name: Func_TblAppObject_AuthorizationSequenceNode_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNode_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequence_RefID				ALIAS FOR $6;
	varAuthorizationSequenceNodeType_RefID		ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceNode"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AuthorizationSequence_RefID",
    		"AuthorizationSequenceNodeType_RefID"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAuthorizationSequence_RefID,
    		varAuthorizationSequenceNodeType_RefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceNode_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNode_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 569 (class 1255 OID 350425)
-- Name: Func_TblAppObject_AuthorizationSequenceNode_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNode_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequence_RefID 				ALIAS FOR $6;
	varAuthorizationSequenceNodeType_RefID 		ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceNode"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AuthorizationSequence_RefID" = varAuthorizationSequence_RefID,
		"AuthorizationSequenceNodeType_RefID" = varAuthorizationSequenceNodeType_RefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceNode" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceNode_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 570 (class 1255 OID 350426)
-- Name: Func_TblAppObject_AuthorizationSequenceVersion_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, smallint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceVersion_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, smallint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequence_RefID				ALIAS FOR $6;
	varVersion			 						ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequenceVersion"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AuthorizationSequence_RefID",
    		"Version"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAuthorizationSequence_RefID,
    		varVersion
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequenceVersion_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceVersion_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, smallint) OWNER TO "SysEngine";

--
-- TOC entry 571 (class 1255 OID 350427)
-- Name: Func_TblAppObject_AuthorizationSequenceVersion_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, smallint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceVersion_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, smallint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAuthorizationSequence_RefID 				ALIAS FOR $6;
	varVersion 									ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequenceVersion"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AuthorizationSequence_RefID" = varAuthorizationSequence_RefID,
		"Version" = varVersion
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequenceVersion_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, smallint) OWNER TO "SysEngine";

--
-- TOC entry 573 (class 1255 OID 350428)
-- Name: Func_TblAppObject_AuthorizationSequence_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequence_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varOwner_RefID 								ALIAS FOR $6;
	varBusinessDocumentType_RefID 				ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_AuthorizationSequence"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Owner_RefID",
    		"BusinessDocumentType_RefID"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varOwner_RefID,
    		varBusinessDocumentType_RefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_AuthorizationSequence_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequence_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 574 (class 1255 OID 350429)
-- Name: Func_TblAppObject_AuthorizationSequence_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequence_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varOwner_RefID 								ALIAS FOR $6;
	varBusinessDocumentType_RefID 				ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_AuthorizationSequence"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Owner_RefID" = varOwner_RefID,
		"BusinessDocumentType_RefID" = varBusinessDocumentType_RefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_AuthorizationSequence" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_AuthorizationSequence_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 575 (class 1255 OID 350430)
-- Name: Func_TblAppObject_InstitutionBranch_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionBranch_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAppObject_InstitutionRegional_RefID		ALIAS FOR $6;
	varName										ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_InstitutionBranch"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AppObject_InstitutionRegional_RefID",
			"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAppObject_InstitutionRegional_RefID,
			varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_InstitutionBranch_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionBranch_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 576 (class 1255 OID 350431)
-- Name: Func_TblAppObject_InstitutionBranch_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionBranch_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAppObject_InstitutionRegional_RefID		ALIAS FOR $6;
	varName										ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_InstitutionBranch"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AppObject_InstitutionRegional_RefID" = AppObject_InstitutionRegional_RefID,
		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_InstitutionBranch" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionBranch_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 577 (class 1255 OID 350432)
-- Name: Func_TblAppObject_InstitutionCompany_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionCompany_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_InstitutionCompany"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_InstitutionCompany_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionCompany_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 578 (class 1255 OID 350433)
-- Name: Func_TblAppObject_InstitutionCompany_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionCompany_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_InstitutionCompany"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_InstitutionCompany" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionCompany_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 579 (class 1255 OID 350434)
-- Name: Func_TblAppObject_InstitutionRegional_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionRegional_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAppObject_InstitutionCompany_RefID		ALIAS FOR $6;
	varName										ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_InstitutionRegional"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"AppObject_InstitutionCompany_RefID",
			"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

    		varAppObject_InstitutionCompany_RefID,
			varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_InstitutionRegional_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionRegional_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 580 (class 1255 OID 350435)
-- Name: Func_TblAppObject_InstitutionRegional_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionRegional_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varAppObject_InstitutionCompany_RefID		ALIAS FOR $6;
	varName										ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_InstitutionRegional"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"AppObject_InstitutionCompany_RefID" = AppObject_InstitutionCompany_RefID,
		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_InstitutionRegional" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_InstitutionRegional_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 581 (class 1255 OID 350436)
-- Name: Func_TblAppObject_Menu_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_Menu_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varParentNode_RefID							ALIAS FOR $6;
	varCode										ALIAS FOR $7;
	varCaption									ALIAS FOR $8;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_Menu"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"ParentNode_RefID",
			"Code",
			"Caption"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varParentNode_RefID,
			varCode,
			varCaption
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_Menu_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_Menu_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 582 (class 1255 OID 350437)
-- Name: Func_TblAppObject_Menu_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_Menu_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varParentNode_RefID							ALIAS FOR $6;
	varCode										ALIAS FOR $7;
	varCaption									ALIAS FOR $8;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_Menu"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"ParentNode_RefID" = varParentNode_RefID,
		"Code" = varCode,
		"Caption" = varCaption
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_Menu" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_Menu_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 583 (class 1255 OID 350438)
-- Name: Func_TblAppObject_ModuleReport_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_ModuleReport_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varIDSession								ALIAS FOR $1;
	varEntryDateTimeTZ							ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $3;
	varBranchRefID								ALIAS FOR $4;
	
	varAppObject_Module_RefID					ALIAS FOR $5;
	varName										ALIAS FOR $6;
	varTitle									ALIAS FOR $7;
	varURLSegment								ALIAS FOR $8;
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_ModuleReport"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
    		"AppObject_Module_RefID",
    		"Name",
    		"Title",
			"URLSegment"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
    		varAppObject_Module_RefID,
    		varName,
    		varTitle,
			varURLSegment
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_ModuleReport_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_ModuleReport_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, character varying, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 584 (class 1255 OID 350439)
-- Name: Func_TblAppObject_Module_INSERT(bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_Module_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$

DECLARE
	varIDSession								ALIAS FOR $1;
	varEntryDateTimeTZ							ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $3;
	varBranchRefID								ALIAS FOR $4;
	
	varName										ALIAS FOR $5;
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_Module"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"Name"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_Module_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_Module_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 585 (class 1255 OID 350440)
-- Name: Func_TblAppObject_UserRoleDelegation_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRoleDelegation_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varSourceMapper_UserToLUserRole_RefID 		ALIAS FOR $6;
	varDestinationUser_RefID 					ALIAS FOR $7;
	varSignMutualExclusive 						ALIAS FOR $8;
	varValidStartDateTimeTZ						ALIAS FOR $9;
	varValidFinishDateTimeTZ					ALIAS FOR $10;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_UserRoleDelegation"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"SourceMapper_UserToLUserRole_RefID", 
			"DestinationUser_RefID", 
			"SignMutualExclusive", 
			"ValidStartDateTimeTZ", 
			"ValidFinishDateTimeTZ"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varSourceMapper_UserToLUserRole_RefID,
			varDestinationUser_RefID,
			varSignMutualExclusive,
			varValidStartDateTimeTZ,
			varValidFinishDateTimeTZ
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_UserRoleDelegation_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRoleDelegation_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 586 (class 1255 OID 350441)
-- Name: Func_TblAppObject_UserRoleDelegation_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRoleDelegation_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varSourceMapper_UserToLUserRole_RefID 		ALIAS FOR $6;
	varDestinationUser_RefID 					ALIAS FOR $7;
	varSignMutualExclusive 						ALIAS FOR $8;
	varValidStartDateTimeTZ 					ALIAS FOR $9;
	varValidFinishDateTimeTZ 					ALIAS FOR $10;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_UserRoleDelegation"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"SourceMapper_UserToLUserRole_RefID" = varSourceMapper_UserToLUserRole_RefID, 
		"DestinationUser_RefID" = varDestinationUser_RefID, 
		"SignMutualExclusive" = varSignMutualExclusive, 
		"ValidStartDateTimeTZ" = varValidStartDateTimeTZ, 
		"ValidFinishDateTimeTZ" = varValidFinishDateTimeTZ
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_UserRoleDelegation" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRoleDelegation_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, boolean, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 587 (class 1255 OID 350442)
-- Name: Func_TblAppObject_UserRolePrivilegesMenu_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRolePrivilegesMenu_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varUserRole_RefID							ALIAS FOR $6;
	varCallMenuSyntax							ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_UserRolePrivilegesMenu"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"UserRole_RefID",
			"CallMenuSyntax"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varUserRole_RefID,
			varCallMenuSyntax
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_UserRolePrivilegesMenu_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRolePrivilegesMenu_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 588 (class 1255 OID 350443)
-- Name: Func_TblAppObject_UserRolePrivilegesMenu_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRolePrivilegesMenu_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varUserRole_RefID							ALIAS FOR $6;
	varCallMenuSyntax							ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_UserRolePrivilegesMenu"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"UserRole_RefID" = varUserRole_RefID,
		"CallMenuSyntax" =  varCallMenuSyntax
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRolePrivilegesMenu_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 589 (class 1255 OID 350444)
-- Name: Func_TblAppObject_UserRole_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRole_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblAppObject_UserRole"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblAppObject_UserRole_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRole_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 572 (class 1255 OID 350445)
-- Name: Func_TblAppObject_UserRole_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblAppObject_UserRole_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblAppObject_UserRole"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblAppObject_UserRole" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblAppObject_UserRole_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 590 (class 1255 OID 350446)
-- Name: Func_TblDBObject_ForeignObject_INSERT(bigint, timestamp with time zone, bigint, inet, integer, character varying, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_ForeignObject_INSERT"(bigint, timestamp with time zone, bigint, inet, integer, character varying, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
   varIDSession				ALIAS FOR $1;
   varEntryDateTimeTZ		ALIAS FOR $2;
   varBranchRefID			ALIAS FOR $3;
   varForeignDatabaseHost	ALIAS FOR $4;
   varForeignDatabasePort	ALIAS FOR $5;
   varForeignDatabaseName	ALIAS FOR $6;
   varForeignSchema			ALIAS FOR $7;
   varForeignTable			ALIAS FOR $8;
   varRecSetOutput			"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
   INSERT INTO 
      "SchSysConfig"."TblDBObject_ForeignObject"
         (
         "Sys_Data_Entry_LoginSession_RefID",
         "Sys_Data_Entry_DateTimeTZ",
         "Sys_Branch_RefID",
         "ForeignDatabaseHost",
         "ForeignDatabasePort",
         "ForeignDatabaseName",
         "ForeignSchema",
         "ForeignTable"
         )
      VALUES
         (
         varIDSession,
         varEntryDateTimeTZ,
         varBranchRefID,
         varForeignDatabaseHost,
         varForeignDatabasePort,
         varForeignDatabaseName,
         varForeignSchema,
         varForeignTable
         );

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_ForeignObject_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_ForeignObject_INSERT"(bigint, timestamp with time zone, bigint, inet, integer, character varying, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 591 (class 1255 OID 350447)
-- Name: Func_TblDBObject_Partition_RemovableRecord_Key_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Key_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation							ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEntryDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varPartition_RemovableRecord_Parameter_RefID	ALIAS FOR $6;
	varKey											ALIAS FOR $7;
	
	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"Partition_RemovableRecord_Parameter_RefID",
			"Key"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varPartition_RemovableRecord_Parameter_RefID,
			varKey
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Key_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 592 (class 1255 OID 350448)
-- Name: Func_TblDBObject_Partition_RemovableRecord_Key_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Key_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID											ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEditDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varPartition_RemovableRecord_Parameter_RefID	ALIAS FOR $6;
	varKey											ALIAS FOR $7;

	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Partition_RemovableRecord_Parameter_RefID" = varPartition_RemovableRecord_Parameter_RefID,
		"Key" = varKey
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Key_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 593 (class 1255 OID 350449)
-- Name: Func_TblDBObject_Partition_RemovableRecord_Parameter_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Parameter_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varParameter								ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"Parameter"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varParameter
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Parameter_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 594 (class 1255 OID 350450)
-- Name: Func_TblDBObject_Partition_RemovableRecord_Parameter_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Parameter_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varParameter								ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Parameter" = varParameter
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Partition_RemovableRecord_Parameter_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 595 (class 1255 OID 350451)
-- Name: Func_TblDBObject_Schema_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Schema_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblDBObject_Schema"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"Name"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Schema_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Schema_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 596 (class 1255 OID 350452)
-- Name: Func_TblDBObject_Schema_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Schema_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varName										ALIAS FOR $6;

	varRecSetOutput		"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblDBObject_Schema"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Name" = varName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblDBObject_Schema" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Schema_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 597 (class 1255 OID 350453)
-- Name: Func_TblDBObject_Table_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Table_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;
   
   varSchemaRefID   							ALIAS FOR $6;
   varTableName									ALIAS FOR $7;
   varPartitionRemovableRecordParameterRefID	ALIAS FOR $8;
   varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	PERFORM pg_advisory_lock(1234);
	INSERT INTO 
		"SchSysConfig"."TblDBObject_Table"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			 
			"Schema_RefID",
			"Name",
			"Partition_RemovableRecord_Parameter_RefID"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varSchemaRefID,
			varTableName,
			varPartitionRemovableRecordParameterRefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Table_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
	PERFORM pg_advisory_unlock(1234);
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Table_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint) OWNER TO "SysEngine";

--
-- TOC entry 598 (class 1255 OID 350454)
-- Name: Func_TblDBObject_Table_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_Table_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varSchemaRefID   							ALIAS FOR $6;
	varTableName								ALIAS FOR $7;
	varPartitionRemovableRecordParameterRefID	ALIAS FOR $8;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblDBObject_Table"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Schema_RefID" = varSchemaRefID,
		"Name" = varTableName,
		"Partition_RemovableRecord_Parameter_RefID" = varPartitionRemovableRecordParameterRefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblDBObject_Table" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_Table_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, bigint) OWNER TO "SysEngine";

--
-- TOC entry 599 (class 1255 OID 350455)
-- Name: Func_TblDBObject_User_INSERT(bigint, timestamp with time zone, bigint, character varying, character varying, bytea, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_User_INSERT"(bigint, timestamp with time zone, bigint, character varying, character varying, bytea, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
   varIDSession			ALIAS FOR $1;
   varEntryDateTimeTZ	ALIAS FOR $2;
   varBranchRefID		ALIAS FOR $3;
   varPersonName		ALIAS FOR $4;
   varUserName			ALIAS FOR $5;
   varEncryptedPassword	ALIAS FOR $6;	
   varPasswordShadow	ALIAS FOR $7;
   varRecSetOutput		"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
   INSERT INTO 
      "SchSysConfig"."TblDBObject_User"
         (
         "Sys_Data_Entry_LoginSession_RefID",
         "Sys_Data_Entry_DateTimeTZ",
         "Sys_Branch_RefID",
         "PersonName",
         "UserName",
         "EncryptedPassword",
         "PasswordShadow"
         )
      VALUES
         (
         varIDSession,
         varEntryDateTimeTZ,
         varBranchRefID,
         varPersonName,
         varUserName,
         varEncryptedPassword,
         varPasswordShadow
         );

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_User_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_User_INSERT"(bigint, timestamp with time zone, bigint, character varying, character varying, bytea, character varying) OWNER TO "SysEngine";

--
-- TOC entry 600 (class 1255 OID 350456)
-- Name: Func_TblDBObject_User_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_User_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation							ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEntryDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varPersonName									ALIAS FOR $6;
	varUserName										ALIAS FOR $7;
	varEncryptedPassword							ALIAS FOR $8;	
	varPasswordShadow								ALIAS FOR $9;
	
	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblDBObject_User"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"PersonName",
			"UserName",
			"EncryptedPassword",
			"PasswordShadow"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varPersonName,
			varUserName,
			varEncryptedPassword,
			varPasswordShadow
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_User_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_User_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying) OWNER TO "SysEngine";

--
-- TOC entry 601 (class 1255 OID 350457)
-- Name: Func_TblDBObject_User_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblDBObject_User_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID											ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEditDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varPersonName									ALIAS FOR $6;
	varUserName										ALIAS FOR $7;
	varEncryptedPassword							ALIAS FOR $8;	
	varPasswordShadow								ALIAS FOR $9;

	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblDBObject_User"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"PersonName" = varPersonName,
		"UserName" = varUserName,
		"EncryptedPassword" = varEncryptedPassword,
		"PasswordShadow" = varPasswordShadow
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblDBObject_User" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblDBObject_User_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying, bytea, character varying) OWNER TO "SysEngine";

--
-- TOC entry 602 (class 1255 OID 350458)
-- Name: Func_TblEmailDistribution_Recipient_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, smallint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblEmailDistribution_Recipient_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, smallint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varIDSession									ALIAS FOR $1;
	varEntryDateTimeTZ								ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $3;
	varBranchRefID									ALIAS FOR $4;
	
	varAppObject_ModuleReport_RefID					ALIAS FOR $5;
	varEmailAccount_RefID							ALIAS FOR $6;
	varScheduleTimeZone								ALIAS FOR $7;
	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblEmailDistribution_Recipient"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"AppObject_ModuleReport_RefID",
			"EmailAccount_RefID",
			"ScheduleTimeZone"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varAppObject_ModuleReport_RefID,
			varEmailAccount_RefID,
			varScheduleTimeZone
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblEmailDistribution_Recipient_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblEmailDistribution_Recipient_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, smallint) OWNER TO "SysEngine";

--
-- TOC entry 603 (class 1255 OID 350459)
-- Name: Func_TblEmailDistribution_Schedule_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, interval); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblEmailDistribution_Schedule_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, interval) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varIDSession									ALIAS FOR $1;
	varEntryDateTimeTZ								ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $3;
	varBranchRefID									ALIAS FOR $4;
	
	varAppObject_ModuleReport_RefID					ALIAS FOR $5;
	varPeriod_RefID									ALIAS FOR $6;
	varPeriodStartDateScheduleOffset				ALIAS FOR $7;
	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblEmailDistribution_Schedule"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"AppObject_ModuleReport_RefID",
			"Period_RefID",
    		"PeriodStartDateScheduleOffset"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varAppObject_ModuleReport_RefID,
			varPeriod_RefID,
    		varPeriodStartDateScheduleOffset
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblEmailDistribution_Schedule_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblEmailDistribution_Schedule_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, interval) OWNER TO "SysEngine";

--
-- TOC entry 604 (class 1255 OID 350460)
-- Name: Func_TblLDAPObject_User_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLDAPObject_User_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$

DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;
	
	varUserID									ALIAS FOR $6;
	varUserName									ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLDAPObject_User"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
				
			"UserID",
			"UserName"
			)
	  VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
				
			varUserID,
			varUserName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLDAPObject_User_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLDAPObject_User_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 605 (class 1255 OID 350461)
-- Name: Func_TblLDAPObject_User_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLDAPObject_User_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;
		
	varUserID									ALIAS FOR $6;
	varUserName									ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLDAPObject_User"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"UserID" = varUserID, 
		"UserName" = varUserName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLDAPObject_User" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLDAPObject_User_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 607 (class 1255 OID 350462)
-- Name: Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varTrigger_BusinessDocumentHistory_RefID	ALIAS FOR $6;
	varBusinessDocumentVersion_RefID			ALIAS FOR $7;
	varAuthorizationSequenceEdge_RefID			ALIAS FOR $8;
	varPath										ALIAS FOR $9;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

    		"Trigger_BusinessDocumentHistory_RefID",
			"BusinessDocumentVersion_RefID",
    		"AuthorizationSequenceEdge_RefID",
			"Path"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varTrigger_BusinessDocumentHistory_RefID,
    		varBusinessDocumentVersion_RefID,
    		varAuthorizationSequenceEdge_RefID,
			varPath
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]) OWNER TO "SysEngine";

--
-- TOC entry 608 (class 1255 OID 350463)
-- Name: Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varTrigger_BusinessDocumentHistory_RefID	ALIAS FOR $6;
	varBusinessDocumentVersion_RefID			ALIAS FOR $7;
	varAuthorizationSequenceEdge_RefID			ALIAS FOR $8;
	varPath										ALIAS FOR $9;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Trigger_BusinessDocumentHistory_RefID" = varTrigger_BusinessDocumentHistory_RefID,
		"BusinessDocumentVersion_RefID" = varBusinessDocumentVersion_RefID,
		"AuthorizationSequenceEdge_RefID" = varAuthorizationSequenceEdge_RefID,
		"Path" = varPath
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentCurrentStage_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint[]) OWNER TO "SysEngine";

--
-- TOC entry 609 (class 1255 OID 350464)
-- Name: Func_TblLog_AuthSeq_BusinessDocumentHistory_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentHistory_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varBusinessDocumentVersion_RefID			ALIAS FOR $6;
	varAuthorizationSequenceEdge_RefID			ALIAS FOR $7;
	varUser_RefID								ALIAS FOR $8;
	varAuthorizationSequenceActionType_RefID	ALIAS FOR $9;
	varElementaryData							ALIAS FOR $10;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"BusinessDocumentVersion_RefID",
			"AuthorizationSequenceEdge_RefID",
    		"User_RefID",
    		"AuthorizationSequenceActionType_RefID",
			"ElementaryData"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varBusinessDocumentVersion_RefID,
			varAuthorizationSequenceEdge_RefID,
    		varUser_RefID,
    		varAuthorizationSequenceActionType_RefID,
			varElementaryData
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentHistory_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json) OWNER TO "SysEngine";

--
-- TOC entry 610 (class 1255 OID 350465)
-- Name: Func_TblLog_AuthSeq_BusinessDocumentHistory_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentHistory_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varBusinessDocumentVersion_RefID			ALIAS FOR $6;
	varAuthorizationSequenceEdge_RefID			ALIAS FOR $7;
	varUser_RefID								ALIAS FOR $8;
	varAuthorizationSequenceActionType_RefID	ALIAS FOR $9;
	varElementaryData							ALIAS FOR $10;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"BusinessDocumentVersion_RefID" = varBusinessDocumentVersion_RefID,
		"varAuthorizationSequenceEdge_RefID" = varAuthorizationSequenceEdge_RefID,
		"User_RefID" = varUser_RefID,
		"AuthorizationSequenceActionType_RefID" = varAuthorizationSequenceActionType_RefID,
		"ElementaryData" = varElementaryData
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_AuthSeq_BusinessDocumentHistory_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, bigint, bigint, json) OWNER TO "SysEngine";

--
-- TOC entry 611 (class 1255 OID 350466)
-- Name: Func_TblLog_EmailDistributionScheduleAttachment_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_EmailDistributionScheduleAttachment_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$

DECLARE
	varIDSession									ALIAS FOR $1;
	varEntryDateTimeTZ								ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $3;
	varBranchRefID									ALIAS FOR $4;

	varLog_EmailDistributionScheduleRecipient_RefID	ALIAS FOR $5;
	varURLParameter									ALIAS FOR $6;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_EmailDistributionScheduleAttachment"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"Log_EmailDistributionScheduleRecipient_RefID",
			"URLParameter"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varLog_EmailDistributionScheduleRecipient_RefID,
			varURLParameter
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_EmailDistributionScheduleAttachment_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_EmailDistributionScheduleAttachment_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 612 (class 1255 OID 350467)
-- Name: Func_TblLog_EmailDistributionScheduleRecipient_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_EmailDistributionScheduleRecipient_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$

DECLARE
	varIDSession								ALIAS FOR $1;
	varEntryDateTimeTZ							ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $3;
	varBranchRefID								ALIAS FOR $4;

	varLog_EmailDistributionSchedule_RefID		ALIAS FOR $5;
	varEmailAccount_RefID						ALIAS FOR $6;
	varSendScheduleDateTimeTZ					ALIAS FOR $7;
	varSendExpiredScheduleDateTimeTZ			ALIAS FOR $8;
	varSendDateTimeTZ							ALIAS FOR $9;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_EmailDistributionScheduleRecipient"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"Log_EmailDistributionSchedule_RefID",
			"EmailAccount_RefID",
			"SendScheduleDateTimeTZ",
			"SendExpiredScheduleDateTimeTZ",
			"SendDateTimeTZ"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varLog_EmailDistributionSchedule_RefID,
			varEmailAccount_RefID,
			varSendScheduleDateTimeTZ,
			varSendExpiredScheduleDateTimeTZ,
			varSendDateTimeTZ
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_EmailDistributionScheduleRecipient_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_EmailDistributionScheduleRecipient_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 613 (class 1255 OID 350468)
-- Name: Func_TblLog_UserLoginSession_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_UserLoginSession_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varSysBranchRefID							ALIAS FOR $5;

	varUser_RefID								ALIAS FOR $6;
	varAPIWebToken								ALIAS FOR $7;
	varOptionsList								ALIAS FOR $8;
	varBranch_RefID								ALIAS FOR $9;
	varUserRole_RefID							ALIAS FOR $10;
	varSessionStartDateTimeTZ					ALIAS FOR $11;
	varSessionFinishDateTimeTZ					ALIAS FOR $12;
	varSessionAutoStartDateTimeTZ				ALIAS FOR $13;
	varSessionAutoFinishDateTimeTZ				ALIAS FOR $14;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_UserLoginSession"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Branch_RefID",
			"User_RefID",
			"APIWebToken",
			"OptionsList",
			"Branch_RefID",
			"UserRole_RefID",
			"SessionStartDateTimeTZ",
			"SessionFinishDateTimeTZ",
			"SessionAutoStartDateTimeTZ",
			"SessionAutoFinishDateTimeTZ"
			)
	VALUES
		(
		varIDSession,
		varEntryDateTimeTZ,
		varSysBranchRefID,
		varUser_RefID,
		varAPIWebToken,
		varOptionsList,
		varBranch_RefID,
		varUserRole_RefID,
		varSessionStartDateTimeTZ,
		varSessionFinishDateTimeTZ,
		varSessionAutoStartDateTimeTZ,
		varSessionAutoFinishDateTimeTZ
		);

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_UserLoginSession_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 614 (class 1255 OID 350469)
-- Name: Func_TblLog_UserLoginSession_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblLog_UserLoginSession_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varSysBranchRefID							ALIAS FOR $5;

	varUser_RefID								ALIAS FOR $6;
	varAPIWebToken								ALIAS FOR $7;
	varOptionsList								ALIAS FOR $8;
	varBranch_RefID								ALIAS FOR $9;
	varUserRole_RefID							ALIAS FOR $10;
	varSessionStartDateTimeTZ					ALIAS FOR $11;
	varSessionFinishDateTimeTZ					ALIAS FOR $12;
	varSessionAutoStartDateTimeTZ				ALIAS FOR $13;
	varSessionAutoFinishDateTimeTZ				ALIAS FOR $14;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLog_UserLoginSession"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varSysBranchRefID,

		"User_RefID" = varUser_RefID,
		"APIWebToken" = varAPIWebToken,
		"OptionsList" = varOptionsList,
		"Branch_RefID" = varBranch_RefID,
		"UserRole_RefID" = varUserRole_RefID,
		"SessionStartDateTimeTZ" = varSessionStartDateTimeTZ,
		"SessionFinishDateTimeTZ" = varSessionFinishDateTimeTZ,
		"SessionAutoStartDateTimeTZ" = varSessionAutoStartDateTimeTZ,
		"SessionAutoFinishDateTimeTZ" = varSessionAutoFinishDateTimeTZ
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLog_UserLoginSession" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblLog_UserLoginSession_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, character varying, json, bigint, bigint, timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 615 (class 1255 OID 350470)
-- Name: Func_TblMapper_LDAPUserToPerson_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblMapper_LDAPUserToPerson_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;
	
	varLDAPUser_RefID							ALIAS FOR $6;
	varPerson_RefID								ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblMapper_LDAPUserToPerson"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",

			"LDAPUser_RefID",
  		    "Person_RefID"
			)
	  VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,

			varLDAPUser_RefID,
  		    varPerson_RefID
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblMapper_LDAPUserToPerson_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblMapper_LDAPUserToPerson_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 616 (class 1255 OID 350471)
-- Name: Func_TblMapper_LDAPUserToPerson_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblMapper_LDAPUserToPerson_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;
	
	varLDAPUser_RefID							ALIAS FOR $6;
	varPerson_RefID								ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblMapper_LDAPUserToPerson"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,
		
		"LDAPUser_RefID" = varLDAPUser_RefID,
		"Person_RefID" = varPerson_RefID
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblMapper_LDAPUserToPerson" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblMapper_LDAPUserToPerson_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint) OWNER TO "SysEngine";

--
-- TOC entry 606 (class 1255 OID 350472)
-- Name: Func_TblMapper_UserToLDAPUser_INSERT(bigint, timestamp with time zone, bigint, bigint, character varying, bytea, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblMapper_UserToLDAPUser_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying, bytea, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
   varIDSession			ALIAS FOR $1;
   varEntryDateTimeTZ	ALIAS FOR $2;
   varBranchRefID		ALIAS FOR $3;
   varUser_RefID		ALIAS FOR $4;
   varLDAPUserID		ALIAS FOR $5;
   varEncryptedPassword	ALIAS FOR $6;	
   varPasswordShadow	ALIAS FOR $7;
   varRecSetOutput		"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
   INSERT INTO 
      "SchSysConfig"."TblMapper_UserToLDAPUser"
         (
         "Sys_Data_Entry_LoginSession_RefID",
         "Sys_Data_Entry_DateTimeTZ",
         "Sys_Branch_RefID",
		 "User_RefID",
         "LDAPUserID",			 
         "EncryptedPassword",
         "PasswordShadow"
         )
      VALUES
         (
         varIDSession,
         varEntryDateTimeTZ,
         varBranchRefID,
		 varUser_RefID,
         varLDAPUserID,			 
         varEncryptedPassword,
         varPasswordShadow
         );

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblMapper_UserToLDAPUser_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblMapper_UserToLDAPUser_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying, bytea, character varying) OWNER TO "SysEngine";

--
-- TOC entry 617 (class 1255 OID 350473)
-- Name: Func_TblMapper_UserToUserRole_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblMapper_UserToUserRole_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varUser_RefID								ALIAS FOR $6;
	varUserRole_RefID							ALIAS FOR $7;
	varCallProjectSyntax						ALIAS FOR $8;
	varValidStartDateTimeTZ						ALIAS FOR $9;
	varValidFinishDateTimeTZ					ALIAS FOR $10;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblMapper_UserToUserRole"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"User_RefID",
    		"UserRole_RefID",
			"CallProjectSyntax",
    		"ValidStartDateTimeTZ",
   	 		"ValidFinishDateTimeTZ"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varUser_RefID,
    		varUserRole_RefID,
			varCallProjectSyntax,
    		varValidStartDateTimeTZ,
   	 		varValidFinishDateTimeTZ
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblMapper_UserToUserRole_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblMapper_UserToUserRole_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 618 (class 1255 OID 350474)
-- Name: Func_TblMapper_UserToUserRole_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblMapper_UserToUserRole_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varUser_RefID								ALIAS FOR $6;
	varUserRole_RefID							ALIAS FOR $7;
	varCallProjectSyntax						ALIAS FOR $8;
	varValidStartDateTimeTZ						ALIAS FOR $9;
	varValidFinishDateTimeTZ					ALIAS FOR $10;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblMapper_UserToUserRole"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		-- "Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"User_RefID" = varUser_RefID,
		"UserRole_RefID" = varUserRole_RefID,
		"CallProjectSyntax" = varCallProjectSyntax,
		"ValidStartDateTimeTZ" = varValidStartDateTimeTZ,
		"ValidFinishDateTimeTZ" = varValidFinishDateTimeTZ
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblMapper_UserToUserRole" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblMapper_UserToUserRole_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, bigint, character varying, timestamp with time zone, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 619 (class 1255 OID 350475)
-- Name: Func_TblRotateLog_API_INSERT(character varying, bigint, timestamp with time zone, cidr, character varying, character varying, timestamp with time zone, json, character varying, timestamp with time zone, smallint, json, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblRotateLog_API_INSERT"(character varying, bigint, timestamp with time zone, cidr, character varying, character varying, timestamp with time zone, json, character varying, timestamp with time zone, smallint, json, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation	ALIAS FOR $1;
	varIDSession			ALIAS FOR $2;
	varEntryDateTimeTZ		ALIAS FOR $3;

	varHostIPAddress		ALIAS FOR $4;
	varURL					ALIAS FOR $5;
	varNavigatorUserAgent	ALIAS FOR $6;
	varRequestDateTimeTZ	ALIAS FOR $7;
	varRequestHTTPHeader	ALIAS FOR $8;
	varRequestHTTPBody		ALIAS FOR $9;
	varResponseDateTimeTZ	ALIAS FOR $10;
	varResponseHTTPStatus	ALIAS FOR $11;
	varResponseHTTPHeader	ALIAS FOR $12;
	varResponseHTTPBody		ALIAS FOR $13;

	varPrimeNumber			bigint;
	varSys_RotateID			bigint;
	varSys_RPK				bigint;

	varRecSetOutput			"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;
   	varSignExist			smallint;

BEGIN
   varPrimeNumber := 10007; --2; --10007;
   varSys_RPK := nextval('"SchSysConfig"."TblRotateLog_API_Sys_RPK_seq"'::regclass);
   varSys_RotateID := (((varSys_RPK-1)%varPrimeNumber)+1);

--RAISE NOTICE '%', varSys_RPK;
--RAISE NOTICE '%', varSys_RotateID;

	SELECT 
		COUNT("Sys_RotateID")
			INTO
				varSignExist
	FROM 
		"SchSysConfig"."TblRotateLog_API"
	WHERE
		"Sys_RotateID" = varSys_RotateID;

--RAISE NOTICE '%', varSignExist;

	IF (varSignExist = 0) THEN
		INSERT INTO 
			"SchSysConfig"."TblRotateLog_API"
				(
				"Sys_RotateID",
				"Sys_RPK",
				"Sys_Data_Annotation",
				"Sys_Data_Entry_LoginSession_RefID",
				"Sys_Data_Entry_DateTimeTZ",
				"HostIPAddress",
				"URL",
				"NavigatorUserAgent",
				"RequestDateTimeTZ",
				"RequestHTTPHeader",
				"RequestHTTPBody",
				"ResponseDateTimeTZ",
				"ResponseHTTPStatus",
				"ResponseHTTPHeader",
				"ResponseHTTPBody"
				)
		VALUES
			(
			varSys_RotateID,
			varSys_RPK,
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varHostIPAddress,
			varURL,
			varNavigatorUserAgent,
			varRequestDateTimeTZ,
			varRequestHTTPHeader,
			varRequestHTTPBody,
			varResponseDateTimeTZ,
			varResponseHTTPStatus,
			varResponseHTTPHeader,
			varResponseHTTPBody
			);
	ELSE
		UPDATE 
			"SchSysConfig"."TblRotateLog_API"
		SET
			"Sys_RPK" = varSys_RPK,
			"Sys_Data_Annotation" = varSysDataAnnotation,
			"Sys_Data_Entry_LoginSession_RefID" = varIDSession,
			"Sys_Data_Entry_DateTimeTZ" = varEntryDateTimeTZ,
			"HostIPAddress" = varHostIPAddress,
			"URL" = varURL,
			"NavigatorUserAgent" = varNavigatorUserAgent,
			"RequestDateTimeTZ" = varRequestDateTimeTZ,
			"RequestHTTPHeader" = varRequestHTTPHeader,
			"RequestHTTPBody" = varRequestHTTPBody,
			"ResponseDateTimeTZ" = varResponseDateTimeTZ,
			"ResponseHTTPStatus" = varResponseHTTPStatus,
			"ResponseHTTPHeader" = varResponseHTTPHeader,
			"ResponseHTTPBody" = varResponseHTTPBody
		WHERE
			"Sys_RotateID" = varSys_RotateID;
	END IF;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RotateID';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblRotateLog_API_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblRotateLog_API_INSERT"(character varying, bigint, timestamp with time zone, cidr, character varying, character varying, timestamp with time zone, json, character varying, timestamp with time zone, smallint, json, character varying) OWNER TO "SysEngine";

--
-- TOC entry 620 (class 1255 OID 350476)
-- Name: Func_TblRotateLog_FailedUserLogin_INSERT(character varying, bigint, timestamp with time zone, character varying, character varying, timestamp with time zone, character varying, character varying, cidr, macaddr, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblRotateLog_FailedUserLogin_INSERT"(character varying, bigint, timestamp with time zone, character varying, character varying, timestamp with time zone, character varying, character varying, cidr, macaddr, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation	ALIAS FOR $1;
	varIDSession			ALIAS FOR $2;
	varEntryDateTimeTZ		ALIAS FOR $3;

	varLoginUser			ALIAS FOR $4;
	varLoginPassword		ALIAS FOR $5;
	varLoginDateTimeTZ		ALIAS FOR $6;
	varNavigatorUserAgent	ALIAS FOR $7;
	varNavigatorPlatform	ALIAS FOR $8;
	varHostIPAddress		ALIAS FOR $9;
	varHostMACAddress		ALIAS FOR $10;
	varHostName				ALIAS FOR $11;

	varPrimeNumber			bigint;
	varSys_RotateID			bigint;
	varSys_RPK				bigint;

	varRecSetOutput			"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;
	varSignExist			smallint;

BEGIN
	varPrimeNumber := 2; --10007;
	varSys_RPK := nextval('"SchSysConfig"."TblRotateLog_FailedUserLogin_Sys_RPK_seq"'::regclass);
	varSys_RotateID := (((varSys_RPK-1)%varPrimeNumber)+1);

	SELECT 
		COUNT("Sys_RotateID")
	INTO
		varSignExist
	FROM 
		"SchSysConfig"."TblRotateLog_FailedUserLogin"
	WHERE
		"Sys_RotateID" = varSys_RotateID;

	IF (varSignExist = 0) THEN
		INSERT INTO 
			"SchSysConfig"."TblRotateLog_FailedUserLogin"
				(
				"Sys_RotateID",
				"Sys_RPK",
				"Sys_Data_Annotation",
				"Sys_Data_Entry_LoginSession_RefID",
				"Sys_Data_Entry_DateTimeTZ",
				"LoginUser",
				"LoginPassword",
				"LoginDateTimeTZ",
				"NavigatorUserAgent",
				"NavigatorPlatform",
				"HostIPAddress",
				"HostMACAddress",
				"HostName"
				)
		VALUES
			(
			varSys_RotateID,
			varSys_RPK,
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varLoginUser,
			varLoginPassword,
			varLoginDateTimeTZ,
			varNavigatorUserAgent,
			varNavigatorPlatform,
			varHostIPAddress,
			varHostMACAddress,
			varHostName
			);
	ELSE
		UPDATE 
			"SchSysConfig"."TblRotateLog_FailedUserLogin"
		SET
			"Sys_RPK" = varSys_RPK,
			"Sys_Data_Annotation" = varSysDataAnnotation,
			"Sys_Data_Entry_LoginSession_RefID" = varIDSession,
			"Sys_Data_Entry_DateTimeTZ" = varEntryDateTimeTZ,
			"LoginUser" = varLoginUser,
			"LoginPassword" = varLoginPassword,
			"LoginDateTimeTZ" = varLoginDateTimeTZ,
			"NavigatorUserAgent" = varNavigatorUserAgent,
			"NavigatorPlatform" = varNavigatorPlatform,
			"HostIPAddress" = varHostIPAddress,
			"HostMACAddress" = varHostMACAddress,
			"HostName" = varHostName
		WHERE
			"Sys_RotateID" = varSys_RotateID;
	END IF;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RotateID';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblRotateLog_FailedUserLogin_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblRotateLog_FailedUserLogin_INSERT"(character varying, bigint, timestamp with time zone, character varying, character varying, timestamp with time zone, character varying, character varying, cidr, macaddr, character varying) OWNER TO "SysEngine";

--
-- TOC entry 621 (class 1255 OID 350477)
-- Name: Func_TblRotateLog_FileUploadStagingAreaDetail_INSERT(character varying, bigint, timestamp with time zone, bigint, smallint, character varying, bigint, character varying, character varying, character varying, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblRotateLog_FileUploadStagingAreaDetail_INSERT"(character varying, bigint, timestamp with time zone, bigint, smallint, character varying, bigint, character varying, character varying, character varying, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;

	varRotateLog_FileUploadStagingArea_RefRPK	ALIAS FOR $4;
	varSequence									ALIAS FOR $5;
	varName										ALIAS FOR $6;	
	varSize										ALIAS FOR $7;
	varMIME										ALIAS FOR $8;
	varExtension								ALIAS FOR $9;
	varLastModifiedDateTimeTZ					ALIAS FOR $10;
	varLastModifiedUnixTimestamp				ALIAS FOR $11;

	varPrimeNumber								bigint;
	varSys_RotateID								bigint;
	varSys_RPK									bigint;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;
   	varSignExist								smallint;

BEGIN
   varPrimeNumber := 10007; --2; --10007;
   varSys_RPK := nextval('"SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail_Sys_RPK_seq"'::regclass);
   varSys_RotateID := (((varSys_RPK-1)%varPrimeNumber)+1);

--RAISE NOTICE '%', varSys_RPK;
--RAISE NOTICE '%', varSys_RotateID;

	SELECT 
		COUNT("Sys_RotateID")
			INTO
				varSignExist
	FROM 
		"SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail"
	WHERE
		"Sys_RotateID" = varSys_RotateID;

--RAISE NOTICE '%', varSignExist;

	IF (varSignExist = 0) THEN
		INSERT INTO 
			"SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail"
				(
				"Sys_RotateID",
				"Sys_RPK",
				"Sys_Data_Annotation",
				"Sys_Data_Entry_LoginSession_RefID",
				"Sys_Data_Entry_DateTimeTZ",
				"RotateLog_FileUploadStagingArea_RefRPK",
				"Sequence",
				"Name",
				"Size",
				"MIME",
				"Extension",
				"LastModifiedDateTimeTZ",
				"LastModifiedUnixTimestamp"
				)
		VALUES
			(
			varSys_RotateID,
			varSys_RPK,
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varRotateLog_FileUploadStagingArea_RefRPK,
			varSequence,
			varName,
			varSize,
			varMIME,
			varExtension,
			varLastModifiedDateTimeTZ,
			varLastModifiedUnixTimestamp
			);
	ELSE
		UPDATE 
			"SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail"
		SET
			"Sys_RPK" = varSys_RPK,
			"Sys_Data_Annotation" = varSysDataAnnotation,
			"Sys_Data_Entry_LoginSession_RefID" = varIDSession,
			"Sys_Data_Entry_DateTimeTZ" = varEntryDateTimeTZ,
			"RotateLog_FileUploadStagingArea_RefRPK" = varRotateLog_FileUploadStagingArea_RefRPK,
			"Sequence" = varSequence,
			"Name" = varName,
			"Size" = varSize,
			"MIME" = varMIME,
			"Extension" = varExtension,
			"LastModifiedDateTimeTZ" = varLastModifiedDateTimeTZ,
			"LastModifiedUnixTimestamp" = varLastModifiedUnixTimestamp
		WHERE
			"Sys_RotateID" = varSys_RotateID;
	END IF;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RotateID';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblRotateLog_FileUploadStagingAreaDetail_INSERT"(character varying, bigint, timestamp with time zone, bigint, smallint, character varying, bigint, character varying, character varying, character varying, bigint) OWNER TO "SysEngine";

--
-- TOC entry 622 (class 1255 OID 350478)
-- Name: Func_TblRotateLog_FileUploadStagingArea_INSERT(character varying, bigint, timestamp with time zone, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblRotateLog_FileUploadStagingArea_INSERT"(character varying, bigint, timestamp with time zone, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation	ALIAS FOR $1;
	varIDSession			ALIAS FOR $2;
	varEntryDateTimeTZ		ALIAS FOR $3;

	varApplicationKey		ALIAS FOR $4;

	varPrimeNumber			bigint;
	varSys_RotateID			bigint;
	varSys_RPK				bigint;

	varRecSetOutput			"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;
   	varSignExist			smallint;

BEGIN
   varPrimeNumber := 10007; --2; --10007;
   varSys_RPK := nextval('"SchSysConfig"."TblRotateLog_FileUploadStagingArea_Sys_RPK_seq"'::regclass);
   varSys_RotateID := (((varSys_RPK-1)%varPrimeNumber)+1);

--RAISE NOTICE '%', varSys_RPK;
--RAISE NOTICE '%', varSys_RotateID;

	SELECT 
		COUNT("Sys_RotateID")
			INTO
				varSignExist
	FROM 
		"SchSysConfig"."TblRotateLog_FileUploadStagingArea"
	WHERE
		"Sys_RotateID" = varSys_RotateID;

--RAISE NOTICE '%', varSignExist;

	IF (varSignExist = 0) THEN
		INSERT INTO 
			"SchSysConfig"."TblRotateLog_FileUploadStagingArea"
				(
				"Sys_RotateID",
				"Sys_RPK",
				"Sys_Data_Annotation",
				"Sys_Data_Entry_LoginSession_RefID",
				"Sys_Data_Entry_DateTimeTZ",
				"ApplicationKey"
				)
		VALUES
			(
			varSys_RotateID,
			varSys_RPK,
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varApplicationKey
			);
	ELSE
		UPDATE 
			"SchSysConfig"."TblRotateLog_FileUploadStagingArea"
		SET
			"Sys_RPK" = varSys_RPK,
			"Sys_Data_Annotation" = varSysDataAnnotation,
			"Sys_Data_Entry_LoginSession_RefID" = varIDSession,
			"Sys_Data_Entry_DateTimeTZ" = varEntryDateTimeTZ,
			"ApplicationKey" = varApplicationKey
		WHERE
			"Sys_RotateID" = varSys_RotateID;
	END IF;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RotateID';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblRotateLog_FileUploadStagingArea_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblRotateLog_FileUploadStagingArea_INSERT"(character varying, bigint, timestamp with time zone, character varying) OWNER TO "SysEngine";

--
-- TOC entry 623 (class 1255 OID 350479)
-- Name: Func_TblRotateLog_WebPageRequest_INSERT(timestamp with time zone, character varying, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."Func_TblRotateLog_WebPageRequest_INSERT"(timestamp with time zone, character varying, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
	varRequestDateTimeTZ	ALIAS FOR $1;
	varUniqueToken			ALIAS FOR $2;
	varContentShadow		ALIAS FOR $3;

	varPrimeNumber			bigint;
	varSys_RotateID			bigint;
	varSys_RPK				bigint;

	varRecSetOutput			"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;
   	varSignExist			smallint;

BEGIN
   varPrimeNumber := 10007; --2; --10007;
   varSys_RPK := nextval('"SchSysConfig"."TblRotateLog_WebPageRequest_Sys_RPK_seq"'::regclass);
   varSys_RotateID := (((varSys_RPK-1)%varPrimeNumber)+1);

   SELECT 
      COUNT("Sys_RotateID")
   INTO
      varSignExist
   FROM 
      "SchSysConfig"."TblRotateLog_WebPageRequest"
   WHERE
      "Sys_RotateID" = varSys_RotateID;

   IF (varSignExist = 0) THEN
      INSERT INTO 
         "SchSysConfig"."TblRotateLog_WebPageRequest"
            (
            "Sys_RotateID",
	        "Sys_RPK",
			"RequestDateTimeTZ",
			"UniqueToken",
			"ContentShadow"
            )
        VALUES
            (
            varSys_RotateID,
		    varSys_RPK,
            varRequestDateTimeTZ,
            varUniqueToken,
            varContentShadow
            );
   ELSE
      UPDATE 
         "SchSysConfig"."TblRotateLog_WebPageRequest"
      SET
	     "Sys_RPK" = varSys_RPK,
         "RequestDateTimeTZ" = varRequestDateTimeTZ,
         "UniqueToken" = varUniqueToken,
         "ContentShadow" = varContentShadow
      WHERE
	     "Sys_RotateID" = varSys_RotateID;
   END IF;

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RotateID';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblRotateLog_WebPageRequest_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."Func_TblRotateLog_WebPageRequest_INSERT"(timestamp with time zone, character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 624 (class 1255 OID 350480)
-- Name: OLDFunc_TblDBObject_Schema_INSERT(bigint, timestamp with time zone, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblDBObject_Schema_INSERT"(bigint, timestamp with time zone, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$DECLARE
   varIDSession			ALIAS FOR $1;
   varEntryDateTimeTZ	ALIAS FOR $2;
   varBranchRefID		ALIAS FOR $3;
   varSchemaName		ALIAS FOR $4;
   varRecSetOutput		"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
   INSERT INTO 
      "SchSysConfig"."TblDBObject_Schema"
         (
         "Sys_Data_Entry_LoginSession_RefID",
         "Sys_Data_Entry_DateTimeTZ",
         "Sys_Branch_RefID",
         "Name"
         )
      VALUES
         (
         varIDSession,
         varEntryDateTimeTZ,
         varBranchRefID,
         varSchemaName
         );

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Schema_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
END;$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblDBObject_Schema_INSERT"(bigint, timestamp with time zone, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 625 (class 1255 OID 350481)
-- Name: OLDFunc_TblDBObject_Table_INSERT(bigint, timestamp with time zone, bigint, bigint, character varying, bigint); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblDBObject_Table_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying, bigint) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
   varIDSession									ALIAS FOR $1;
   varEntryDateTimeTZ							ALIAS FOR $2;
   varBranchRefID								ALIAS FOR $3;
   varSchemaRefID   							ALIAS FOR $4;
   varTableName									ALIAS FOR $5;
   varPartitionRemovableRecordParameterRefID	ALIAS FOR $6;
   varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
   PERFORM pg_advisory_lock(1234);
   INSERT INTO 
      "SchSysConfig"."TblDBObject_Table"
         (
         "Sys_Data_Entry_LoginSession_RefID",
         "Sys_Data_Entry_DateTimeTZ",
         "Sys_Branch_RefID",
         "Schema_RefID",
         "Name",
		 "Partition_RemovableRecord_Parameter_RefID"
         )
      VALUES
         (
         varIDSession,
         varEntryDateTimeTZ,
         varBranchRefID,
         varSchemaRefID,
         varTableName,
		 varPartitionRemovableRecordParameterRefID
         );

   varRecSetOutput."SignSuccess" := 1;
   varRecSetOutput."SignRecordType" := 'Sys_RPK';
   varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblDBObject_Table_Sys_RPK_seq"');
   varRecSetOutput."SignMessage" := null;

   RETURN NEXT varRecSetOutput;
   PERFORM pg_advisory_unlock(1234);
END;
$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblDBObject_Table_INSERT"(bigint, timestamp with time zone, bigint, bigint, character varying, bigint) OWNER TO "SysEngine";

--
-- TOC entry 626 (class 1255 OID 350482)
-- Name: OLDFunc_TblLog_Device_PersonAccessFetch_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccessFetch_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation						ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEntryDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varGoodsIdentity_RefID						ALIAS FOR $6;
	varFetchDateTimeTZ							ALIAS FOR $7;
	
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_Device_PersonAccessFetch"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"GoodsIdentity_RefID",
			"FetchDateTimeTZ"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varGoodsIdentity_RefID,
			varFetchDateTimeTZ
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_Device_PersonAccessFetch_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccessFetch_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 627 (class 1255 OID 350483)
-- Name: OLDFunc_TblLog_Device_PersonAccessFetch_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccessFetch_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varID										ALIAS FOR $1;
	varIDSession								ALIAS FOR $2;
	varEditDateTimeTZ							ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $4;
	varBranchRefID								ALIAS FOR $5;

	varGoodsIdentity_RefID						ALIAS FOR $6;
	varFetchDateTimeTZ							ALIAS FOR $7;

	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLog_Device_PersonAccessFetch"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"GoodsIdentity_RefID" = varGoodsIdentity_RefID,
		"FetchDateTimeTZ" = varFetchDateTimeTZ
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLog_Device_PersonAccessFetch" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccessFetch_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone) OWNER TO "SysEngine";

--
-- TOC entry 628 (class 1255 OID 350484)
-- Name: OLDFunc_TblLog_Device_PersonAccess_INSERT(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccess_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varSysDataAnnotation							ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEntryDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varLog_Device_PersonAccessFetch_RefID			ALIAS FOR $6;
	varAttendanceDateTimeTZ							ALIAS FOR $7;
	varPersonID										ALIAS FOR $8;
	varPersonUserName								ALIAS FOR $9;
	
	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_Device_PersonAccess"
			(
			"Sys_Data_Annotation",
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"Log_Device_PersonAccessFetch_RefID",
			"AttendanceDateTimeTZ",
			"PersonID",
			"PersonUserName"
			)
		VALUES
			(
			varSysDataAnnotation,
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varLog_Device_PersonAccessFetch_RefID,
			varAttendanceDateTimeTZ,
			varPersonID,
			varPersonUserName
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_Device_PersonAccess_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccess_INSERT"(character varying, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 629 (class 1255 OID 350485)
-- Name: OLDFunc_TblLog_Device_PersonAccess_UPDATE(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccess_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$
DECLARE
	varID											ALIAS FOR $1;
	varIDSession									ALIAS FOR $2;
	varEditDateTimeTZ								ALIAS FOR $3;
	varSysPartitionRemovableRecordKeyRefID			ALIAS FOR $4;
	varBranchRefID									ALIAS FOR $5;

	varLog_Device_PersonAccessFetch_RefID			ALIAS FOR $6;
	varAttendanceDateTimeTZ							ALIAS FOR $7;
	varPersonID										ALIAS FOR $8;
	varPersonUserName								ALIAS FOR $9;

	varRecSetOutput									"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	UPDATE
		"SchSysConfig"."TblLog_Device_PersonAccess"
	SET
		"Sys_Data_Edit_LoginSession_RefID" = varIDSession,
		"Sys_Data_Edit_DateTimeTZ" = varEditDateTimeTZ,
		"Sys_Partition_RemovableRecord_Key_RefID" = varSysPartitionRemovableRecordKeyRefID,
		"Sys_Branch_RefID" = varBranchRefID,

		"Log_Device_PersonAccessFetch_RefID" = varLog_Device_PersonAccessFetch_RefID,
		"AttendanceDateTimeTZ" = varAttendanceDateTimeTZ,
		"PersonID" = varPersonID,
		"PersonUserName" = varPersonUserName
	WHERE
		"Sys_PID" = varID
		OR
		"Sys_SID" = varID;

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := (SELECT "Sys_RPK" FROM "SchSysConfig"."TblLog_Device_PersonAccess" WHERE "Sys_PID" = varID OR "Sys_SID" = varID LIMIT 1);
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;
$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblLog_Device_PersonAccess_UPDATE"(bigint, bigint, timestamp with time zone, bigint, bigint, bigint, timestamp with time zone, bigint, character varying) OWNER TO "SysEngine";

--
-- TOC entry 630 (class 1255 OID 350486)
-- Name: OLDFunc_TblLog_EmailDistributionSchedule_INSERT(bigint, timestamp with time zone, bigint, bigint, bigint, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: SchSysConfig; Owner: SysEngine
--

CREATE FUNCTION "SchSysConfig"."OLDFunc_TblLog_EmailDistributionSchedule_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, timestamp without time zone, timestamp without time zone) RETURNS SETOF "SchSystem"."HoldFuncSys_General_FeedBackQuery"
    LANGUAGE plpgsql
    AS $_$

DECLARE
	varIDSession								ALIAS FOR $1;
	varEntryDateTimeTZ							ALIAS FOR $2;
	varSysPartitionRemovableRecordKeyRefID		ALIAS FOR $3;
	varBranchRefID								ALIAS FOR $4;
	
	varEmailDistribution_Schedule_RefID			ALIAS FOR $5;
	varSendScheduleDateTime						ALIAS FOR $6;
	varSendExpiredScheduleDateTime				ALIAS FOR $7;
	varRecSetOutput								"SchSystem"."HoldFuncSys_General_FeedBackQuery"%rowtype;

BEGIN
	INSERT INTO 
		"SchSysConfig"."TblLog_EmailDistributionSchedule"
			(
			"Sys_Data_Entry_LoginSession_RefID",
			"Sys_Data_Entry_DateTimeTZ",
			"Sys_Partition_RemovableRecord_Key_RefID",
			"Sys_Branch_RefID",
			"EmailDistribution_Schedule_RefID",
			"SendScheduleDateTime",
			"SendExpiredScheduleDateTime"
			)
		VALUES
			(
			varIDSession,
			varEntryDateTimeTZ,
			varSysPartitionRemovableRecordKeyRefID,
			varBranchRefID,
			varEmailDistribution_Schedule_RefID,
			varSendScheduleDateTime,
			varSendExpiredScheduleDateTime
			);

	varRecSetOutput."SignSuccess" := 1;
	varRecSetOutput."SignRecordType" := 'Sys_RPK';
	varRecSetOutput."SignRecordID" := CURRVAL('"SchSysConfig"."TblLog_EmailDistributionSchedule_Sys_RPK_seq"');
	varRecSetOutput."SignMessage" := null;

	RETURN NEXT varRecSetOutput;
END;

$_$;


ALTER FUNCTION "SchSysConfig"."OLDFunc_TblLog_EmailDistributionSchedule_INSERT"(bigint, timestamp with time zone, bigint, bigint, bigint, timestamp without time zone, timestamp without time zone) OWNER TO "SysEngine";

--
-- TOC entry 631 (class 1255 OID 350487)
-- Name: FuncSys_General_CreateSequence(character varying, character varying); Type: FUNCTION; Schema: SchSystem; Owner: SysEngine
--

CREATE FUNCTION "SchSystem"."FuncSys_General_CreateSequence"(character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
/*----------------------------------------------------------------------------------------------------
▪ Nama               : "SchSystem""."FuncSys_General_CreateSequence"
▪ Versi              : 1.00.0000
▪ Tanggal            : 2020-12-02
▪ Input              : varSchemaName (varchar) 
					   varSequenceName (varchar)
▪ Output             : void
▪ Keterkaitan Fungsi : -
▪ Deskripsi          : Fungsi ini digunakan untuk membangun Sequence
▪ Copyright          : Zheta © 2020
----------------------------------------------------------------------------------------------------*/

DECLARE
   	varSchemaName		ALIAS FOR $1;
   	varSequenceName		ALIAS FOR $2;
   	varSQL				varchar;

BEGIN
	varSQL := '
		CREATE SEQUENCE IF NOT EXISTS "' || varSchemaName || '"."' || varSequenceName || '"
			INCREMENT 1
			START 1
			MINVALUE 1
			MAXVALUE 9223372036854775807
			CACHE 1;
		';
	EXECUTE varSQL;
END;
$_$;


ALTER FUNCTION "SchSystem"."FuncSys_General_CreateSequence"(character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 632 (class 1255 OID 350488)
-- Name: FuncSys_General_GetSequence(character varying, character varying); Type: FUNCTION; Schema: SchSystem; Owner: SysEngine
--

CREATE FUNCTION "SchSystem"."FuncSys_General_GetSequence"(character varying, character varying) RETURNS bigint
    LANGUAGE plpgsql
    AS $_$
/*----------------------------------------------------------------------------------------------------
▪ Nama               : "SchSystem""."FuncSys_General_GetSequence"
▪ Versi              : 1.00.0000
▪ Tanggal            : 2020-12-02
▪ Input              : varSchemaName (varchar) 
					   varSequenceName (varchar)
▪ Output             : varOutput (bigint)
▪ Keterkaitan Fungsi : -
▪ Deskripsi          : Fungsi ini digunakan untuk mendapatkan nilai dari Sequence
▪ Copyright          : Zheta © 2020
----------------------------------------------------------------------------------------------------*/

DECLARE
	varSchemaName		ALIAS FOR $1;
	varSequenceName		ALIAS FOR $2;
	varSQL				varchar;

	varOutput			bigint;
BEGIN
	varSQL := '
		SELECT NEXTVAL(''"' || varSchemaName || '"."' || varSequenceName || '"'')
		';
	EXECUTE varSQL INTO varOutput;
	RETURN varOutput;
END;
$_$;


ALTER FUNCTION "SchSystem"."FuncSys_General_GetSequence"(character varying, character varying) OWNER TO "SysEngine";

--
-- TOC entry 633 (class 1255 OID 350489)
-- Name: FuncSys_General_SetSequence(character varying, character varying, bigint); Type: FUNCTION; Schema: SchSystem; Owner: SysEngine
--

CREATE FUNCTION "SchSystem"."FuncSys_General_SetSequence"(character varying, character varying, bigint) RETURNS void
    LANGUAGE plpgsql
    AS $_$
/*----------------------------------------------------------------------------------------------------
▪ Nama               : "SchSysConfig"."FuncSys_General_SetSequence"
▪ Versi              : 1.00.0001
▪ Tanggal            : 2021-07-27
▪ Input              : varSchemaName (varchar)
                       varTableName (varchar)
▪ Output             : void
▪ Keterkaitan Fungsi : -
▪ Deskripsi          : Fungsi ini digunakan untuk menginisialisasi ulang sequence yang terkait 
					   dengan Skema (varSchemaName) dan Table (varTableName) tertentu kembali
                       keangka tertentu (varSequenceNumber)
▪ Copyright          : Zheta © 2018 - 2021
----------------------------------------------------------------------------------------------------*/

DECLARE
   varSchemaName		ALIAS FOR $1;
   varTableName			ALIAS FOR $2;
   varSequenceNumber	ALIAS FOR $3;
   varSQL				varchar;
   varSequenceName		varchar;

BEGIN
	IF ((LENGTH(varTableName) >= 13) AND (SUBSTR(varTableName, 1, 13) = 'TblRotateLog_'))  THEN
		varSequenceName :=  varTableName || '_Sys_RPK_seq';
	ELSE
		varSQL :='
			SELECT
				SUBSTRING("SubSQL"."SequenceField", (10 + LENGTH(''' || varSchemaName || ''') + 4), (LENGTH("SubSQL"."SequenceField") - LENGTH(''' || varSchemaName || ''') - 13 - 13))
			FROM
				(
				SELECT 
					column_default AS "SequenceField"
				FROM
					information_schema.columns 
				WHERE 
					table_schema LIKE ''' || varSchemaName || '''
					AND
					table_name LIKE ''' || varTableName || '''
					AND
					column_default LIKE ''nextval(%''
					AND
					column_default LIKE ''%::regclass)''
				) AS "SubSQL"
			';
		EXECUTE varSQL INTO varSequenceName;
	END IF;

   ---> Set Sequence
	varSQL :='
		ALTER SEQUENCE 
			"' || varSchemaName || '"."' || varSequenceName || '"
		RESTART WITH ' || varSequenceNumber;
	EXECUTE varSQL;
END;
$_$;


ALTER FUNCTION "SchSystem"."FuncSys_General_SetSequence"(character varying, character varying, bigint) OWNER TO "SysEngine";

--
-- TOC entry 214 (class 1259 OID 350490)
-- Name: TblAppObject_AuthorizationSequence_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequence_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequence_Sys_RPK_seq" OWNER TO "SysEngine";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 350491)
-- Name: TblAppObject_AuthorizationSequence; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequence" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequence_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Owner_RefID" bigint,
    "BusinessDocumentType_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequence" OWNER TO "SysEngine";

--
-- TOC entry 216 (class 1259 OID 350497)
-- Name: TblAppObject_AuthorizationSequenceActionType_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 217 (class 1259 OID 350498)
-- Name: TblAppObject_AuthorizationSequenceActionType; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceActionType_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(64)
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType" OWNER TO "SysEngine";

--
-- TOC entry 218 (class 1259 OID 350504)
-- Name: TblAppObject_AuthorizationSequenceEdge_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 219 (class 1259 OID 350505)
-- Name: TblAppObject_AuthorizationSequenceEdge; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdge_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AuthorizationSequenceVersion_RefID" bigint,
    "PreviousAuthorizationSequenceNode_RefID" bigint,
    "NextAuthorizationSequenceNode_RefID" bigint,
    "PreviousVersionAuthorizationSequenceEdge_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge" OWNER TO "SysEngine";

--
-- TOC entry 220 (class 1259 OID 350511)
-- Name: TblAppObject_AuthorizationSequenceEdgeMember_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 221 (class 1259 OID 350512)
-- Name: TblAppObject_AuthorizationSequenceEdgeMember; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember" OWNER TO "SysEngine";

--
-- TOC entry 222 (class 1259 OID 350518)
-- Name: TblAppObject_AuthorizationSequenceEdgeMemberType_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType_Sys_RPK_seq"
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 223 (class 1259 OID 350519)
-- Name: TblAppObject_AuthorizationSequenceEdgeMemberType; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(64)
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType" OWNER TO "SysEngine";

--
-- TOC entry 224 (class 1259 OID 350525)
-- Name: TblAppObject_AuthorizationSequenceNode_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceNode_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNode_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 225 (class 1259 OID 350526)
-- Name: TblAppObject_AuthorizationSequenceNode; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNode" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceNode_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AuthorizationSequence_RefID" bigint,
    "AuthorizationSequenceNodeType_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNode" OWNER TO "SysEngine";

--
-- TOC entry 226 (class 1259 OID 350532)
-- Name: TblAppObject_AuthorizationSequenceNodeType_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 227 (class 1259 OID 350533)
-- Name: TblAppObject_AuthorizationSequenceNodeType; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(64)
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType" OWNER TO "SysEngine";

--
-- TOC entry 228 (class 1259 OID 350539)
-- Name: TblAppObject_AuthorizationSequenceVersion_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 229 (class 1259 OID 350540)
-- Name: TblAppObject_AuthorizationSequenceVersion; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_AuthorizationSequenceVersion_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AuthorizationSequence_RefID" bigint,
    "Version" smallint
);


ALTER TABLE "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion" OWNER TO "SysEngine";

--
-- TOC entry 230 (class 1259 OID 350546)
-- Name: TblAppObject_InstitutionBranch_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_InstitutionBranch_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionBranch_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 231 (class 1259 OID 350547)
-- Name: TblAppObject_InstitutionBranch; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_InstitutionBranch" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_InstitutionBranch_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_InstitutionRegional_RefID" bigint,
    "Name" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionBranch" OWNER TO "SysEngine";

--
-- TOC entry 232 (class 1259 OID 350553)
-- Name: TblAppObject_InstitutionCompany_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_InstitutionCompany_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionCompany_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 233 (class 1259 OID 350554)
-- Name: TblAppObject_InstitutionCompany; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_InstitutionCompany" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_InstitutionCompany_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionCompany" OWNER TO "SysEngine";

--
-- TOC entry 234 (class 1259 OID 350560)
-- Name: TblAppObject_InstitutionRegional_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_InstitutionRegional_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionRegional_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 235 (class 1259 OID 350561)
-- Name: TblAppObject_InstitutionRegional; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_InstitutionRegional" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_InstitutionRegional_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_InstitutionCompany_RefID" bigint,
    "Name" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblAppObject_InstitutionRegional" OWNER TO "SysEngine";

--
-- TOC entry 236 (class 1259 OID 350567)
-- Name: TblAppObject_Menu_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_Menu_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_Menu_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 237 (class 1259 OID 350568)
-- Name: TblAppObject_Menu; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_Menu" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_Menu_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "ParentNode_RefID" bigint,
    "Code" character varying(256),
    "Caption" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblAppObject_Menu" OWNER TO "SysEngine";

--
-- TOC entry 238 (class 1259 OID 350574)
-- Name: TblAppObject_Module_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_Module_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_Module_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 239 (class 1259 OID 350575)
-- Name: TblAppObject_Module; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_Module" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_Module_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblAppObject_Module" OWNER TO "SysEngine";

--
-- TOC entry 240 (class 1259 OID 350581)
-- Name: TblAppObject_ModuleReport_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_ModuleReport_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_ModuleReport_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 241 (class 1259 OID 350582)
-- Name: TblAppObject_ModuleReport; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_ModuleReport" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_ModuleReport_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_Module_RefID" bigint,
    "Name" character varying(256),
    "Title" character varying(256),
    "URLSegment" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblAppObject_ModuleReport" OWNER TO "SysEngine";

--
-- TOC entry 242 (class 1259 OID 350588)
-- Name: TblAppObject_Parameter; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_Parameter" (
    "Sys_Branch_RefID" bigint NOT NULL,
    "Key" character varying(256) NOT NULL,
    "Value" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblAppObject_Parameter" OWNER TO "SysEngine";

--
-- TOC entry 243 (class 1259 OID 350593)
-- Name: TblAppObject_UserRole_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_UserRole_Sys_RPK_seq"
    START WITH 475
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_UserRole_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 244 (class 1259 OID 350594)
-- Name: TblAppObject_UserRole; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_UserRole" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_UserRole_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblAppObject_UserRole" OWNER TO "SysEngine";

--
-- TOC entry 245 (class 1259 OID 350600)
-- Name: TblAppObject_UserRoleDelegation_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_UserRoleDelegation_Sys_RPK_seq"
    START WITH 19
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_UserRoleDelegation_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 246 (class 1259 OID 350601)
-- Name: TblAppObject_UserRoleDelegation; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_UserRoleDelegation" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_UserRoleDelegation_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "SourceMapper_UserToLUserRole_RefID" bigint,
    "DestinationUser_RefID" bigint,
    "SignMutualExclusive" boolean,
    "ValidStartDateTimeTZ" timestamp with time zone,
    "ValidFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblAppObject_UserRoleDelegation" OWNER TO "SysEngine";

--
-- TOC entry 247 (class 1259 OID 350607)
-- Name: TblAppObject_UserRolePrivilegesMenu_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 248 (class 1259 OID 350608)
-- Name: TblAppObject_UserRolePrivilegesMenu; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblAppObject_UserRolePrivilegesMenu_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "UserRole_RefID" bigint,
    "CallMenuSyntax" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu" OWNER TO "SysEngine";

--
-- TOC entry 249 (class 1259 OID 350614)
-- Name: TblDBObject_ForeignObject_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_ForeignObject_Sys_RPK_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_ForeignObject_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 250 (class 1259 OID 350615)
-- Name: TblDBObject_ForeignObject; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_ForeignObject" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_ForeignObject_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "ForeignDatabaseHost" inet,
    "ForeignDatabasePort" integer,
    "ForeignDatabaseName" character varying(256),
    "ForeignSchema" character varying(256),
    "ForeignTable" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblDBObject_ForeignObject" OWNER TO "SysEngine";

--
-- TOC entry 251 (class 1259 OID 350621)
-- Name: TblDBObject_Parameter; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_Parameter" (
    "Key" character varying(256) NOT NULL,
    "Value" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblDBObject_Parameter" OWNER TO "SysEngine";

--
-- TOC entry 252 (class 1259 OID 350626)
-- Name: TblDBObject_Partition_RemovableRecord_Key_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 253 (class 1259 OID 350627)
-- Name: TblDBObject_Partition_RemovableRecord_Key; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Partition_RemovableRecord_Parameter_RefID" bigint,
    "Key" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key" OWNER TO "SysEngine";

--
-- TOC entry 254 (class 1259 OID 350633)
-- Name: TblDBObject_Partition_RemovableRecord_Parameter_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 255 (class 1259 OID 350634)
-- Name: TblDBObject_Partition_RemovableRecord_Parameter; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Parameter" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter" OWNER TO "SysEngine";

--
-- TOC entry 256 (class 1259 OID 350640)
-- Name: TblDBObject_Schema_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_Schema_Sys_RPK_seq"
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_Schema_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 257 (class 1259 OID 350641)
-- Name: TblDBObject_Schema; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_Schema" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_Schema_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Name" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblDBObject_Schema" OWNER TO "SysEngine";

--
-- TOC entry 258 (class 1259 OID 350647)
-- Name: TblDBObject_Table_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_Table_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_Table_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 259 (class 1259 OID 350648)
-- Name: TblDBObject_Table; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_Table" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_Table_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Schema_RefID" bigint,
    "Name" character varying(128),
    "Partition_RemovableRecord_Parameter_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblDBObject_Table" OWNER TO "SysEngine";

--
-- TOC entry 260 (class 1259 OID 350654)
-- Name: TblDBObject_User_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblDBObject_User_Sys_RPK_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblDBObject_User_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 261 (class 1259 OID 350655)
-- Name: TblDBObject_User; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblDBObject_User" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblDBObject_User_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "PersonName" character varying(256),
    "UserName" character varying(128),
    "EncryptedPassword" bytea,
    "PasswordShadow" character varying(32)
);


ALTER TABLE "SchSysConfig"."TblDBObject_User" OWNER TO "SysEngine";

--
-- TOC entry 262 (class 1259 OID 350661)
-- Name: TblEMailDistribution_Recipient_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblEMailDistribution_Recipient_Sys_RPK_seq"
    START WITH 244
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblEMailDistribution_Recipient_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 263 (class 1259 OID 350662)
-- Name: TblEMailDistribution_Recipient; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblEMailDistribution_Recipient" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblEMailDistribution_Recipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_ModuleReport_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "ScheduleTimeZone" smallint
);


ALTER TABLE "SchSysConfig"."TblEMailDistribution_Recipient" OWNER TO "SysEngine";

--
-- TOC entry 264 (class 1259 OID 350668)
-- Name: TblEMailDistribution_Schedule_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblEMailDistribution_Schedule_Sys_RPK_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblEMailDistribution_Schedule_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 265 (class 1259 OID 350669)
-- Name: TblEMailDistribution_Schedule; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblEMailDistribution_Schedule" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblEMailDistribution_Schedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_ModuleReport_RefID" bigint,
    "Period_RefID" bigint,
    "PeriodStartDateScheduleOffset" interval
);


ALTER TABLE "SchSysConfig"."TblEMailDistribution_Schedule" OWNER TO "SysEngine";

--
-- TOC entry 266 (class 1259 OID 350675)
-- Name: TblEmailDistribution_Recipient_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblEmailDistribution_Recipient_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblEmailDistribution_Recipient_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 267 (class 1259 OID 350676)
-- Name: TblEmailDistribution_Recipient; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblEmailDistribution_Recipient" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblEmailDistribution_Recipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_ModuleReport_RefID" bigint,
    "EmailAccount_RefID" bigint,
    "ScheduleTimeZone" smallint
);


ALTER TABLE "SchSysConfig"."TblEmailDistribution_Recipient" OWNER TO "SysEngine";

--
-- TOC entry 268 (class 1259 OID 350682)
-- Name: TblEmailDistribution_Schedule_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblEmailDistribution_Schedule_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblEmailDistribution_Schedule_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 269 (class 1259 OID 350683)
-- Name: TblEmailDistribution_Schedule; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblEmailDistribution_Schedule" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblEmailDistribution_Schedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "AppObject_ModuleReport_RefID" bigint,
    "Period_RefID" bigint,
    "PeriodStartDateScheduleOffset" interval
);


ALTER TABLE "SchSysConfig"."TblEmailDistribution_Schedule" OWNER TO "SysEngine";

--
-- TOC entry 270 (class 1259 OID 350689)
-- Name: TblLDAPObject_User_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLDAPObject_User_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLDAPObject_User_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 271 (class 1259 OID 350690)
-- Name: TblLDAPObject_User; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLDAPObject_User" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLDAPObject_User_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "UserID" character varying(128),
    "UserName" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblLDAPObject_User" OWNER TO "SysEngine";

--
-- TOC entry 272 (class 1259 OID 350696)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 273 (class 1259 OID 350697)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" OWNER TO "SysEngine";

--
-- TOC entry 274 (class 1259 OID 350701)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_DEF" OWNER TO "SysEngine";

--
-- TOC entry 275 (class 1259 OID 350707)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT" OWNER TO "SysEngine";

--
-- TOC entry 276 (class 1259 OID 350713)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" OWNER TO "SysEngine";

--
-- TOC entry 277 (class 1259 OID 350717)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 278 (class 1259 OID 350723)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 279 (class 1259 OID 350729)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 280 (class 1259 OID 350735)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 281 (class 1259 OID 350741)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 282 (class 1259 OID 350747)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 283 (class 1259 OID 350753)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 284 (class 1259 OID 350759)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 285 (class 1259 OID 350765)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 286 (class 1259 OID 350771)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 287 (class 1259 OID 350777)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 288 (class 1259 OID 350783)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 289 (class 1259 OID 350789)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 290 (class 1259 OID 350795)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 291 (class 1259 OID 350801)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 292 (class 1259 OID 350807)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 293 (class 1259 OID 350813)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 294 (class 1259 OID 350819)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 295 (class 1259 OID 350825)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 296 (class 1259 OID 350831)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 297 (class 1259 OID 350837)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 298 (class 1259 OID 350843)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 299 (class 1259 OID 350849)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 300 (class 1259 OID 350855)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 301 (class 1259 OID 350861)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 302 (class 1259 OID 350867)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 303 (class 1259 OID 350873)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 304 (class 1259 OID 350879)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 305 (class 1259 OID 350885)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 306 (class 1259 OID 350891)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 307 (class 1259 OID 350897)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Trigger_BusinessDocumentHistory_RefID" bigint,
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "Path" bigint[]
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 308 (class 1259 OID 350903)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 309 (class 1259 OID 350904)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" OWNER TO "SysEngine";

--
-- TOC entry 310 (class 1259 OID 350908)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_DEF" OWNER TO "SysEngine";

--
-- TOC entry 311 (class 1259 OID 350914)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_PMT" OWNER TO "SysEngine";

--
-- TOC entry 312 (class 1259 OID 350920)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" OWNER TO "SysEngine";

--
-- TOC entry 313 (class 1259 OID 350924)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 314 (class 1259 OID 350930)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 315 (class 1259 OID 350936)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 316 (class 1259 OID 350943)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 317 (class 1259 OID 350949)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 318 (class 1259 OID 350955)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 319 (class 1259 OID 350961)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 320 (class 1259 OID 350967)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 321 (class 1259 OID 350973)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 322 (class 1259 OID 350979)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 323 (class 1259 OID 350985)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 324 (class 1259 OID 350991)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 325 (class 1259 OID 350997)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 326 (class 1259 OID 351003)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 327 (class 1259 OID 351009)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 328 (class 1259 OID 351015)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 329 (class 1259 OID 351021)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 330 (class 1259 OID 351027)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 331 (class 1259 OID 351033)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 332 (class 1259 OID 351039)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 333 (class 1259 OID 351045)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 334 (class 1259 OID 351051)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 335 (class 1259 OID 351057)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 336 (class 1259 OID 351063)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 337 (class 1259 OID 351069)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 338 (class 1259 OID 351075)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 339 (class 1259 OID 351081)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 340 (class 1259 OID 351087)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 341 (class 1259 OID 351093)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 342 (class 1259 OID 351099)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 343 (class 1259 OID 351105)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "BusinessDocumentVersion_RefID" bigint,
    "AuthorizationSequenceEdge_RefID" bigint,
    "User_RefID" bigint,
    "AuthorizationSequenceActionType_RefID" bigint,
    "ElementaryData" json
);


ALTER TABLE "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 344 (class 1259 OID 351111)
-- Name: TblLog_Device_PersonAccessFetch_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_Device_PersonAccessFetch_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_Device_PersonAccessFetch_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 345 (class 1259 OID 351112)
-- Name: TblLog_Device_PersonAccess_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_Device_PersonAccess_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_Device_PersonAccess_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 346 (class 1259 OID 351113)
-- Name: TblLog_EMailDistributionSchedule_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 347 (class 1259 OID 351114)
-- Name: TblLog_EMailDistributionSchedule; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule" OWNER TO "SysEngine";

--
-- TOC entry 348 (class 1259 OID 351118)
-- Name: TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 349 (class 1259 OID 351119)
-- Name: TblLog_EMailDistributionScheduleAttachment; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment" OWNER TO "SysEngine";

--
-- TOC entry 350 (class 1259 OID 351123)
-- Name: TblLog_EMailDistributionScheduleAttachment_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_DEF" OWNER TO "SysEngine";

--
-- TOC entry 351 (class 1259 OID 351129)
-- Name: TblLog_EMailDistributionScheduleAttachment_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_PMT" OWNER TO "SysEngine";

--
-- TOC entry 352 (class 1259 OID 351135)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" OWNER TO "SysEngine";

--
-- TOC entry 353 (class 1259 OID 351139)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 354 (class 1259 OID 351145)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 355 (class 1259 OID 351151)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 356 (class 1259 OID 351157)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 357 (class 1259 OID 351163)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 358 (class 1259 OID 351169)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 359 (class 1259 OID 351175)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 360 (class 1259 OID 351181)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 361 (class 1259 OID 351187)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 362 (class 1259 OID 351193)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 363 (class 1259 OID 351199)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 364 (class 1259 OID 351205)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 365 (class 1259 OID 351211)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 366 (class 1259 OID 351217)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 367 (class 1259 OID 351223)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 368 (class 1259 OID 351229)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 369 (class 1259 OID 351235)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 370 (class 1259 OID 351241)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 371 (class 1259 OID 351247)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 372 (class 1259 OID 351253)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 373 (class 1259 OID 351259)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 374 (class 1259 OID 351265)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 375 (class 1259 OID 351271)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 376 (class 1259 OID 351277)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 377 (class 1259 OID 351283)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 378 (class 1259 OID 351289)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 379 (class 1259 OID 351295)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 380 (class 1259 OID 351301)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 381 (class 1259 OID 351307)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 382 (class 1259 OID 351313)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 383 (class 1259 OID 351319)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionScheduleRecipient_RefID" bigint,
    "URLParameter" character varying(512)
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 384 (class 1259 OID 351325)
-- Name: TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 385 (class 1259 OID 351326)
-- Name: TblLog_EMailDistributionScheduleRecipient; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient" OWNER TO "SysEngine";

--
-- TOC entry 386 (class 1259 OID 351330)
-- Name: TblLog_EMailDistributionScheduleRecipient_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_DEF" OWNER TO "SysEngine";

--
-- TOC entry 387 (class 1259 OID 351336)
-- Name: TblLog_EMailDistributionScheduleRecipient_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_PMT" OWNER TO "SysEngine";

--
-- TOC entry 388 (class 1259 OID 351342)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" OWNER TO "SysEngine";

--
-- TOC entry 389 (class 1259 OID 351346)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 390 (class 1259 OID 351352)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 391 (class 1259 OID 351358)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 392 (class 1259 OID 351364)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 393 (class 1259 OID 351370)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 394 (class 1259 OID 351376)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 395 (class 1259 OID 351382)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 396 (class 1259 OID 351388)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 397 (class 1259 OID 351394)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 398 (class 1259 OID 351400)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 399 (class 1259 OID 351406)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 400 (class 1259 OID 351412)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 401 (class 1259 OID 351418)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 402 (class 1259 OID 351424)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 403 (class 1259 OID 351430)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 404 (class 1259 OID 351436)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 405 (class 1259 OID 351442)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 406 (class 1259 OID 351448)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 407 (class 1259 OID 351454)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 408 (class 1259 OID 351460)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 409 (class 1259 OID 351466)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 410 (class 1259 OID 351472)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 411 (class 1259 OID 351478)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 412 (class 1259 OID 351484)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 413 (class 1259 OID 351490)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 414 (class 1259 OID 351496)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 415 (class 1259 OID 351502)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 416 (class 1259 OID 351508)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 417 (class 1259 OID 351514)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 418 (class 1259 OID 351520)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 419 (class 1259 OID 351526)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "Log_EMailDistributionSchedule_RefID" bigint,
    "EMailAccount_RefID" bigint,
    "SendScheduleDateTimeTZ" timestamp with time zone,
    "SendExpiredScheduleDateTimeTZ" timestamp with time zone,
    "SendDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 420 (class 1259 OID 351532)
-- Name: TblLog_EMailDistributionSchedule_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_DEF" OWNER TO "SysEngine";

--
-- TOC entry 421 (class 1259 OID 351538)
-- Name: TblLog_EMailDistributionSchedule_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_PMT" OWNER TO "SysEngine";

--
-- TOC entry 422 (class 1259 OID 351544)
-- Name: TblLog_EMailDistributionSchedule_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" OWNER TO "SysEngine";

--
-- TOC entry 423 (class 1259 OID 351548)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 424 (class 1259 OID 351554)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 425 (class 1259 OID 351560)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 426 (class 1259 OID 351566)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 427 (class 1259 OID 351572)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 428 (class 1259 OID 351578)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 429 (class 1259 OID 351584)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 430 (class 1259 OID 351590)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 431 (class 1259 OID 351596)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 432 (class 1259 OID 351602)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 433 (class 1259 OID 351608)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 434 (class 1259 OID 351614)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 435 (class 1259 OID 351620)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 436 (class 1259 OID 351626)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 437 (class 1259 OID 351632)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 438 (class 1259 OID 351638)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 439 (class 1259 OID 351644)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 440 (class 1259 OID 351650)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 441 (class 1259 OID 351656)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 442 (class 1259 OID 351662)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 443 (class 1259 OID 351668)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 444 (class 1259 OID 351674)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 445 (class 1259 OID 351680)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 446 (class 1259 OID 351686)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 447 (class 1259 OID 351692)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 448 (class 1259 OID 351698)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 449 (class 1259 OID 351704)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 450 (class 1259 OID 351710)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 451 (class 1259 OID 351716)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 452 (class 1259 OID 351722)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 453 (class 1259 OID 351728)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_EMailDistributionSchedule_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "EMailDistribution_Schedule_RefID" bigint,
    "SendScheduleDateTime" timestamp without time zone,
    "SendExpiredScheduleDateTime" timestamp without time zone
);


ALTER TABLE "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 454 (class 1259 OID 351734)
-- Name: TblLog_UserLoginSession_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 455 (class 1259 OID 351735)
-- Name: TblLog_UserLoginSession; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession" OWNER TO "SysEngine";

--
-- TOC entry 456 (class 1259 OID 351739)
-- Name: TblLog_UserLoginSession_DEF; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_DEF" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_DEF" OWNER TO "SysEngine";

--
-- TOC entry 457 (class 1259 OID 351745)
-- Name: TblLog_UserLoginSession_PMT; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_PMT" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_PMT" OWNER TO "SysEngine";

--
-- TOC entry 458 (class 1259 OID 351751)
-- Name: TblLog_UserLoginSession_RMV; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
)
PARTITION BY LIST ("Sys_Partition_RemovableRecord_Key_RefID");


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV" OWNER TO "SysEngine";

--
-- TOC entry 459 (class 1259 OID 351755)
-- Name: TblLog_UserLoginSession_RMV_8000000000001; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000001" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000001" OWNER TO "SysEngine";

--
-- TOC entry 460 (class 1259 OID 351761)
-- Name: TblLog_UserLoginSession_RMV_8000000000002; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000002" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000002" OWNER TO "SysEngine";

--
-- TOC entry 461 (class 1259 OID 351767)
-- Name: TblLog_UserLoginSession_RMV_8000000000003; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000003" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000003" OWNER TO "SysEngine";

--
-- TOC entry 462 (class 1259 OID 351773)
-- Name: TblLog_UserLoginSession_RMV_8000000000004; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000004" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000004" OWNER TO "SysEngine";

--
-- TOC entry 463 (class 1259 OID 351779)
-- Name: TblLog_UserLoginSession_RMV_8000000000005; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000005" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000005" OWNER TO "SysEngine";

--
-- TOC entry 464 (class 1259 OID 351785)
-- Name: TblLog_UserLoginSession_RMV_8000000000006; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000006" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000006" OWNER TO "SysEngine";

--
-- TOC entry 465 (class 1259 OID 351791)
-- Name: TblLog_UserLoginSession_RMV_8000000000007; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000007" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000007" OWNER TO "SysEngine";

--
-- TOC entry 466 (class 1259 OID 351797)
-- Name: TblLog_UserLoginSession_RMV_8000000000008; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000008" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000008" OWNER TO "SysEngine";

--
-- TOC entry 467 (class 1259 OID 351803)
-- Name: TblLog_UserLoginSession_RMV_8000000000009; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000009" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000009" OWNER TO "SysEngine";

--
-- TOC entry 468 (class 1259 OID 351809)
-- Name: TblLog_UserLoginSession_RMV_8000000000010; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000010" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000010" OWNER TO "SysEngine";

--
-- TOC entry 469 (class 1259 OID 351815)
-- Name: TblLog_UserLoginSession_RMV_8000000000011; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000011" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000011" OWNER TO "SysEngine";

--
-- TOC entry 470 (class 1259 OID 351821)
-- Name: TblLog_UserLoginSession_RMV_8000000000012; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000012" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000012" OWNER TO "SysEngine";

--
-- TOC entry 471 (class 1259 OID 351827)
-- Name: TblLog_UserLoginSession_RMV_8000000000013; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000013" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000013" OWNER TO "SysEngine";

--
-- TOC entry 472 (class 1259 OID 351833)
-- Name: TblLog_UserLoginSession_RMV_8000000000014; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000014" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000014" OWNER TO "SysEngine";

--
-- TOC entry 473 (class 1259 OID 351839)
-- Name: TblLog_UserLoginSession_RMV_8000000000015; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000015" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000015" OWNER TO "SysEngine";

--
-- TOC entry 474 (class 1259 OID 351845)
-- Name: TblLog_UserLoginSession_RMV_8000000000016; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000016" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000016" OWNER TO "SysEngine";

--
-- TOC entry 475 (class 1259 OID 351851)
-- Name: TblLog_UserLoginSession_RMV_8000000000017; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000017" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000017" OWNER TO "SysEngine";

--
-- TOC entry 476 (class 1259 OID 351857)
-- Name: TblLog_UserLoginSession_RMV_8000000000018; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000018" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000018" OWNER TO "SysEngine";

--
-- TOC entry 477 (class 1259 OID 351863)
-- Name: TblLog_UserLoginSession_RMV_8000000000019; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000019" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000019" OWNER TO "SysEngine";

--
-- TOC entry 478 (class 1259 OID 351869)
-- Name: TblLog_UserLoginSession_RMV_8000000000020; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000020" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000020" OWNER TO "SysEngine";

--
-- TOC entry 479 (class 1259 OID 351875)
-- Name: TblLog_UserLoginSession_RMV_8000000000021; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000021" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000021" OWNER TO "SysEngine";

--
-- TOC entry 480 (class 1259 OID 351881)
-- Name: TblLog_UserLoginSession_RMV_8000000000022; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000022" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000022" OWNER TO "SysEngine";

--
-- TOC entry 481 (class 1259 OID 351887)
-- Name: TblLog_UserLoginSession_RMV_8000000000023; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000023" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000023" OWNER TO "SysEngine";

--
-- TOC entry 482 (class 1259 OID 351893)
-- Name: TblLog_UserLoginSession_RMV_8000000000024; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000024" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000024" OWNER TO "SysEngine";

--
-- TOC entry 483 (class 1259 OID 351899)
-- Name: TblLog_UserLoginSession_RMV_8000000000025; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000025" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000025" OWNER TO "SysEngine";

--
-- TOC entry 484 (class 1259 OID 351905)
-- Name: TblLog_UserLoginSession_RMV_8000000000026; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000026" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000026" OWNER TO "SysEngine";

--
-- TOC entry 485 (class 1259 OID 351911)
-- Name: TblLog_UserLoginSession_RMV_8000000000027; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000027" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000027" OWNER TO "SysEngine";

--
-- TOC entry 486 (class 1259 OID 351917)
-- Name: TblLog_UserLoginSession_RMV_8000000000028; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000028" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000028" OWNER TO "SysEngine";

--
-- TOC entry 487 (class 1259 OID 351923)
-- Name: TblLog_UserLoginSession_RMV_8000000000029; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000029" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000029" OWNER TO "SysEngine";

--
-- TOC entry 488 (class 1259 OID 351929)
-- Name: TblLog_UserLoginSession_RMV_8000000000030; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000030" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000030" OWNER TO "SysEngine";

--
-- TOC entry 489 (class 1259 OID 351935)
-- Name: TblLog_UserLoginSession_RMV_8000000000031; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000031" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblLog_UserLoginSession_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "APIWebToken" character varying,
    "OptionsList" json,
    "Branch_RefID" bigint,
    "UserRole_RefID" bigint,
    "SessionStartDateTimeTZ" timestamp with time zone,
    "SessionFinishDateTimeTZ" timestamp with time zone,
    "SessionAutoStartDateTimeTZ" timestamp with time zone,
    "SessionAutoFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000031" OWNER TO "SysEngine";

--
-- TOC entry 490 (class 1259 OID 351941)
-- Name: TblMapper_LDAPUserToPerson_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblMapper_LDAPUserToPerson_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblMapper_LDAPUserToPerson_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 491 (class 1259 OID 351942)
-- Name: TblMapper_LDAPUserToPerson; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblMapper_LDAPUserToPerson" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblMapper_LDAPUserToPerson_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "LDAPUser_RefID" bigint,
    "Person_RefID" bigint
);


ALTER TABLE "SchSysConfig"."TblMapper_LDAPUserToPerson" OWNER TO "SysEngine";

--
-- TOC entry 492 (class 1259 OID 351948)
-- Name: TblMapper_UserToLDAPUser_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblMapper_UserToLDAPUser_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblMapper_UserToLDAPUser_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 493 (class 1259 OID 351949)
-- Name: TblMapper_UserToLDAPUser; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblMapper_UserToLDAPUser" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblMapper_UserToLDAPUser_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "LDAPUserID" character varying(256),
    "EncryptedPassword" bytea,
    "PasswordShadow" character varying(32)
);


ALTER TABLE "SchSysConfig"."TblMapper_UserToLDAPUser" OWNER TO "SysEngine";

--
-- TOC entry 494 (class 1259 OID 351955)
-- Name: TblMapper_UserToUserRole_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblMapper_UserToUserRole_Sys_RPK_seq"
    START WITH 475
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblMapper_UserToUserRole_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 495 (class 1259 OID 351956)
-- Name: TblMapper_UserToUserRole; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblMapper_UserToUserRole" (
    "Sys_PID" bigint,
    "Sys_SID" bigint,
    "Sys_RPK" bigint DEFAULT nextval('"SchSysConfig"."TblMapper_UserToUserRole_Sys_RPK_seq"'::regclass) NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Edit_LoginSession_RefID" bigint,
    "Sys_Data_Edit_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Delete_LoginSession_RefID" bigint,
    "Sys_Data_Delete_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Hidden_LoginSession_RefID" bigint,
    "Sys_Data_Hidden_DateTimeTZ" timestamp with time zone,
    "Sys_Data_Authentication_LoginSession_RefID" bigint,
    "Sys_Data_Authentication_DateTimeTZ" timestamp with time zone,
    "Sys_Partition_RemovableRecord_Key_RefID" bigint,
    "Sys_Branch_RefID" bigint,
    "Sys_DataIntegrityShadow" character varying(32),
    "User_RefID" bigint,
    "UserRole_RefID" bigint,
    "CallProjectSyntax" character varying(256),
    "ValidStartDateTimeTZ" timestamp with time zone,
    "ValidFinishDateTimeTZ" timestamp with time zone
);


ALTER TABLE "SchSysConfig"."TblMapper_UserToUserRole" OWNER TO "SysEngine";

--
-- TOC entry 496 (class 1259 OID 351962)
-- Name: TblRotateLog_API; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblRotateLog_API" (
    "Sys_RotateID" bigint NOT NULL,
    "Sys_RPK" bigint NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "HostIPAddress" cidr,
    "URL" character varying(256),
    "NavigatorUserAgent" character varying(256),
    "RequestDateTimeTZ" timestamp with time zone,
    "RequestHTTPHeader" json,
    "RequestHTTPBody" character varying,
    "ResponseDateTimeTZ" timestamp with time zone,
    "ResponseHTTPStatus" smallint,
    "ResponseHTTPHeader" json,
    "ResponseHTTPBody" character varying
);


ALTER TABLE "SchSysConfig"."TblRotateLog_API" OWNER TO "SysEngine";

--
-- TOC entry 497 (class 1259 OID 351967)
-- Name: TblRotateLog_API_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblRotateLog_API_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblRotateLog_API_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 498 (class 1259 OID 351968)
-- Name: TblRotateLog_FailedUserLogin; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblRotateLog_FailedUserLogin" (
    "Sys_RotateID" bigint NOT NULL,
    "Sys_RPK" bigint NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "LoginUser" character varying(256),
    "LoginPassword" character varying(256),
    "LoginDateTimeTZ" timestamp with time zone,
    "NavigatorUserAgent" character varying(256),
    "NavigatorPlatform" character varying(64),
    "HostIPAddress" cidr,
    "HostMACAddress" macaddr,
    "HostName" character varying(128)
);


ALTER TABLE "SchSysConfig"."TblRotateLog_FailedUserLogin" OWNER TO "SysEngine";

--
-- TOC entry 499 (class 1259 OID 351973)
-- Name: TblRotateLog_FailedUserLogin_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblRotateLog_FailedUserLogin_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblRotateLog_FailedUserLogin_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 500 (class 1259 OID 351974)
-- Name: TblRotateLog_FileUploadStagingArea; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingArea" (
    "Sys_RotateID" bigint NOT NULL,
    "Sys_RPK" bigint NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "ApplicationKey" character varying(256)
);


ALTER TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingArea" OWNER TO "SysEngine";

--
-- TOC entry 501 (class 1259 OID 351979)
-- Name: TblRotateLog_FileUploadStagingAreaDetail; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail" (
    "Sys_RotateID" bigint NOT NULL,
    "Sys_RPK" bigint NOT NULL,
    "Sys_Data_Annotation" character varying(1024),
    "Sys_Data_Entry_LoginSession_RefID" bigint,
    "Sys_Data_Entry_DateTimeTZ" timestamp with time zone,
    "RotateLog_FileUploadStagingArea_RefRPK" bigint,
    "Sequence" smallint,
    "Name" character varying(256),
    "Size" bigint,
    "MIME" character varying(128),
    "Extension" character varying(32),
    "LastModifiedDateTimeTZ" character varying(128),
    "LastModifiedUnixTimestamp" bigint
);


ALTER TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail" OWNER TO "SysEngine";

--
-- TOC entry 502 (class 1259 OID 351984)
-- Name: TblRotateLog_FileUploadStagingAreaDetail_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 503 (class 1259 OID 351985)
-- Name: TblRotateLog_FileUploadStagingArea_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblRotateLog_FileUploadStagingArea_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblRotateLog_FileUploadStagingArea_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 504 (class 1259 OID 351986)
-- Name: TblRotateLog_WebPageRequest; Type: TABLE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE TABLE "SchSysConfig"."TblRotateLog_WebPageRequest" (
    "Sys_RotateID" bigint NOT NULL,
    "Sys_RPK" bigint NOT NULL,
    "RequestDateTimeTZ" timestamp with time zone,
    "UniqueToken" character varying(256),
    "ContentShadow" character varying(32)
);


ALTER TABLE "SchSysConfig"."TblRotateLog_WebPageRequest" OWNER TO "SysEngine";

--
-- TOC entry 505 (class 1259 OID 351989)
-- Name: TblRotateLog_WebPageRequest_Sys_RPK_seq; Type: SEQUENCE; Schema: SchSysConfig; Owner: SysEngine
--

CREATE SEQUENCE "SchSysConfig"."TblRotateLog_WebPageRequest_Sys_RPK_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SchSysConfig"."TblRotateLog_WebPageRequest_Sys_RPK_seq" OWNER TO "SysEngine";

--
-- TOC entry 4327 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_DEF" DEFAULT;


--
-- TOC entry 4328 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4329 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4330 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4331 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4332 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4333 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4334 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4335 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4336 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4337 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4338 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4339 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4340 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4341 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4342 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4343 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4344 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4345 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4346 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4347 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4348 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4349 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4350 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4351 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4352 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4353 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4354 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4355 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4356 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4357 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4358 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4359 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4360 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4361 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_DEF" DEFAULT;


--
-- TOC entry 4362 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4363 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4364 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4365 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4366 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4367 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4368 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4369 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4370 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4371 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4372 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4373 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4374 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4375 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4376 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4377 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4378 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4379 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4380 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4381 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4382 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4383 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4384 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4385 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4386 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4387 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4388 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4389 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4390 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4391 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4392 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4393 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4394 (class 0 OID 0)
-- Name: TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4395 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_DEF" DEFAULT;


--
-- TOC entry 4396 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4397 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4398 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4399 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4400 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4401 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4402 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4403 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4404 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4405 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4406 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4407 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4408 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4409 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4410 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4411 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4412 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4413 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4414 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4415 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4416 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4417 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4418 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4419 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4420 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4421 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4422 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4423 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4424 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4425 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4426 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4427 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4428 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4429 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_DEF" DEFAULT;


--
-- TOC entry 4430 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4431 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4432 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4433 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4434 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4435 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4436 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4437 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4438 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4439 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4440 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4441 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4442 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4443 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4444 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4445 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4446 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4447 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4448 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4449 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4450 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4451 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4452 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4453 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4454 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4455 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4456 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4457 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4458 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4459 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4460 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4461 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4462 (class 0 OID 0)
-- Name: TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4463 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_DEF" DEFAULT;


--
-- TOC entry 4464 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4465 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4466 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4467 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4468 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4469 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4470 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4471 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4472 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4473 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4474 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4475 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4476 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4477 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4478 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4479 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4480 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4481 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4482 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4483 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4484 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4485 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4486 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4487 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4488 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4489 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4490 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4491 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4492 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4493 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4494 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4495 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4496 (class 0 OID 0)
-- Name: TblLog_EMailDistributionSchedule_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4497 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_DEF; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_DEF" DEFAULT;


--
-- TOC entry 4498 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_PMT; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_PMT" FOR VALUES IN (NULL);


--
-- TOC entry 4499 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV" FOR VALUES IN ('8000000000001', '8000000000002', '8000000000003', '8000000000004', '8000000000005', '8000000000006', '8000000000007', '8000000000008', '8000000000009', '8000000000010', '8000000000011', '8000000000012', '8000000000013', '8000000000014', '8000000000015', '8000000000016', '8000000000017', '8000000000018', '8000000000019', '8000000000020', '8000000000021', '8000000000022', '8000000000023', '8000000000024', '8000000000025', '8000000000026', '8000000000027', '8000000000028', '8000000000029', '8000000000030', '8000000000031');


--
-- TOC entry 4500 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000001; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000001" FOR VALUES IN ('8000000000001');


--
-- TOC entry 4501 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000002; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000002" FOR VALUES IN ('8000000000002');


--
-- TOC entry 4502 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000003; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000003" FOR VALUES IN ('8000000000003');


--
-- TOC entry 4503 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000004; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000004" FOR VALUES IN ('8000000000004');


--
-- TOC entry 4504 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000005; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000005" FOR VALUES IN ('8000000000005');


--
-- TOC entry 4505 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000006; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000006" FOR VALUES IN ('8000000000006');


--
-- TOC entry 4506 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000007; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000007" FOR VALUES IN ('8000000000007');


--
-- TOC entry 4507 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000008; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000008" FOR VALUES IN ('8000000000008');


--
-- TOC entry 4508 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000009; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000009" FOR VALUES IN ('8000000000009');


--
-- TOC entry 4509 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000010; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000010" FOR VALUES IN ('8000000000010');


--
-- TOC entry 4510 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000011; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000011" FOR VALUES IN ('8000000000011');


--
-- TOC entry 4511 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000012; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000012" FOR VALUES IN ('8000000000012');


--
-- TOC entry 4512 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000013; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000013" FOR VALUES IN ('8000000000013');


--
-- TOC entry 4513 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000014; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000014" FOR VALUES IN ('8000000000014');


--
-- TOC entry 4514 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000015; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000015" FOR VALUES IN ('8000000000015');


--
-- TOC entry 4515 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000016; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000016" FOR VALUES IN ('8000000000016');


--
-- TOC entry 4516 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000017; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000017" FOR VALUES IN ('8000000000017');


--
-- TOC entry 4517 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000018; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000018" FOR VALUES IN ('8000000000018');


--
-- TOC entry 4518 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000019; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000019" FOR VALUES IN ('8000000000019');


--
-- TOC entry 4519 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000020; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000020" FOR VALUES IN ('8000000000020');


--
-- TOC entry 4520 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000021; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000021" FOR VALUES IN ('8000000000021');


--
-- TOC entry 4521 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000022; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000022" FOR VALUES IN ('8000000000022');


--
-- TOC entry 4522 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000023; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000023" FOR VALUES IN ('8000000000023');


--
-- TOC entry 4523 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000024; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000024" FOR VALUES IN ('8000000000024');


--
-- TOC entry 4524 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000025; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000025" FOR VALUES IN ('8000000000025');


--
-- TOC entry 4525 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000026; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000026" FOR VALUES IN ('8000000000026');


--
-- TOC entry 4526 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000027; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000027" FOR VALUES IN ('8000000000027');


--
-- TOC entry 4527 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000028; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000028" FOR VALUES IN ('8000000000028');


--
-- TOC entry 4528 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000029; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000029" FOR VALUES IN ('8000000000029');


--
-- TOC entry 4529 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000030; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000030" FOR VALUES IN ('8000000000030');


--
-- TOC entry 4530 (class 0 OID 0)
-- Name: TblLog_UserLoginSession_RMV_8000000000031; Type: TABLE ATTACH; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLog_UserLoginSession_RMV" ATTACH PARTITION "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000031" FOR VALUES IN ('8000000000031');


--
-- TOC entry 4775 (class 2606 OID 357535)
-- Name: TblAppObject_AuthorizationSequenceActionType TblAppObject_AuthorizationSequenceActionType_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceActionType"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceActionType_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4781 (class 2606 OID 357537)
-- Name: TblAppObject_AuthorizationSequenceEdgeMemberType TblAppObject_AuthorizationSequenceEdgeMemberType_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMemberType"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceEdgeMemberType_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4779 (class 2606 OID 357539)
-- Name: TblAppObject_AuthorizationSequenceEdgeMember TblAppObject_AuthorizationSequenceEdgeMember_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceEdgeMember"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceEdgeMember_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4777 (class 2606 OID 357541)
-- Name: TblAppObject_AuthorizationSequenceEdge TblAppObject_AuthorizationSequenceEdge_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceEdge"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceEdge_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4785 (class 2606 OID 357543)
-- Name: TblAppObject_AuthorizationSequenceNodeType TblAppObject_AuthorizationSequenceNodeType_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceNodeType"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceNodeType_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4783 (class 2606 OID 357545)
-- Name: TblAppObject_AuthorizationSequenceNode TblAppObject_AuthorizationSequenceNode_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceNode"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceNode_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4787 (class 2606 OID 357547)
-- Name: TblAppObject_AuthorizationSequenceVersion TblAppObject_AuthorizationSequenceVersion_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequenceVersion"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequenceVersion_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4773 (class 2606 OID 357549)
-- Name: TblAppObject_AuthorizationSequence TblAppObject_AuthorizationSequence_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_AuthorizationSequence"
    ADD CONSTRAINT "TblAppObject_AuthorizationSequence_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4789 (class 2606 OID 357551)
-- Name: TblAppObject_InstitutionBranch TblAppObject_InstitutionBranch_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_InstitutionBranch"
    ADD CONSTRAINT "TblAppObject_InstitutionBranch_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4791 (class 2606 OID 357553)
-- Name: TblAppObject_InstitutionCompany TblAppObject_InstitutionCompany_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_InstitutionCompany"
    ADD CONSTRAINT "TblAppObject_InstitutionCompany_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4793 (class 2606 OID 357555)
-- Name: TblAppObject_InstitutionRegional TblAppObject_InstitutionRegional_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_InstitutionRegional"
    ADD CONSTRAINT "TblAppObject_InstitutionRegional_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4795 (class 2606 OID 357557)
-- Name: TblAppObject_Menu TblAppObject_Menu_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_Menu"
    ADD CONSTRAINT "TblAppObject_Menu_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4799 (class 2606 OID 357559)
-- Name: TblAppObject_ModuleReport TblAppObject_ModuleReport_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_ModuleReport"
    ADD CONSTRAINT "TblAppObject_ModuleReport_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4797 (class 2606 OID 357561)
-- Name: TblAppObject_Module TblAppObject_Module_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_Module"
    ADD CONSTRAINT "TblAppObject_Module_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4801 (class 2606 OID 357563)
-- Name: TblAppObject_Parameter TblAppObject_Parameter_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_Parameter"
    ADD CONSTRAINT "TblAppObject_Parameter_pkey" PRIMARY KEY ("Sys_Branch_RefID", "Key");


--
-- TOC entry 4805 (class 2606 OID 357565)
-- Name: TblAppObject_UserRoleDelegation TblAppObject_UserRoleDelegation_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_UserRoleDelegation"
    ADD CONSTRAINT "TblAppObject_UserRoleDelegation_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4807 (class 2606 OID 357567)
-- Name: TblAppObject_UserRolePrivilegesMenu TblAppObject_UserRolePrivilegesMenu_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_UserRolePrivilegesMenu"
    ADD CONSTRAINT "TblAppObject_UserRolePrivilegesMenu_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4803 (class 2606 OID 357569)
-- Name: TblAppObject_UserRole TblAppObject_UserRole_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblAppObject_UserRole"
    ADD CONSTRAINT "TblAppObject_UserRole_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4809 (class 2606 OID 357571)
-- Name: TblDBObject_ForeignObject TblDBObject_ForeignObject_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_ForeignObject"
    ADD CONSTRAINT "TblDBObject_ForeignObject_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4813 (class 2606 OID 357573)
-- Name: TblDBObject_Partition_RemovableRecord_Key TblDBObject_Partition_RemovableRecord_Key_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Key"
    ADD CONSTRAINT "TblDBObject_Partition_RemovableRecord_Key_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4815 (class 2606 OID 357575)
-- Name: TblDBObject_Partition_RemovableRecord_Parameter TblDBObject_Partition_RemovableRecord_Parameter_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_Partition_RemovableRecord_Parameter"
    ADD CONSTRAINT "TblDBObject_Partition_RemovableRecord_Parameter_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4817 (class 2606 OID 357577)
-- Name: TblDBObject_Schema TblDBObject_Schema_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_Schema"
    ADD CONSTRAINT "TblDBObject_Schema_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4819 (class 2606 OID 357579)
-- Name: TblDBObject_Table TblDBObject_Table_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_Table"
    ADD CONSTRAINT "TblDBObject_Table_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4821 (class 2606 OID 357581)
-- Name: TblDBObject_User TblDBObject_User_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_User"
    ADD CONSTRAINT "TblDBObject_User_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4811 (class 2606 OID 357583)
-- Name: TblDBObject_Parameter TblDBbject_Parameter_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblDBObject_Parameter"
    ADD CONSTRAINT "TblDBbject_Parameter_pkey" PRIMARY KEY ("Key");


--
-- TOC entry 4823 (class 2606 OID 357585)
-- Name: TblEMailDistribution_Recipient TblEMailDistribution_Recipient_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblEMailDistribution_Recipient"
    ADD CONSTRAINT "TblEMailDistribution_Recipient_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4825 (class 2606 OID 357587)
-- Name: TblEMailDistribution_Schedule TblEMailDistribution_Schedule_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblEMailDistribution_Schedule"
    ADD CONSTRAINT "TblEMailDistribution_Schedule_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4827 (class 2606 OID 357589)
-- Name: TblEmailDistribution_Recipient TblEmailDistribution_Recipient_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblEmailDistribution_Recipient"
    ADD CONSTRAINT "TblEmailDistribution_Recipient_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4829 (class 2606 OID 357591)
-- Name: TblEmailDistribution_Schedule TblEmailDistribution_Schedule_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblEmailDistribution_Schedule"
    ADD CONSTRAINT "TblEmailDistribution_Schedule_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 4831 (class 2606 OID 357593)
-- Name: TblLDAPObject_User TblLDAPObject_User_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblLDAPObject_User"
    ADD CONSTRAINT "TblLDAPObject_User_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 5025 (class 2606 OID 357595)
-- Name: TblMapper_LDAPUserToPerson TblMapper_LDAPUserToPerson_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblMapper_LDAPUserToPerson"
    ADD CONSTRAINT "TblMapper_LDAPUserToPerson_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 5027 (class 2606 OID 357597)
-- Name: TblMapper_UserToLDAPUser TblMapper_UserToLDAPUser_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblMapper_UserToLDAPUser"
    ADD CONSTRAINT "TblMapper_UserToLDAPUser_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 5029 (class 2606 OID 357599)
-- Name: TblMapper_UserToUserRole TblMapper_UserToLUserRole_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblMapper_UserToUserRole"
    ADD CONSTRAINT "TblMapper_UserToLUserRole_pkey" PRIMARY KEY ("Sys_RPK");


--
-- TOC entry 5031 (class 2606 OID 357601)
-- Name: TblRotateLog_API TblRotateLog_API_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblRotateLog_API"
    ADD CONSTRAINT "TblRotateLog_API_pkey" PRIMARY KEY ("Sys_RotateID");


--
-- TOC entry 5033 (class 2606 OID 357603)
-- Name: TblRotateLog_FailedUserLogin TblRotateLog_FailedUserLogin_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblRotateLog_FailedUserLogin"
    ADD CONSTRAINT "TblRotateLog_FailedUserLogin_pkey" PRIMARY KEY ("Sys_RotateID");


--
-- TOC entry 5037 (class 2606 OID 357605)
-- Name: TblRotateLog_FileUploadStagingAreaDetail TblRotateLog_FileUploadStagingAreaDetail_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblRotateLog_FileUploadStagingAreaDetail"
    ADD CONSTRAINT "TblRotateLog_FileUploadStagingAreaDetail_pkey" PRIMARY KEY ("Sys_RotateID");


--
-- TOC entry 5035 (class 2606 OID 357607)
-- Name: TblRotateLog_FileUploadStagingArea TblRotateLog_FileUploadStagingArea_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblRotateLog_FileUploadStagingArea"
    ADD CONSTRAINT "TblRotateLog_FileUploadStagingArea_pkey" PRIMARY KEY ("Sys_RotateID");


--
-- TOC entry 5039 (class 2606 OID 357609)
-- Name: TblRotateLog_WebPageRequest TblRotateLog_WebPageRequest_pkey; Type: CONSTRAINT; Schema: SchSysConfig; Owner: SysEngine
--

ALTER TABLE ONLY "SchSysConfig"."TblRotateLog_WebPageRequest"
    ADD CONSTRAINT "TblRotateLog_WebPageRequest_pkey" PRIMARY KEY ("Sys_RotateID");


--
-- TOC entry 4842 (class 1259 OID 357610)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx10; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx10" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4843 (class 1259 OID 357611)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx11; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx11" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4844 (class 1259 OID 357612)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx12; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx12" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4845 (class 1259 OID 357613)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx13; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx13" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4846 (class 1259 OID 357614)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx14; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx14" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4847 (class 1259 OID 357615)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx15; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx15" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4848 (class 1259 OID 357616)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx16; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx16" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4849 (class 1259 OID 357617)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx17; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx17" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4850 (class 1259 OID 357618)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx18; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx18" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4851 (class 1259 OID 357619)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx19; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx19" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4852 (class 1259 OID 357620)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx20; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx20" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4853 (class 1259 OID 357621)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx21; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx21" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4854 (class 1259 OID 357622)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx22; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx22" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4855 (class 1259 OID 357623)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx23; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx23" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4856 (class 1259 OID 357624)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx24; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx24" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4857 (class 1259 OID 357625)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx25; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx25" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4858 (class 1259 OID 357626)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx26; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx26" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4859 (class 1259 OID 357627)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx27; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx27" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4860 (class 1259 OID 357628)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx28; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx28" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4861 (class 1259 OID 357629)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx29; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx29" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4862 (class 1259 OID 357630)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx30; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx30" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4863 (class 1259 OID 357631)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx31; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx31" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4864 (class 1259 OID 357632)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx32; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx32" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4865 (class 1259 OID 357633)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx33; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx33" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4866 (class 1259 OID 357634)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx34; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx34" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4867 (class 1259 OID 357635)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx35; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx35" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4868 (class 1259 OID 357636)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx36; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx36" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4869 (class 1259 OID 357637)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx37; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx37" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4870 (class 1259 OID 357638)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx38; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx38" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4871 (class 1259 OID 357639)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx39; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx39" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4872 (class 1259 OID 357640)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx40; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx40" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4873 (class 1259 OID 357641)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx41; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx41" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4874 (class 1259 OID 357642)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx42; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx42" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4875 (class 1259 OID 357643)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx43; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx43" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4876 (class 1259 OID 357644)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx44; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx44" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4877 (class 1259 OID 357645)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx45; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx45" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4878 (class 1259 OID 357646)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx46; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx46" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4879 (class 1259 OID 357647)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx47; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx47" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4880 (class 1259 OID 357648)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx48; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx48" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4881 (class 1259 OID 357649)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx49; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx49" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4882 (class 1259 OID 357650)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx50; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx50" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4883 (class 1259 OID 357651)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx51; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx51" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4884 (class 1259 OID 357652)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx52; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx52" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4885 (class 1259 OID 357653)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx53; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx53" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4886 (class 1259 OID 357654)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx54; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx54" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4887 (class 1259 OID 357655)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx55; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx55" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4888 (class 1259 OID 357656)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx56; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx56" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4889 (class 1259 OID 357657)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx57; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx57" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4890 (class 1259 OID 357658)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx58; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx58" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4891 (class 1259 OID 357659)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx59; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx59" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4892 (class 1259 OID 357660)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx60; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx60" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4893 (class 1259 OID 357661)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx61; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx61" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4894 (class 1259 OID 357662)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx62; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx62" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4895 (class 1259 OID 357663)
-- Name: TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx63; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocum_Sys_Partition_RemovableRecor_idx63" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentHistory_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4833 (class 1259 OID 357664)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx1; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx1" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4834 (class 1259 OID 357665)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx2; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx2" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4835 (class 1259 OID 357666)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx3; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx3" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4836 (class 1259 OID 357667)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx4; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx4" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4837 (class 1259 OID 357668)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx5; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx5" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4838 (class 1259 OID 357669)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx6; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx6" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4839 (class 1259 OID 357670)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx7; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx7" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4840 (class 1259 OID 357671)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx8; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx8" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4841 (class 1259 OID 357672)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx9; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecor_idx9" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4832 (class 1259 OID 357673)
-- Name: TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecord_idx; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_AuthSeq_BusinessDocume_Sys_Partition_RemovableRecord_idx" ON "SchSysConfig"."TblLog_AuthSeq_BusinessDocumentCurrentStage_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4970 (class 1259 OID 357674)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx10; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx10" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4971 (class 1259 OID 357675)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx11; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx11" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4972 (class 1259 OID 357676)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx12; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx12" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4973 (class 1259 OID 357677)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx13; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx13" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4974 (class 1259 OID 357678)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx14; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx14" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4975 (class 1259 OID 357679)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx15; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx15" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4976 (class 1259 OID 357680)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx16; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx16" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4977 (class 1259 OID 357681)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx17; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx17" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4978 (class 1259 OID 357682)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx18; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx18" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4979 (class 1259 OID 357683)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx19; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx19" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4980 (class 1259 OID 357684)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx20; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx20" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4981 (class 1259 OID 357685)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx21; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx21" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4982 (class 1259 OID 357686)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx22; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx22" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4983 (class 1259 OID 357687)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx23; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx23" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4984 (class 1259 OID 357688)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx24; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx24" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4985 (class 1259 OID 357689)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx25; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx25" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4986 (class 1259 OID 357690)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx26; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx26" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4987 (class 1259 OID 357691)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx27; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx27" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4988 (class 1259 OID 357692)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx28; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx28" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4989 (class 1259 OID 357693)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx29; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx29" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4990 (class 1259 OID 357694)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx30; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx30" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4991 (class 1259 OID 357695)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx31; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx31" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4896 (class 1259 OID 357696)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx32; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx32" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4897 (class 1259 OID 357697)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx33; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx33" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4898 (class 1259 OID 357698)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx34; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx34" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4899 (class 1259 OID 357699)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx35; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx35" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4900 (class 1259 OID 357700)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx36; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx36" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4901 (class 1259 OID 357701)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx37; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx37" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4902 (class 1259 OID 357702)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx38; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx38" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4903 (class 1259 OID 357703)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx39; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx39" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4904 (class 1259 OID 357704)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx40; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx40" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4905 (class 1259 OID 357705)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx41; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx41" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4906 (class 1259 OID 357706)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx42; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx42" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4907 (class 1259 OID 357707)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx43; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx43" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4908 (class 1259 OID 357708)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx44; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx44" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4909 (class 1259 OID 357709)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx45; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx45" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4910 (class 1259 OID 357710)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx46; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx46" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4911 (class 1259 OID 357711)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx47; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx47" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4912 (class 1259 OID 357712)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx48; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx48" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4913 (class 1259 OID 357713)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx49; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx49" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4914 (class 1259 OID 357714)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx50; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx50" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4915 (class 1259 OID 357715)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx51; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx51" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4916 (class 1259 OID 357716)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx52; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx52" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4917 (class 1259 OID 357717)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx53; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx53" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4918 (class 1259 OID 357718)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx54; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx54" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4919 (class 1259 OID 357719)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx55; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx55" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4920 (class 1259 OID 357720)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx56; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx56" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4921 (class 1259 OID 357721)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx57; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx57" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4922 (class 1259 OID 357722)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx58; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx58" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4923 (class 1259 OID 357723)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx59; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx59" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4924 (class 1259 OID 357724)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx60; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx60" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4925 (class 1259 OID 357725)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx61; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx61" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4926 (class 1259 OID 357726)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx62; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx62" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4927 (class 1259 OID 357727)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx63; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx63" ON "SchSysConfig"."TblLog_EMailDistributionScheduleAttachment_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4928 (class 1259 OID 357728)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx64; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx64" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4929 (class 1259 OID 357729)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx65; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx65" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4930 (class 1259 OID 357730)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx66; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx66" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4931 (class 1259 OID 357731)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx67; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx67" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4932 (class 1259 OID 357732)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx68; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx68" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4933 (class 1259 OID 357733)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx69; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx69" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4934 (class 1259 OID 357734)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx70; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx70" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4935 (class 1259 OID 357735)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx71; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx71" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4936 (class 1259 OID 357736)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx72; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx72" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4937 (class 1259 OID 357737)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx73; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx73" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4938 (class 1259 OID 357738)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx74; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx74" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4939 (class 1259 OID 357739)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx75; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx75" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4940 (class 1259 OID 357740)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx76; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx76" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4941 (class 1259 OID 357741)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx77; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx77" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4942 (class 1259 OID 357742)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx78; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx78" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4943 (class 1259 OID 357743)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx79; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx79" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4944 (class 1259 OID 357744)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx80; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx80" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4945 (class 1259 OID 357745)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx81; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx81" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4946 (class 1259 OID 357746)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx82; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx82" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4947 (class 1259 OID 357747)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx83; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx83" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4948 (class 1259 OID 357748)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx84; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx84" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4949 (class 1259 OID 357749)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx85; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx85" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4950 (class 1259 OID 357750)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx86; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx86" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4951 (class 1259 OID 357751)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx87; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx87" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4952 (class 1259 OID 357752)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx88; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx88" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4953 (class 1259 OID 357753)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx89; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx89" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4954 (class 1259 OID 357754)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx90; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx90" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4955 (class 1259 OID 357755)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx91; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx91" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4956 (class 1259 OID 357756)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx92; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx92" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4957 (class 1259 OID 357757)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx93; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx93" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4958 (class 1259 OID 357758)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx94; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx94" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4959 (class 1259 OID 357759)
-- Name: TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx95; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSche_Sys_Partition_RemovableRecor_idx95" ON "SchSysConfig"."TblLog_EMailDistributionScheduleRecipient_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4961 (class 1259 OID 357760)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx1; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx1" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4962 (class 1259 OID 357761)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx2; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx2" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4963 (class 1259 OID 357762)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx3; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx3" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4964 (class 1259 OID 357763)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx4; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx4" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4965 (class 1259 OID 357764)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx5; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx5" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4966 (class 1259 OID 357765)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx6; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx6" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4967 (class 1259 OID 357766)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx7; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx7" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4968 (class 1259 OID 357767)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx8; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx8" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4969 (class 1259 OID 357768)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx9; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecor_idx9" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4960 (class 1259 OID 357769)
-- Name: TblLog_EMailDistributionSched_Sys_Partition_RemovableRecord_idx; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_EMailDistributionSched_Sys_Partition_RemovableRecord_idx" ON "SchSysConfig"."TblLog_EMailDistributionSchedule_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4992 (class 1259 OID 357770)
-- Name: TblLog_UserLoginSession_PMT_Sys_Partition_RemovableRecord_K_idx; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_PMT_Sys_Partition_RemovableRecord_K_idx" ON "SchSysConfig"."TblLog_UserLoginSession_PMT" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4994 (class 1259 OID 357771)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx1; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx1" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000002" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4995 (class 1259 OID 357772)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx2; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx2" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000003" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4996 (class 1259 OID 357773)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx3; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx3" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000004" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4997 (class 1259 OID 357774)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx4; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx4" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000005" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4998 (class 1259 OID 357775)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx5; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx5" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000006" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4999 (class 1259 OID 357776)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx6; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx6" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000007" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5000 (class 1259 OID 357777)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx7; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx7" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000008" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5001 (class 1259 OID 357778)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx8; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx8" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000009" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5002 (class 1259 OID 357779)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx9; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecor_idx9" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000010" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 4993 (class 1259 OID 357780)
-- Name: TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecord_idx; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV_8_Sys_Partition_RemovableRecord_idx" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000001" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5003 (class 1259 OID 357781)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx10; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx10" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000011" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5004 (class 1259 OID 357782)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx11; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx11" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000012" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5005 (class 1259 OID 357783)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx12; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx12" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000013" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5006 (class 1259 OID 357784)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx13; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx13" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000014" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5007 (class 1259 OID 357785)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx14; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx14" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000015" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5008 (class 1259 OID 357786)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx15; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx15" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000016" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5009 (class 1259 OID 357787)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx16; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx16" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000017" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5010 (class 1259 OID 357788)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx17; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx17" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000018" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5011 (class 1259 OID 357789)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx18; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx18" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000019" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5012 (class 1259 OID 357790)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx19; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx19" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000020" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5013 (class 1259 OID 357791)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx20; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx20" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000021" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5014 (class 1259 OID 357792)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx21; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx21" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000022" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5015 (class 1259 OID 357793)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx22; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx22" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000023" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5016 (class 1259 OID 357794)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx23; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx23" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000024" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5017 (class 1259 OID 357795)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx24; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx24" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000025" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5018 (class 1259 OID 357796)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx25; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx25" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000026" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5019 (class 1259 OID 357797)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx26; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx26" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000027" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5020 (class 1259 OID 357798)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx27; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx27" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000028" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5021 (class 1259 OID 357799)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx28; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx28" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000029" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5022 (class 1259 OID 357800)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx29; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx29" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000030" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


--
-- TOC entry 5023 (class 1259 OID 357801)
-- Name: TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx30; Type: INDEX; Schema: SchSysConfig; Owner: SysEngine
--

CREATE INDEX "TblLog_UserLoginSession_RMV__Sys_Partition_RemovableRecor_idx30" ON "SchSysConfig"."TblLog_UserLoginSession_RMV_8000000000031" USING btree ("Sys_Partition_RemovableRecord_Key_RefID");


-- Completed on 2021-10-13 22:57:02 WIB

--
-- PostgreSQL database dump complete
--

