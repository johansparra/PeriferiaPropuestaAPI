package com.api.rest.contollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clases.Tarjetas;
import com.api.rest.clases.TarjetasActivadas;

@Controller
public class TarjetasConsultaController {
	@RequestMapping(method = RequestMethod.GET, value="/student/allstudentss")

	@ResponseBody
	public List<Tarjetas> getTarjeta() {
		return TarjetasActivadas.getInstance().getTarjetasRecords();
	}

}
