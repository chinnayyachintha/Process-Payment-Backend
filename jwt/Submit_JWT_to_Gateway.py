# Send the generated JWT to the payment gateway for processing
# Make an HTTP POST request to the payment gateway's endpoint, 
# including the JWT in the request headers

import requests

def submit_payment(jwt_token):
    response = requests.post(
        "https://payment.gateway.endpoint/process-payment",
        headers={"Authorization": f"Bearer {jwt_token}"}
    )
    return response.json()
