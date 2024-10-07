# Create a JWT with the necessary claims and metadata, including the encrypted card data.
# Construct the JWT header and payload.
# Sign the JWT using the KMS private key.

import jwt
import datetime

def generate_jwt(session_id, idempotency_key, encrypted_data):
    payload = {
        "iss": "unique_string_for_payment_processing",
        "sub": "user_or_transaction_identifier",
        "aud": "https://payment.gateway.endpoint",
        "iat": int(datetime.datetime.utcnow().timestamp()),
        "exp": int((datetime.datetime.utcnow() + datetime.timedelta(minutes=5)).timestamp()),
        "meta_data": {
            "sessionId": session_id,
            "idempotencyKey": idempotency_key,
            "data": encrypted_data
        }
    }

    private_key = kms_client.get_private_key(KeyId='your-kms-key-id')['PrivateKey']
    token = jwt.encode(payload, private_key, algorithm='RS256')
    return token
