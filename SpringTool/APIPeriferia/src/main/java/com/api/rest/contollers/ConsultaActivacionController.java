package com.api.rest.contollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.activacion.TarjetasAc;
import com.api.rest.clase.activacion.TarjetasActivadas;

@Controller
public class ConsultaActivacionController {
	@RequestMapping(method = RequestMethod.GET, value="/ServicioAdministrativosMockAPI/Activacion/Busqueda")

	@ResponseBody
	public List<TarjetasAc> getTarjeta() {
		return TarjetasActivadas.getInstance().getTarjetasRecords();
	}

}
