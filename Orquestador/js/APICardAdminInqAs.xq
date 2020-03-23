declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace dp = "http://www.datapower.com/extensions";
declare namespace ser = "http://www.example.org/ServiciosAdministrativosAPI";
declare option jsoniq-version "0.4.42";
declare option output:method "json";

let $request := //ser:asignacionTarjetasRequest,
    $requestHeader := //ser:asignacionTarjetasRequest/ser:EsbHeader,
    $requestCustomerField := //ser:asignacionTarjetasRequest/ser:CustomerField,
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
            "VerificacionPIN": string($requestCustomerField/ser:VerificacionPIN)
        }
    ]
 }
