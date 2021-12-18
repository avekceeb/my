<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:l="http://www.w3.org/1999/xlink"
    xmlns:latex="http://dlmf.nist.gov/LaTeXML">
<xsl:output omit-xml-declaration="no" indent="yes"/>

<xsl:strip-space elements="*"/>

    <!-- Identity: copies all
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    -->
    <xsl:param name="genre">fiction</xsl:param>
    <xsl:param name="lang">ru</xsl:param>
    <xsl:param name="authorname">Unknown</xsl:param>
    <xsl:param name="author">Unknown</xsl:param>
    <xsl:param name="title">Unknown</xsl:param>

    <xsl:template match="latex:document">
        <FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0">
        <description>
            <title-info>
                <genre><xsl:value-of select="$genre"/></genre>
                <author>
                    <first-name><xsl:value-of select="$authorname"/></first-name>
                    <last-name><xsl:value-of select="$author"/></last-name>
                    <id>da23b39e-b93f-11e6-b088-0cc47a52085c</id>
                </author>
                <book-title><xsl:value-of select="latex:title"/></book-title>
                <annotation>
                </annotation>
                <keywords></keywords>
                <date value="2012-01-01">2012</date>
                <!--coverpage>
                    <image l:href="#cover.jpg"/>
                </coverpage-->
                <lang><xsl:value-of select="$lang"/></lang>
                <!--src-lang>fr</src-lang>
                <translator>
                    <first-name>Александра</first-name>
                    <middle-name>Евгеньевна</middle-name>
                    <last-name>Соколинская</last-name>
                    <id>05bb684b-2a81-102a-9ae1-2dfe723fe7c7</id>
                </translator-->
            </title-info>
            <!--document-info>
                <author>
                    <first-name>Олег</first-name>
                    <last-name>Власов</last-name>
                    <nickname>prussol</nickname>
                </author>
                <program-used>FictionBook Editor Release 2.6.7</program-used>
                <date value="2017-06-03">03.06.2017</date>
                <src-url>http://www.litres.ru/pages/biblio_book/?art=24260630</src-url>
                <src-ocr>Текст предоставлен правообладателем</src-ocr>
                <id>024abb26-46e4-11e7-aec0-0cc47a5453d6</id>
                <version>1.0</version>
                <history>
                    <p>V 1.0 by prussol</p>
                </history>
                <publisher>
                    <first-name>Литагент</first-name>
                    <last-name>Ад Маргинем</last-name>
                    <id>fae21566-f8a3-102b-99a2-0288a49f2f10</id>
                </publisher>
            </document-info>
            <publish-info>
                <book-name>Девочка с пальчик. / Серр, Мишель</book-name>
                <publisher>Ад Маргинем Пресс</publisher>
                <city>Москва</city>
                <year>2016</year>
                <isbn>978-5-91103-313-2</isbn>
            </publish-info-->
        </description>
        <body>
            <xsl:apply-templates select="latex:chapter|latex:paragraph"/>
        </body>
        <xsl:apply-templates select="//latex:note" mode="content"/>
        </FictionBook>
    </xsl:template>

    <xsl:template match="latex:ERROR">
    </xsl:template>

    <xsl:template match="latex:chapter">
        <xsl:element name="section" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:apply-templates select="latex:title"/>
            <xsl:apply-templates select="latex:paragraph"/>
            <xsl:apply-templates select="latex:para"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="latex:paragraph">
        <xsl:element name="section" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:apply-templates select="latex:title"/>
            <xsl:apply-templates select="latex:para"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="latex:para">
        <xsl:apply-templates select="latex:p|latex:note"/>
    </xsl:template>

    <xsl:template match="latex:title">
        <xsl:element name="title" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:element name="p" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
                <xsl:value-of select="text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="latex:p">
        <xsl:element name="p" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:apply-templates select="text()|latex:note"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="latex:note">
        <xsl:element name="a" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:attribute name="l:href">#n<xsl:value-of select="@mark"/></xsl:attribute>
            <xsl:attribute name="type">note</xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@mark"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
        <!--
            <a l:href="#n1" type="note">[1]</a>
            <note mark="1" role="footnote">
        -->
    </xsl:template>

    <xsl:template match="latex:note" mode="content">
        <xsl:element name="section" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
            <xsl:attribute name="id">n<xsl:value-of select="@mark"/></xsl:attribute>
            <xsl:element name="title" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
                <xsl:element name="p" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
                    <xsl:text>Примечание </xsl:text>
                    <xsl:value-of select="@mark"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="p" namespace="http://www.gribuser.ru/xml/fictionbook/2.0">
                <xsl:value-of select="text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>


</xsl:stylesheet>
