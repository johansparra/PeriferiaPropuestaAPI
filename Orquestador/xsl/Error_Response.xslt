<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ser="http://www.example.org/ServiciosAdministrativosAPI" xmlns:dp="http://www.datapower.com/extensions" xmlns:dyn="http://exslt.org/dynamic" xmlns:dpconfig="http://www.datapower.com/param/config" xmlns:dpfunc="http://www.datapower.com/extensions/functions" version="1.0" extension-element-prefixes="dp dpconfig dyn dpfunc" exclude-result-prefixes="dp date">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:variable name="CodError">
      <xsl:variable name="response-code">
        <xsl:value-of select="substring-before(concat(dp:http-response-header('x-dp-response-code'), ' '), ' ')"/>
      </xsl:variable>
      <xsl:choose>
        <!-- Codigo de error para un Timeout backend - falta validar. -->
        <xsl:when test="$response-code = '2033'">
          <xsl:value-of select="'PRV001'"/>
        </xsl:when>
        <!-- Codigos de error aplican para cualquier tipo de comunicacion con backend (Timeout, conexion). -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x01130006' and $response-code = '' or $response-code = '2085' or dp:variable('var://service/error-code') = '0x0113001c'">
          <xsl:value-of select="'PRV002'"/>
        </xsl:when>
        <!-- Codigos de error aplican solo para temas de validacion de esquema. -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x00230001' and dp:variable('var://service/error-subcode') = '0x01d30003'">
          <xsl:value-of select="'ESB502'"/>
        </xsl:when>
        <!-- Codigo de error de autorizacion AAA -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x00d30003' and dp:variable('var://service/error-subcode') = '0x01d30002'">
          <xsl:value-of select="'ESB503'"/>
        </xsl:when>
        <!-- Codigo de error cuando falla algo en la transformacion de los datos -->
        <xsl:when test="((dp:variable('var://service/error-code') = '0x00c30022') or (dp:variable('var://service/error-code') = '0x00c30002' ))">
          <xsl:value-of select="'ESB504'"/>
        </xsl:when>
        <!-- Todos los errores que no son controlados -->
        <xsl:otherwise>
          <dp:set-variable name="'var://context/response/code'" value="number($response-code)"/>
          <xsl:value-of select="'ESB500'"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="DesError">
      <xsl:variable name="response-code">
        <xsl:value-of select="substring-before(concat(dp:http-response-header('x-dp-response-code'), ' '), ' ')"/>
      </xsl:variable>
      <xsl:choose>
        <!-- Codigo de error para un Timeout backend - falta validar. -->
        <xsl:when test="$response-code = '2033'">
          <xsl:value-of select="concat('Timeout backend : ',$response-code, ' - ', substring(dp:variable('var://service/error-message'), 1, 449))"/>
        </xsl:when>
        <!-- Codigos de error aplican para cualquier tipo de comunicacion con backend (Timeout, conexion). -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x01130006' and $response-code = '' or $response-code = '2085' or dp:variable('var://service/error-code') = '0x0113001c'">
          <xsl:value-of select="concat('Error de Comunicacion con el backend : ',dp:variable('var://service/error-code'), ' - ', substring(dp:variable('var://service/error-message'), 1, 445))"/>
        </xsl:when>
        <!-- Codigos de error aplican solo para temas de validacion de esquema. -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x00230001' and dp:variable('var://service/error-subcode') = '0x01d30003'">
          <xsl:value-of select="concat('Error en validacion del mensaje : ',dp:variable('var://service/error-code'), ' - ', substring(dp:variable('var://service/error-message'), 1, 450))"/>
        </xsl:when>
        <!-- Codigo de error de autorizacion AAA -->
        <xsl:when test="dp:variable('var://service/error-code') = '0x00d30003' and dp:variable('var://service/error-subcode') = '0x01d30002'">
          <xsl:value-of select="concat('Fallo de autenticacion en las politicas AAA : ',dp:variable('var://service/error-code'), ' - ', substring(dp:variable('var://service/error-message'), 1, 440))"/>
        </xsl:when>
        <!-- Codigo de error cuando falla algo en la transformacion de los datos -->
        <xsl:when test="((dp:variable('var://service/error-code') = '0x00c30022') or (dp:variable('var://service/error-code') = '0x00c30002' ))">
          <xsl:value-of select="concat('Error en la transformacion del mensaje : ',dp:variable('var://service/error-code'), ' - ', substring(dp:variable('var://service/error-message'), 1, 445))"/>
        </xsl:when>
        <!-- Todos los errores que no son controlados -->
        <xsl:otherwise>
          <xsl:value-of select="concat('Error tecnico en capa de integracion : ',dp:variable('var://service/error-code'), ' .- ',substring(dp:variable('var://service/error-message'), 1, 445))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="errorFault">
      <xsl:value-of select="/*[local-name()='Envelope']/*[local-name()='Body']//*[local-name()='Fault']"/>
    </xsl:variable>
	<xsl:variable name="FaultCode">
      <xsl:value-of select="/*[local-name()='Envelope']/*[local-name()='Body']//*[local-name()='faultcode']/text()"/>
    </xsl:variable>
	<xsl:variable name="FaultString">
      <xsl:value-of select="/*[local-name()='Envelope']/*[local-name()='Body']//*[local-name()='faultstring']/text()"/>
    </xsl:variable>
    <!--SI HAY ERROR -->
    <env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/">
      <env:Header/>
      <env:Body>
        <xsl:element name="ser:TarjetasResponse">
          <xsl:element name="ser:nroAutorizacion">
		  <xsl:value-of select="dp:variable('var://context/service/TransactionID')"/>
          </xsl:element>
          <xsl:element name="ser:estado">
            <xsl:value-of select="'Fail'"/>
          </xsl:element>
          <xsl:element name="ser:fecha">
            <xsl:value-of select="date:format-date(date:date(), 'yyyy-MM-dd')"/>
          </xsl:element>
          <xsl:element name="ser:hora">
            <xsl:value-of select="date:format-date(date:time(), 'HH:mm:ss')"/>
          </xsl:element>
          <xsl:element name="ser:codRespuesta">
            <xsl:value-of select="$CodError"/>
          </xsl:element>
          <xsl:element name="ser:descRespuesta">
            <xsl:value-of select="'System Exception'"/>
          </xsl:element>
          <xsl:element name="ser:descError">
            <xsl:choose>
              <xsl:when test="$errorFault = '' or $errorFault = ' ' or $errorFault = 'null'">
                <xsl:value-of select="$DesError"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat($FaultCode, ' - ', $FaultString)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:element>
      </env:Body>
    </env:Envelope>
    <dp:set-variable name="'var://service/error-protocol-response'" value="'200'"/>
    <dp:set-variable name="'var://service/error-protocol-reason-phrase'" value="'OK'"/>
  </xsl:template>
</xsl:stylesheet>
