Cleaning:
Trim account and amount fields, handle NULL/blank values, and default missing numeric and date fields.

Standardization:
Format monetary amounts to fixed 15-digit numeric strings, enforce indicator flags (Y/N/U), standardize deposit type, term codes, and system identifiers to IDS.

Enrichment:
Derive deposit policy numbers, hold verification indicators, term descriptions, and system metadata.

Normalization:
Convert legacy 7-digit dates to 8-digit YYYYMMDD format and normalize negative and zero-filled values.

Validation:
Apply business rules for unknown, invalid, and special-case pledge and date conditions.
----------------------------------------------

Capture execution metadata and primary key details for records failing pledge or balance amount conversion.

Identify and log the source error column (curr_balance or current_pledge_amt) with a standard error description.

Route invalid records to the error output for audit and reporting without stopping the ETL flow.
---------------------------------------------
Populate execution and audit metadata (execution datetime, execution GUID, package ID) for failed records.

Assign contextual error descriptions based on data conditions (e.g., missing or invalid account details from IDS source).

Capture system, application, entity, and primary key details to support error tracking and downstream reconciliation.
----------------------------------------------
Union Output

Component: IDS_T_UALL_ErrorData
Combines error outputs from multiple error-handling paths (invalid pledge amount, error description, and other derived error records).
Destination: [dbo].[IDS_T_RCNT_ErrorData] / downstream failed-record handling.

Consolidated fields include execution metadata (execution datetime, execution GUID, package ID), system and application identifiers, data entity name, primary key column name and value, error description, and source error column details.
