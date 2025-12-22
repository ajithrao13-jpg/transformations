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
