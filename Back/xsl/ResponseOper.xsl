<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:ser="http://www.example.org/ServiciosAdministrativosAPI" xmlns:dp="http://www.datapower.com/extensions" version="1.0" extension-element-prefixes="dp date" exclude-result-prefixes="dp dpconfig">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
      <soapenv:Header/>
      <soapenv:Body>
        <ser:TarjetasResponse xmlns:ser="http://www.example.org/ServiciosAdministrativosAPI">
          <ser:nroAutorizacion>123</ser:nroAutorizacion>
          <ser:estado>Activa</ser:estado>
		  <ser:fecha>
		  <xsl:value-of select="date:format-date(date:date(), 'yyyy-MM-dd')"/>
		  </ser:fecha>
          <ser:hora>
		  <xsl:value-of select="date:format-date(date:time(), 'HH:mm:ss')"/>
		  </ser:hora>
          <ser:codRespuesta>000</ser:codRespuesta>
          <ser:descRespuesta>Cuenta Activada</ser:descRespuesta>
        </ser:TarjetasResponse>
      </soapenv:Body>
    </soapenv:Envelope>
  </xsl:template>
</xsl:stylesheet>
