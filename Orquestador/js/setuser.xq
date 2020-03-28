xquery version "1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace dp = "http://www.datapower.com/extensions";
declare namespace ser = "http://www.example.org/ServiciosAdministrativosAPI";
declare option jsoniq-version "0.4.42";
declare option output:method "json";
declare option output:media-type "application/json";
declare option output:indent "yes";

let $request-header := dp:set-request-header("Content-Type", "application/json"),
    $Usuario := 'prueba',
	$contraseña := 'prueba123',
	$credentials := concat($Usuario, ':', $contraseña),
	$Auth := concat('Basic ', $credentials),
	$request-header := dp:set-request-header("Authorization", string($Auth))
	return {}

