package com.api.rest.contollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.asignacion.TarjetasAs;
import com.api.rest.clase.asignacion.TarjetasAsignadas;

@Controller
public class ConsultaAsignacionController {
	@RequestMapping(method = RequestMethod.GET, value="/ServicioAdministrativosMockAPI/Asignacion/Busqueda")

	@ResponseBody
	public List<TarjetasAs> getTarjeta() {
		return TarjetasAsignadas.getInstance().getTarjetasRecords();
	}

}