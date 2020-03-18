<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" version="1.0" extension-element-prefixes="dp" exclude-result-prefixes="dp">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="string(container/mapped-credentials/@au-success) = 'true'">
        <xsl:variable xmlns:aaa="http://www.datapower.com/AAAInfo" name="credential" select="container/mapped-credentials/entry/aaa:OutputCredential/text()"/>
        <xsl:variable name="aaa-file" select="concat('local:///services/', dp:variable('var://service/processor-name'), '/xml/', dp:variable('var://service/processor-name') , '.aaa.xml')"/>
        <xsl:variable name="aaa" select="document($aaa-file)/AllowAccess/InputCredential[text() = $credential]"/>
        <xsl:choose>
          <xsl:when test="$aaa">
            <approved/>
          </xsl:when>
          <xsl:otherwise>
            <declined>
              <xsl:value-of select="'Authorization failure'"/>
            </declined>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <declined>
          <xsl:value-of select="'Authentication failure'"/>
        </declined>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
