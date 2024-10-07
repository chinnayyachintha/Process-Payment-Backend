# Secure the credit card data using AWS KMS.
# Utilize the KMS public key to encrypt the credit card information 
# before including it in the JWT.

import boto3

def encrypt_credit_card_data(card_data):
    kms_client = boto3.client('kms')
    encrypted_data = kms_client.encrypt(
        KeyId='your-kms-key-id',  # Replace with your KMS Key ID
        Plaintext=card_data.encode()
    )
    return encrypted_data['CiphertextBlob']
