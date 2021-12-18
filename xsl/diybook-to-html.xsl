<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output omit-xml-declaration="no" indent="yes"/>

    <!-- Identity: copies all -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/DIY-book">
        <html><head>
        <meta HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8"/>
        <title>todo</title>
        <style type="text/css">
            <!--/*--><![CDATA[/*><!--*/
            body {
            font-family: serif;
            font-size: 20px;
            width: 50%;
            margin: auto;
            }
            p { text-indent: 30px; }
            /*]]>*/-->
        </style>
        </head>
        <body>
            <xsl:apply-templates select="description"/>
            <xsl:apply-templates select="body"/>
        </body>
        </html>
        </xsl:template>

    <xsl:template match="description">
        <h5>todo title here</h5>
    </xsl:template>

    <xsl:template match="body">
        <xsl:apply-templates select="title"/>
        <xsl:apply-templates select="section"/>
    </xsl:template>

    <xsl:template match="section">
        <div>
            <xsl:apply-templates select="@*|node()"/>
        </div>
    </xsl:template>

    <xsl:template match="variant">
        <span>
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>

    <xsl:template match="emphasis">
        <i><xsl:value-of select="text()"/></i>
    </xsl:template>

    <xsl:template match="tag">
        <span>
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>

    <xsl:template match="pre">
        <pre>
            <xsl:apply-templates select="line"/>
        </pre>
    </xsl:template>

    <xsl:template match="line">
        <xsl:value-of select="text()"/>
        <xsl:text disable-output-escaping="no">&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="title">
        <h2><xsl:value-of select="p"/></h2>
    </xsl:template>

    <xsl:template match="link">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="link-url/text()" />
            </xsl:attribute>
            <xsl:value-of select="link-text/text()" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="empty-line">
        <p>
        </p>
    </xsl:template>

</xsl:stylesheet>
