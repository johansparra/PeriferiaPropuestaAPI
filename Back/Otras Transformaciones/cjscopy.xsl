<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.example.org/tns" xmlns:dp="http://www.datapower.com/extensions" extension-element-prefixes="dp" exclude-result-prefixes="dp">
<dp:input-mapping href="local:///String.utf-8.ffd" type="ffd"/>
 <xsl:output omit-xml-declaration="yes" media-type="application/json" />
 <xsl:template match="/">
  <xsl:variable name="Usuario" select="'hola'"/>
    <xsl:variable name="Password" select="'prueba'"/>
    <xsl:variable name="ConcatAuth" select="concat($Usuario,':', $Password)"/>
    <xsl:variable name="ConcatAuth64" select="dp:encode($ConcatAuth,'base-64')"/>
	<xsl:variable name="BasictAuth" select="concat('Basic',' ', $ConcatAuth64)"/>
    <dp:set-http-request-header name="'Authorization'" value="$BasictAuth"/>
<!--	<xsl:copy-of select="." />-->
<!--	<xsl:copy-of select="dp:decode(dp:binary-encode($Response/result/binary/node()), 'base-64' )" /> -->
 </xsl:template>
</xsl:stylesheet>