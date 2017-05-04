# CTDL_Json_Validation_Schema

[![Travis CI Status][travis-ci-badge]][travis-ci]

[travis-ci]: https://travis-ci.org/CredentialEngine/CTDL_Json_Validation_Schema
[travis-ci-badge]: https://travis-ci.org/CredentialEngine/CTDL_Json_Validation_Schema.svg?branch=master

Discussions and samples for the json validation schema for CTDL. Primarily how the validation schema should be generated/configured, and topics on migrating to the credential registry.


## Testing

In order to test a new release, complete the follow steps:

1. Create a new version of the schemas
1. Create a new folder (eg. `Schema-2017-06-30`) and place the new schemas inside
1. Update the symbolic link called `latest` to point to the latest release (eg. `Schema-2017-06-30`)
1. Update the test cases (if necessary).
   They are located in the folder `/test_data` with subsequent subfolders named after their respective schemas (i.e. for `/Schema-2017-06-30/credentialSchema.json` we would have `/test_data/credentialSchema/credential_1167_payload_Successful.txt` or `/test_data/credentialSchema/invalid_credential.txt`)
