<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://www.example.org/ServiciosAdministrativosAPI" xmlns:dp="http://www.datapower.com/extensions" version="1.0" extension-element-prefixes="dp" exclude-result-prefixes="dp">
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>
  <xsl:template match="@*|node()">
    <soapenv:Envelope>
      <soapenv:Body>
        <xsl:copy-of select="."/>
      </soapenv:Body>
    </soapenv:Envelope>
  </xsl:template>
</xsl:stylesheet>
