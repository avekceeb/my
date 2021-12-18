<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
        version="1.0"
        xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
        xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
        xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
        xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
        xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
        xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
        xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
        xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
        xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
        xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
        xmlns:math="http://www.w3.org/1998/Math/MathML"
        xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
        xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
        xmlns:ooo="http://openoffice.org/2004/office"
        xmlns:ooow="http://openoffice.org/2004/writer"
        xmlns:oooc="http://openoffice.org/2004/calc"
        xmlns:dom="http://www.w3.org/2001/xml-events"
        xmlns:xforms="http://www.w3.org/2002/xforms"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:rpt="http://openoffice.org/2005/report"
        xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2"
        xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns:grddl="http://www.w3.org/2003/g/data-view#"
        xmlns:officeooo="http://openoffice.org/2009/office"
        xmlns:tableooo="http://openoffice.org/2009/table"
        xmlns:drawooo="http://openoffice.org/2010/draw"
        xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0"
        xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"
        xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0"
        xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0"
        xmlns:css3t="http://www.w3.org/TR/css3-text/"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="/DIY-book">
        <office:document-content
            xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
            xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
            xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
            xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
            xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
            xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
            xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
            xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
            xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
            xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
            xmlns:math="http://www.w3.org/1998/Math/MathML"
            xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
            xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
            xmlns:ooo="http://openoffice.org/2004/office"
            xmlns:ooow="http://openoffice.org/2004/writer"
            xmlns:oooc="http://openoffice.org/2004/calc"
            xmlns:dom="http://www.w3.org/2001/xml-events"
            xmlns:xforms="http://www.w3.org/2002/xforms"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:rpt="http://openoffice.org/2005/report"
            xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2"
            xmlns:xhtml="http://www.w3.org/1999/xhtml"
            xmlns:grddl="http://www.w3.org/2003/g/data-view#"
            xmlns:officeooo="http://openoffice.org/2009/office"
            xmlns:tableooo="http://openoffice.org/2009/table"
            xmlns:drawooo="http://openoffice.org/2010/draw"
            xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0"
            xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"
            xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0"
            xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0"
            xmlns:css3t="http://www.w3.org/TR/css3-text/"
            office:version="1.2">

            <office:scripts/>

            <office:font-face-decls>
                <style:font-face style:name="FreeSans1"
                                 svg:font-family="FreeSans"
                                 style:font-family-generic="swiss"/>
                <style:font-face style:name="Liberation Serif"
                                 svg:font-family="&apos;Liberation Serif&apos;"
                                 style:font-family-generic="roman"
                                 style:font-pitch="variable"/>
                <style:font-face style:name="Liberation Sans"
                                 svg:font-family="&apos;Liberation Sans&apos;"
                                 style:font-family-generic="swiss"
                                 style:font-pitch="variable"/>
                <style:font-face style:name="FreeSans"
                                 svg:font-family="FreeSans"
                                 style:font-family-generic="system"
                                 style:font-pitch="variable"/>
                <style:font-face style:name="Noto Sans CJK SC Regular"
                                 svg:font-family="&apos;Noto Sans CJK SC Regular&apos;"
                                 style:font-family-generic="system"
                                 style:font-pitch="variable"/>
            </office:font-face-decls>

            <office:automatic-styles>
                <style:style style:name="P1"
                             style:family="paragraph"
                             style:parent-style-name="Standard">
                    <style:text-properties officeooo:rsid="00034ab5"
                                           officeooo:paragraph-rsid="00034ab5"/>
                    <style:paragraph-properties fo:text-indent="0.25in"/>
                    <!--style:paragraph-properties fo:margin-left="0in"
                                                fo:margin-right="0in"
                                                fo:text-indent="0.25in"
                                                style:auto-text-indent="false"
                                                style:page-number="auto"
                                                fo:background-color="transparent"/-->
                </style:style>
                <style:style style:name="T1" style:family="text">
                    <style:text-properties fo:font-weight="bold"
                                           style:font-weight-asian="bold"
                                           style:font-weight-complex="bold"/>
                    </style:style>
                    <style:style style:name="T2"
                                 style:family="text">
                        <style:text-properties fo:font-style="italic"
                                               style:font-style-asian="italic"
                                               style:font-style-complex="italic"/>
                    </style:style>
                    <style:style style:name="T3" style:family="text">
                        <style:text-properties fo:color="#ff0000"/>
                    </style:style>
            </office:automatic-styles>

            <xsl:apply-templates select="body"/>

        </office:document-content>
    </xsl:template>

    <xsl:template match="body">
        <office:body>
            <office:text>
                <text:sequence-decls>
                    <text:sequence-decl
                            text:display-outline-level="0"
                            text:name="Illustration"/>
                    <text:sequence-decl
                            text:display-outline-level="0"
                            text:name="Table"/>
                    <text:sequence-decl
                            text:display-outline-level="0"
                            text:name="Text"/>
                    <text:sequence-decl
                            text:display-outline-level="0"
                            text:name="Drawing"/>
                </text:sequence-decls>

                <xsl:apply-templates select="section"/>

            </office:text>
        </office:body>
    </xsl:template>

    <xsl:template match="section">
        <xsl:apply-templates select="title"/>
        <xsl:apply-templates select="p|pre"/>
        <!--xsl:apply-templates select="@*|node()"/-->
    </xsl:template>

    <!--xsl:template match="description"></xsl:template-->

    <xsl:template match="p">
        <text:p text:style-name="P1">
            <!-- processing mixed content -->
            <xsl:apply-templates />
        </text:p>
    </xsl:template>

    <!-- default rule: copy any node beneath p -->
    <xsl:template match="p//*">
    <xsl:copy>
        <!--xsl:copy-of select="@*" /-->
        <xsl:apply-templates />
    </xsl:copy>
    </xsl:template>

    <!-- override rule: <link> nodes get special treatment -->
    <!--xsl:template match="description//link">
        <a href="#{@ref}">
            <xsl:apply-templates />
        </a>
    </xsl:template-->

    <!-- default rule: ignore any unspecific text node -->
    <!--xsl:template match="text()" /-->

    <!-- override rule: copy any text node beneath description -->
    <xsl:template match="p//text()">
        <xsl:copy-of select="." />
    </xsl:template>

    <xsl:template match="p//variant">
        <text:span text:style-name="T2">
            <xsl:text disable-output-escaping="no">[</xsl:text>
                <xsl:value-of select="text()"/>
            <xsl:text disable-output-escaping="no">]</xsl:text>
        </text:span>
    </xsl:template>

    <xsl:template match="p//emphasis">
        <text:span text:style-name="T2">
            <xsl:value-of select="text()"/>
        </text:span>
    </xsl:template>

    <xsl:template match="p//strong">
        <text:span text:style-name="T1">
            <xsl:value-of select="text()"/>
        </text:span>
    </xsl:template>

    <xsl:template match="p//tag">
        <text:span text:style-name="T3">
            <xsl:text disable-output-escaping="no">#</xsl:text>
            <xsl:value-of select="text()"/>
        </text:span>
    </xsl:template>

    <xsl:template match="pre">
        <!-- TODO: without indent -->
        <text:p text:style-name="P1">
            <!-- processing mixed content -->
            <!--xsl:apply-templates select="line"/-->
            <xsl:apply-templates />
        </text:p>
    </xsl:template>

    <xsl:template match="line">
        <xsl:value-of select="text()"/>
        <text:line-break/>
    </xsl:template>

    <xsl:template match="title">
        <text:h text:style-name="Heading_20_5"
                text:outline-level="5">
            <xsl:value-of select="p"/>
        </text:h>
    </xsl:template>

    <xsl:template match="p//link">
        <xsl:element name="text:a">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="link-url/text()" />
            </xsl:attribute>
            <xsl:attribute name="text:style-name">Internet_20_link</xsl:attribute>
            <xsl:attribute name="text:visited-style-name">Internet_20_link</xsl:attribute>
            <text:span text:style-name="T1">
                <xsl:value-of select="link-text/text()" />
            </text:span>
        </xsl:element>
    </xsl:template>

    <xsl:template match="empty-line">
    </xsl:template>

</xsl:stylesheet>
