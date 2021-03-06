declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace dp = "http://www.datapower.com/extensions";
declare namespace ser = "http://www.example.org/ServiciosAdministrativosAPI";
declare option jsoniq-version "0.4.42";
declare option output:method "json";
declare option output:headers: {
                        'Authorization': 'Basic ' + new Buffer("hola" ':' + "mundo").toString('base64')
                    }

let $request := //ser:activacionTarjetasRequest,
    $requestHeader := //ser:activacionTarjetasRequest/ser:EsbHeader,
    $requestCustomerField := //ser:activacionTarjetasRequest/ser:CustomerField,
    $request-header := dp:set-request-header("Content-Type", "application/json")

return {
    "EsbHeader": [{
            "TransactionID": string($requestHeader/ser:TransactionID),
            "transactionDate": string($requestHeader/ser:transactionDate),
            "transactionTime": string($requestHeader/ser:transactionTime)
        }
    ],
    "CustomerField": [{
            "nroCuentaPrimaria": string($requestCustomerField/ser:nroCuentaPrimaria),
            "fecVencimiento": string($requestCustomerField/ser:fecVencimiento),
            "codServicio": string($requestCustomerField/ser:codServicio)
        }
    ]
 }
