session.input.readAsJSON(function(error,json) {
	if (error) {
		// an error occurred when parsing the content, e.g. invalid JSON object
		session.output.write("oops error " + JSON.stringify(error.toString()));
	} else {
		
		
	    var refNo = json.nroAutorizacion;
		var Estados =  json.estado;
		var transactionDate =  json.fecha;
		var transactionTime =  json.hora;
		var coRes =  json.codRespuesta;
		var Descripcion =  json.descRespuesta;
		
		session.output.write(
			"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "
			+ "xmlns:ser=\"http://www.example.org/ServiciosAdministrativosAPI\">" 
	   		+ "<soapenv:Header/>"
	   		+ "<soapenv:Body>"
	      		+ "<ser:TarjetasResponse>"
	         	+ "<ser:nroAutorizacion>" + refNo + "</ser:nroAutorizacion>"
	         	+ "<ser:estado>" + Estados + "</ser:estado>"
				+ "<ser:fecha>" + transactionDate + "</ser:fecha>"
				+ "<ser:hora>" + transactionTime + "</ser:hora>"
				+ "<ser:codRespuesta>" + coRes + "</ser:codRespuesta>"
				+ "<ser:descRespuesta>" + Descripcion + "</ser:descRespuesta>"
	      		+ "</ser:TarjetasResponse>"
	   		+ "</soapenv:Body>"
			+ "</soapenv:Envelope>"
		);
	}
});
