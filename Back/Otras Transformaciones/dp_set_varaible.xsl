<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" xmlns:date="http://exslt.org/dates-and-times" version="1.0" extension-element-prefixes="dp" exclude-result-prefixes="dp">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:variable name="TransactionID" select="string(//*[local-name()='EsbHeader']/*[local-name()='transactionID']/text())"/>
    <xsl:variable name="Usuario" select="'prueba'"/>
    <xsl:variable name="Password" select="'prueba'"/>
    <xsl:variable name="ConcatAuth" select="concat($Usuario,':', $Password)"/>
    <xsl:variable name="ConcatAuth64" select="dp:encode($ConcatAuth,'base-64')"/>
	<xsl:variable name="BasictAuth" select="concat('Basic',' ', $ConcatAuth64)"/>
    <dp:set-variable name="'var://context/service/TransactionID'" value="$TransactionID"/>
    <dp:set-http-request-header name="'Authorization'" value="$BasictAuth"/>
  </xsl:template>
</xsl:stylesheet>
