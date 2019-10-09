<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="text" indent="yes"/>
    <xsl:template match="/">
        {"contact":
                <xsl:for-each select="repertoire/contact"> 
                        {
                          "nom": "<xsl:value-of select="nom"/>",
                          "prenom": "<xsl:value-of select="prenom"/>",
                          "tels":{
                            <xsl:for-each select="tel">
                                "tel<xsl:number/>": {
                                "tel": "<xsl:value-of select="self::text()"/>",
                                "type": "<xsl:value-of select="@type"/>",
                                },
                            </xsl:for-each>
                            },
                           "email":"<xsl:value-of select="email"/>",
                        },
                </xsl:for-each>
        }
    </xsl:template>
</xsl:stylesheet>
