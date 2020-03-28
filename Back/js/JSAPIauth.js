session.input.readAsJSON(function(error,json) {
	if (error) {
		// an error occurred when parsing the content, e.g. invalid JSON object
		session.output.write("oops error " + JSON.stringify(error.toString()));
	} else {
		    var refNo = "Succes";
			var hm = require('header-metadata');
			var headers = hm.current;
		session.output.write(
			"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "
			+ "xmlns:ser=\"http://www.example.org/ServiciosAdministrativosAPI\">" 
	   		+ "<soapenv:Header/>"
	   		+ "<soapenv:Body>"
	      		+ "<ser:TarjetasResponse>"
	         	+ "<ser:nroAutorizacion>" + refNo + "</ser:nroAutorizacion>"
	      		+ "</ser:TarjetasResponse>"
	   		+ "</soapenv:Body>"
			+ "</soapenv:Envelope>"
		);
	}
});
