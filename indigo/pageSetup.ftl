<#assign selectedTab = "subject area">
<@s.AfterSearchOnly>
<#assign facetCatCount = 0>
<#list response.facets as f>
        <#assign facetCatCount = facetCatCount + f.categories?size>
</#list>
<#-- Explicitly don't show the facets on the websites tab -->
<#if (facetCatCount == 0)>
        <#assign showFacets = false />
<#-- we dont want to show facets if there is only one result -->
<#elseif (response.resultPacket.resultsSummary.totalMatching == 1)>
  <#assign showFacets = false />
<#else>
    <#assign showFacets = true />
</#if>
</@s.AfterSearchOnly>