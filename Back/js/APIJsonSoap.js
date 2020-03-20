// Read the input as a JSON object and convert to SOAP message
console.debug("Starting BaggageJson2Soap");

session.input.readAsJSON(function(error,json) {
	if (error) {
		// an error occurred when parsing the content, e.g. invalid JSON object
		session.output.write("oops error " + JSON.stringify(error.toString()));
	} else {
		
debugger;
		var refNo = json.refNumber;
		var EHeader = json.EsbHeader;
		var ESHeader = EHeader[Object.keys(EHeader)[0]];;
		var TransactionID =  (Object.values(ESHeader))[0];
		var transactionDate =  (Object.values(ESHeader))[1];
		var transactionTime =  (Object.values(ESHeader))[2];
		var CustomerF = json.CustomerField;		
		var lastName = json.lastName;
		
		console.info("Received request from %s and referenece number is %i", lastName, refNo);
		console.info("Received request from %s and referenece number is %i", Object.values(EHeader));
		
		// Debug level is a stylesheet parameter which is configurable in JS action
		// Check debug level , if debug level is above 5, will print request headers and service variables
		// Default value is 0
		if (!session.parameters.debugLevel) 
			session.parameters.debugLevel = 0;
		if (session.parameters.debugLevel >= 5)
		{
			//print current headers
			var hm = require('header-metadata');
			console.debug("Current headers %j", hm.current.headers);
			
			//print service variables
			var sm = require('service-metadata');
			console.debug("Input size is:" + sm.inputSize );
			console.debug("Inbound URL:" + sm.getVar('var://service/URL-in') );
			
			//print input JSON message
			console.debug("JSON Request is %j", json);
		}
		
		session.output.write(
			"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "
			+ "xmlns:ser=\"http://www.example.org/ServiciosAdministrativosAPI\">" 
	   		+ "<soapenv:Header/>"
	   		+ "<soapenv:Body>"
	      		+ "<ser:TarjetasResponse>"
	         	+ "<ser:nroAutorizacion>" + TransactionID + "</ser:nroAutorizacion>"
	         	+ "<ser:estado>" + "Activado" + "</ser:estado>"
				+ "<ser:fecha>" + transactionDate + "</ser:fecha>"
				+ "<ser:hora>" + transactionTime+ "</ser:hora>"
				+ "<ser:codRespuesta>" + "000" + "</ser:codRespuesta>"
				+ "<ser:descRespuesta>" + "Transaccion Exitosa" + "</ser:descRespuesta>"
	      		+ "</ser:TarjetasResponse>"
	   		+ "</soapenv:Body>"
			+ "</soapenv:Envelope>"
		);
	}
});
