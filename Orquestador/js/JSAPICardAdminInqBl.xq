declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace dp = "http://www.datapower.com/extensions";
declare namespace ser = "http://www.example.org/ServiciosAdministrativosAPI";
declare option jsoniq-version "0.4.42";
declare option output:method "json";

let $request := //ser:bloqueoTarjetasRequest,
    $requestHeader := //ser:bloqueoTarjetasRequest/ser:EsbHeader,
    $requestCustomerField := //ser:bloqueoTarjetasRequest/ser:CustomerField,
    $request-header := dp:set-request-header("Content-Type", "application/json")

return {
            "transactionID": string($requestHeader/ser:transactionID),
            "transactionDate": string($requestHeader/ser:transactionDate),
            "transactionTime": string($requestHeader/ser:transactionTime),
            "nroCuentaPrimaria": string($requestCustomerField/ser:nroCuentaPrimaria)
 }
