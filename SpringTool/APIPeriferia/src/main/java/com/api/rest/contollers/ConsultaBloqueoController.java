package com.api.rest.contollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.bloqueo.TarjetasBl;
import com.api.rest.clase.bloqueo.TarjetasBloqueadas;


@Controller
public class ConsultaBloqueoController {
	@RequestMapping(method = RequestMethod.GET, value="/ServicioAdministrativosMockAPI/Bloqueo/Busqueda")

	@ResponseBody
	public List<TarjetasBl> getTarjeta() {
		return TarjetasBloqueadas.getInstance().getTarjetasRecords();
	}

}