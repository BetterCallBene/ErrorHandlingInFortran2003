<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:str="http://exslt.org/strings" xmlns:regexp="http://exslt.org/regular-expressions">
<xsl:output omit-xml-declaration="yes"  method="text"/>

	<xsl:variable name="debug"/>
	<!-- <xsl:variable name="debug">1</xsl:variable> -->

	<!-- - - - - - - - - - - FORTRAN TYPES AND RANKS - - - - - - - - - - -->

	<!-- The types that are known -->
	<xsl:variable name="types">
		<type format="L1">logical</type>
		<type format="I8">integer</type>
		<type format="ES13.5">real</type>
		<type format="ES23.16">real(kind=kind(1.0d0))</type>
        <type format="A20">character(len=*)</type>
        <type format="ES13.5">complex</type>
        <type format="ES23.16">complex(kind=kind(1.0d0))</type>
	</xsl:variable>

	<!-- The ranks that must be considered (0=scalar,1=array,2=matrix,...) -->
	<xsl:variable name="ranks">
		<rank>0</rank>
		<rank>1</rank>
        <rank>2</rank>
		<!-- <rank>3</rank> -->
	</xsl:variable>

	<!-- - - - - - - - - - - VERSION - - - - - - - - - - -->
	
	<xsl:template match="version" name="version">
		<xsl:param name="callback"/>
		<xsl:param name="version" select="."/>
		<xsl:choose>
			<xsl:when test="$callback = 'module-procedure'">
				<xsl:call-template name="module-procedure"/>
			</xsl:when>
			<xsl:when test="$callback">
				INTERNAL ERROR: unknown callback '<xsl:value-of select="$callback"/>'
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="..">
					<xsl:with-param name="version" select="$version"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="alltypes_allranks">
		<xsl:param name="callback"/>
		
		<xsl:variable name="minrank">
			<xsl:choose>
				<xsl:when test="@minrank"><xsl:value-of select="@minrank"/></xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="maxrank">
			<xsl:choose>
				<xsl:when test="@maxrank"><xsl:value-of select="@maxrank"/></xsl:when>
				<xsl:otherwise>10</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="typefilter"><xsl:value-of select="@typefilter"/></xsl:variable>
		
		<xsl:if test="string-length($typefilter) &gt; 0 and $debug">
		! filter: <xsl:value-of select="$typefilter"/>
		</xsl:if>
		<xsl:call-template name="all">
			<xsl:with-param name="callback" select="$callback"/>
			<xsl:with-param name="cursor">
				<xsl:element name="{name(..)}">
					<xsl:for-each select="exsl:node-set($types)/type[ string-length($typefilter)=0 or starts-with(.,$typefilter)]">
						<xsl:variable name="type" select="."/>
						<xsl:for-each select="exsl:node-set($ranks)/rank[ $minrank &lt;= . and . &lt;= $maxrank ]">
							<xversion>
								<xsl:attribute name="type"><xsl:value-of select="$type"/></xsl:attribute>
								<xsl:attribute name="rank"><xsl:value-of select="."/></xsl:attribute>
							</xversion>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:element>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="all">
		<xsl:param name="callback"/>
		<xsl:param name="cursor"/>
		<!-- =<xsl:value-of select="name(exsl:node-set($cursor)/*)"/>=[<xsl:value-of select="count(exsl:node-set($cursor)/*/xversion)"/>] -->
		<xsl:for-each select="exsl:node-set($cursor)/*/xversion">
			<xsl:call-template name="version">
				<xsl:with-param name="callback" select="$callback"/>
				<xsl:with-param name="version" select="."/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<!-- - - - - - - - - - - TEMPLATES - - - - - - - - - - -->
	
	<xsl:template name="interfaces">
		<xsl:for-each select="*"><xsl:text/>
    public :: <xsl:value-of select="name(.)"/>
    interface <xsl:value-of select="name(.)"/>
			<xsl:apply-templates select="*">
				<xsl:with-param name="callback">module-procedure</xsl:with-param>
			</xsl:apply-templates>
    end interface
    <xsl:text/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="procedures">
		<xsl:for-each select="*"><xsl:text/>

    !--------------------------------------------------------------------------
    ! Procedure <xsl:value-of select="name(.)"/>
<xsl:if test="@comment">
    ! 
    ! <xsl:value-of select="@comment"/></xsl:if>
    !--------------------------------------------------------------------------
    <xsl:apply-templates select="*"/>
		</xsl:for-each><xsl:text>
</xsl:text>
	</xsl:template>
	
	<xsl:template name="rank-specification">
		<xsl:param name="rank" select="@rank"/>
		<xsl:choose>
			<xsl:when test="$rank = 0">
				<!-- NOP -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>, dimension(</xsl:text><xsl:for-each select="exsl:node-set($ranks)/rank[ 0 &lt; . and . &lt;= $rank]"><xsl:if test=". &gt; 1 ">,</xsl:if>:</xsl:for-each><xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="rank-dimension">
		<xsl:choose>
			<xsl:when test="@rank = 0">INTERNAL ERROR: rank-dimension with rank=0 should not occur.</xsl:when>
			<xsl:when test="@rank = 1"><!-- NOP --></xsl:when>
			<xsl:otherwise>
				<xsl:text>, dimension(</xsl:text><xsl:value-of select="@rank"/><xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="rank-specification-equal">
		<xsl:variable name="rank"><xsl:value-of select="@rank"/></xsl:variable>
		<xsl:if test="$rank &gt; 0">
			<xsl:text/>, dimension(<xsl:text/>
			<xsl:for-each select="exsl:node-set($ranks)/*[ 0 &lt; . and . &lt;= $rank]">
				<xsl:text/><xsl:if test=". &gt; 1">,</xsl:if>size(a,<xsl:value-of select="."/>)<xsl:text/>
			</xsl:for-each>)<xsl:text/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="deferred-rank-specification-equal">
		<xsl:variable name="rank"><xsl:value-of select="@rank"/></xsl:variable>
		<xsl:if test="$rank &gt; 0">
			<xsl:text/>, dimension(<xsl:text/>
			<xsl:for-each select="exsl:node-set($ranks)/*[ 0 &lt; . and . &lt;= $rank]">
				<xsl:text/><xsl:if test=". &gt; 1">,</xsl:if>:<xsl:text/>
			</xsl:for-each>)<xsl:text/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="shape-specification-equal">
		<xsl:variable name="rank"><xsl:value-of select="@rank"/></xsl:variable>
		<xsl:if test="$rank &gt; 0">
			<xsl:text/>(<xsl:text/>
			<xsl:for-each select="exsl:node-set($ranks)/*[ 0 &lt; . and . &lt;= $rank]">
				<xsl:text/><xsl:if test=". &gt; 1">,</xsl:if>size(a,<xsl:value-of select="."/>)<xsl:text/>
			</xsl:for-each>)<xsl:text/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="module-procedure"><xsl:text>
        module procedure </xsl:text>	<xsl:call-template name="name-mangler"/>
	</xsl:template>

	<xsl:template name="name-mangler">
<xsl:value-of select="name(..)"/><xsl:for-each select="str:tokenize(str:replace(str:replace(str:replace(@type,'*','star'),'complex(kind=kind(1.0d0))','complex_double'),'real(kind=kind(1.0d0))','real_double'),' =().')">_<xsl:value-of select="."/></xsl:for-each>_rank<xsl:value-of select="@rank"/>
	</xsl:template>
	
	<xsl:template name="type-width">
		<xsl:variable name="type" select="@type"/>
		<xsl:for-each select="exsl:node-set($types)/type[ . = $type]">
			<xsl:value-of select="str:tokenize(@format,'LIFESA.')[1]"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="type-format">
		<xsl:variable name="type" select="@type"/>
		<xsl:for-each select="exsl:node-set($types)/type[ . = $type]">
			<xsl:value-of select="@format"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="type-format-w-optional">
		<xsl:variable name="type" select="@type"/>
		<xsl:for-each select="exsl:node-set($types)/type[ . = $type]">
			<xsl:text/>"//optional_character(fmt,"<xsl:value-of select="@format"/>")//"<xsl:text/>
		</xsl:for-each>
	</xsl:template>

	<!-- - - - - - - - - - - UTILITIES - - - - - - - - - - -->

	<!-- Just some nodes to use as counter -->
	<xsl:variable name="counter">
		<i>1</i>
		<i>2</i>
		<i>3</i>
		<i>4</i>
		<i>5</i>
		<i>6</i>
		<i>7</i>
		<i>8</i>
		<i>9</i>
		<i>10</i>
		<i>11</i>
		<i>12</i>
		<i>13</i>
		<i>14</i>
		<i>15</i>
		<i>16</i>
		<i>17</i>
		<i>18</i>
		<i>19</i>
		<i>20</i>
	</xsl:variable>

	<!-- Utility function to show the structure of some nodes -->
	<xsl:template name="structure">
		<xsl:param name="indent">-</xsl:param><xsl:text>
</xsl:text><xsl:value-of select="$indent"/> <xsl:value-of select="name(.)"/>
		<xsl:for-each select="*">
			<xsl:call-template name="structure">
				<xsl:with-param name="indent">-<xsl:value-of select="$indent"/></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>