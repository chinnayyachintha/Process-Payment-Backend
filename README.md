Process Payment Backend:
------------------------

Create Infra (VPC, Private Subnet, Public Subnet, NAT Gateway, VPC Endpoint, PrivateLink)

Create Infra (QLDB ledger, audits)

Implement Lambda Authorizer

Implement POST HTTPS://{flair-sub-domain}/{stage}/payment-gateway/process-payment skeleton

Implement process-payment decrypting credit card meta_data in JWT

Create Route 53 entries to resolve to CDN Distro

Implement process-payment invoking rule engine

Implement process-payment invoking 3rd party payment processor PayRoc

Implement process-payment persisting Payment ledger

Implement process-payment persisting Payment Audit trail

Implement process-payment normalizing response from 3rd party payment processor PayRoc

Unit Testing - automated unit tests for code

Integration Testing: validate backend integration, including tokenization, persistence and logging
