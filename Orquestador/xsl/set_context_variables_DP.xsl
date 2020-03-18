<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" xmlns:date="http://exslt.org/dates-and-times" version="1.0" extension-element-prefixes="dp" exclude-result-prefixes="dp">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:variable name="TransactionID" select="string(//*[local-name()='EsbHeader']/*[local-name()='TransactionID']/text())"/>
    <dp:set-variable name="'var://context/service/TransactionID'" value="$TransactionID"/>
  </xsl:template>
</xsl:stylesheet>
