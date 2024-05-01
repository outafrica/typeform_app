class ShuftiProConfigs {
  static Map<String, Object> authObject = {
    "auth_type": "basic_auth",
    "client_id":
        "788678ca764c5953910cf847e2d09cae2ac4dd26f9cb22a863aeaa480298fdf1",
    "secret_key": "bvf5dr9cH9jM0U3krilzz3CMLROrcFCz",
  };

  static Map<String, Object> configObject = {
    "open_webview": false,
    "asyncRequest": false,
    "captureEnabled": false,
    "dark_mode": false,
    "base_url": "api.shuftipro.com",
    "consent_age": 16,
  };

  static Map<String, Object> createdPayload = {
    "country": "KE",
    "reference": "12345678",
    "language": "EN",
    "email": "",
    "verification_mode": "image_only",
    "show_results": 1,
    "face": {},
    "background_checks": {},
    "phone": {},
    "document": {
      "supported_types": [
        "passport",
        "id_card",
        "driving_license",
        "credit_or_debit_card",
      ],
      /* Keep name, dob, document_number, expiry_date, issue_date empty for with-OCR request*/

      "name": {
        "first_name": "John",
        "last_name": "Johsan",
        "middle_name": "Livone",
      },
      "dob": "",
      "document_number": "19901112",
      "expiry_date": "1996-11-12",
      "issue_date": "1990-11-12",
      "gender": "M",
      "backside_proof_required": "1",
    },

    //Creating Document Two Object is exactly the same as document object.

    "address": {
      "full_address": "ST#2, 937-B, los angeles.",
      "name": {
        "first_name": "Johon",
        "last_name": "Johsan",
        "middle_name": "Livone",
      },
      "supported_types": [
        "id_card",
        "utility_bill",
        "bank_statement",
        "passport",
        "driving_license"
      ],
    },
    /* Keep name and full_address empty for with-OCR request */

    "consent": {
      "supported_types": ["printed", "handwritten"],
      "text": "My name is John Doe and I authorise this transaction of \$100/-",
    },
  };
}
