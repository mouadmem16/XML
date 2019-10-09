<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <xsl:element name="mondial">
            <xsl:for-each select="mondial/continent">
                <xsl:variable name="continent"><xsl:value-of select="@id"/></xsl:variable>
                <xsl:element name="{$continent}">
                    <xsl:for-each select="/mondial/country[encompassed/@continent=$continent]">
                        <xsl:element name="paye">
                            <xsl:variable name="paye_code"><xsl:value-of select="@car_code"/></xsl:variable>
                            <xsl:attribute name="name"><xsl:value-of select="name"/></xsl:attribute>
                            <xsl:attribute name="code"><xsl:value-of select="@car_code"/></xsl:attribute>
                            <xsl:attribute name="population"><xsl:value-of select="population[last()]"/></xsl:attribute>
                            <xsl:element name="villes">
                                <xsl:for-each select="descendant::city">
                                        <xsl:element name="name"><xsl:value-of select="name"/></xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                            <xsl:element name="aireports">
                                <xsl:for-each select="/mondial/airport[@country=$paye_code]">
                                    <xsl:element name="name">
                                        <xsl:value-of select="name"/>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

<!-- 


<html>
<head>
<title></title>
</head>
<body>
<xsl:for-each select="mondial/country">
<xsl:sort select="population[last()]" data-type="number" order="descending"/>
<xsl:variable name="color">                   
    <xsl:choose>
        <xsl:when test="encompassed/@continent='africa'">green</xsl:when>
        <xsl:when test="encompassed/@continent='asia'"></xsl:when>
        <xsl:when test="encompassed/@continent='europe'"></xsl:when>
        <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:sort select="name" data-type="text" order="descending"/>
<span>
    country: <b> <xsl:value-of select="name"/></b>  population:    <xsl:value-of select="population[last()]"/>
</span>
<br/>
</xsl:for-each>
</body>
</html>


-->
