<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"
            doctype-public="-//W3C//DTD HTML 4.01//EN"
            doctype-system="http://www.w3.org/TR/html4/strict.dtd" />
 
    <xsl:template match="/html/body">
      <html>
        <head>
            <title>Directory: <xsl:value-of select="request_uri"/></title>
                <style>
                    body         {font-family: sans-serif; text-align: center;}
                    table        {margin: 0px auto; border-collapse: collapse;}
                    td           {border: 1px solid lightgrey;}
                    a, a:visited {color: #ff6600; text-decoration: none;}
                    a:hover      {text-decoration: underline;}
                </style>
            </head>
            <body>
                <h2>Directory: <xsl:value-of select="request_uri"/></h2>
                <table>
                    <!-- define table column width -->
                    <colgroup>
                        <col width="50"/>  <!-- icon -->
                        <col width="400"/> <!-- link -->
                        <col width="180"/> <!-- last modified -->
                        <col width="50"/>  <!-- size -->
                    </colgroup>
                    <!-- process 'tr' rows with td only (skip th rows) -->
                    <xsl:apply-templates select="table/tr[td]"/>
                </table>
            </body>
      </html>
    </xsl:template>
     
    <!-- print table rows -->
    <xsl:template match="tr">
        <tr>
            <td align="center"><xsl:copy-of select="td[position()=1]/*"/></td>
            <td align="left"><xsl:copy-of select="td[position()=2]/a"/></td>
            <td align="center"><xsl:value-of select="td[position()=3]"/></td>
            <td align="right"><xsl:value-of select="td[position()=4]"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
