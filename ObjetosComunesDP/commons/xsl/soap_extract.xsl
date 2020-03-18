<xsl:stylesheet version="1.0" extension-element-prefixes="dp" exclude-result-prefixes="dp" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions">
   <xsl:output method="xml" encoding="utf-8"/>
   <xsl:template match="/">
      <xsl:copy-of select="/container/message/env:Envelope/env:Body/*[1]" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"/>
   </xsl:template>
</xsl:stylesheet>