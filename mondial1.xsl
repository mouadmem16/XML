<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/mondial">
        <html>
            <head>
                <title></title>
            </head>
            <body>
                <table style="width:100%" border="solid 1px">
                    <tr>
                        <th></th>
                        <th>Muslim</th>
                        <th>Jewish</th>
                        <th>Christian</th>
                        <th>Autres</th>
                    </tr>
                    <xsl:for-each select="continent">
                        <xsl:variable name="continent"><xsl:value-of select="@id"/></xsl:variable>
                    <tr>
                        <th><xsl:value-of select="$continent"/></th>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country[encompassed/@continent=$continent]/religion[.='Muslim']/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country[encompassed/@continent=$continent]/religion[.='Jewish']/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country[encompassed/@continent=$continent]/religion[contains(., 'Christian')]/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country[encompassed/@continent=$continent]/religion[.!='Muslim' and .!='Jewish' and not(contains(., 'Christian'))]/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                    </tr>
                    </xsl:for-each>
                    <tr>
                        <th>Total</th>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country/religion[.='Muslim']/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country/religion[.='Jewish']/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country/religion[contains(., 'Christian')]/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="sum(/*/country/religion[.!='Muslim' and .!='Jewish' and not(contains(., 'Christian'))]/(preceding-sibling::population[1]  * @percentage div 100))"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>
