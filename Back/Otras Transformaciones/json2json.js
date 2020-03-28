session.input.readAsJSON(function(error,json) {
	if (error) {
		// an error occurred when parsing the content, e.g. invalid JSON object
		session.output.write("oops error " + JSON.stringify(error.toString()));
	} else {
		var hm = require('header-metadata');
		var headers = hm.current;	
		var refNo = json.transactionID;
		var transactionDate = json.transactionDate;
		var transactionTime = json.transactionTime;
		var nroCuentaPrimaria = json.nroCuentaPrimaria;
		var fecVencimiento = json.fecVencimiento;
		var usuario = 'periferia';
		var pass = 'periferia';
		var encode = new Buffer(usuario + ':' + pass).toString('base64');
		var BasicEn = 'Basic ' + encode;
		headers.set('Authorization', BasicEn);
		
	//	json.valorstring = usuario;
		session.output.write(json);
	}
});
