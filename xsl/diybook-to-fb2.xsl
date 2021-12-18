<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:l="http://www.w3.org/1999/xlink">
<xsl:output omit-xml-declaration="no" indent="yes"/>

    <!-- Identity: copies all -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/DIY-book">
        <FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0"
                     xmlns:l="http://www.w3.org/1999/xlink">
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="body"/>
        </FictionBook>
    </xsl:template>

    <xsl:template match="body">
        <body>
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="section"/>
        </body>
    </xsl:template>

    <xsl:template match="variant">
        <emphasis>
            <xsl:value-of select="text()"/>
        </emphasis>
    </xsl:template>

    <xsl:template match="tag">
        <!--strong-->
            <xsl:text disable-output-escaping="no">#</xsl:text>
            <xsl:value-of select="text()"/>
        <!--/strong-->
    </xsl:template>

    <xsl:template match="pre">
        <stanza>
            <xsl:apply-templates select="line"/>
        </stanza>
    </xsl:template>

    <xsl:template match="line">
        <v>
            <xsl:value-of select="text()"/>
        </v>
    </xsl:template>

    <xsl:template match="link">
        <xsl:element name="a">
            <xsl:attribute name="l:href">
                <xsl:value-of select="link-url/text()" />
            </xsl:attribute>
            <xsl:value-of select="link-text/text()" />
        </xsl:element>
    </xsl:template>

<!--
<a xlink:href="#annotation_src" type="note">[источник]</a>
-->

    <!--xsl:template match="poem">
        <preformat>
            xello
        </preformat>
    </xsl:template-->

</xsl:stylesheet>
