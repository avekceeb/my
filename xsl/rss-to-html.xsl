<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="/rss">
        <html><head>
        <meta HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8"/>
        <title>todo</title>
        <style type="text/css">
            <!--/*--><![CDATA[/*><!--*/
            body {
            font-family: monospace;
            font-size: 20px;
            width: 70%;
            margin: auto;
            }
            p { text-indent: 30px; }
            /*]]>*/-->
        </style>
        </head>
        <body>
            <xsl:apply-templates select="channel"/>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="channel">
        <ul>
        <xsl:apply-templates select="item"/>
        </ul>
    </xsl:template>

    <xsl:template match="item">
        <li>
        <xsl:value-of select="description/text()" />
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="link/text()" />
            </xsl:attribute>
            <xsl:text>&gt;&gt;&gt;</xsl:text>
        </xsl:element>
        </li>
    </xsl:template>


</xsl:stylesheet>
