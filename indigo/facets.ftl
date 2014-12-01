<@s.AfterSearchOnly>
<aside class="facets">
  <span class="mobileCloseAside">X</span>
  <div class="module--facets module">
  <h2>Refine your results</h2>
  <#if showFacets>
  <#assign youHaveFilteredList = "">
  <#assign youHaveCount = 0/>
  <#assign facetKeysFacetNav = question.selectedCategoryValues?keys>
  <#list facetKeysFacetNav as facetKeyFacetNav>
    <#list question.selectedCategoryValues[facetKeyFacetNav] as facetValueFacetNav>
          <#--<#if youHaveCount == 0>
            <#assign youHaveFilteredList = facetValueFacetNav?capitalize>
          <#elseif youHaveCount == question.selectedCategoryValues?size>
           <#assign youHaveFilteredList = youHaveFilteredList + " & " +  facetValueFacetNav?capitalize>
          <#else>  
            <#assign youHaveFilteredList = youHaveFilteredList + " & " + facetValueFacetNav?capitalize + ","> 
          </#if>
          <#assign youHaveCount = youHaveCount + 1 />-->

          <#assign youHaveFilteredList = youHaveFilteredList + "<li>" + facetValueFacetNav?capitalize + "</li>"> 

    </#list>
  </#list>
  <#if youHaveFilteredList?length &gt; 0>
    <p>You have filtered by</p>
    <ul class="filteredListing">
      ${youHaveFilteredList}
    </ul>
  </#if>
  </#if>
  <@s.FacetedSearch>
      <div id="fb-facets">
          <#if showFacets>
               <form name="search-form">
              
                <@fb.MultiFacet names=multiFacetsForDisplay>
                        <@fb.MultiCategories facet=fb.facet />
                  </@fb.MultiFacet>
              
               <#--<br />
                <@s.Facet>
                    <@s.Category>
                        <@s.CategoryName />
                    </@s.Category>
                    <@s.MoreOrLessCategories />
                </@s.Facet>-->

              </form>
             
          <#else>
           <h4>Nothing to refine by</h4>

          </#if>
         
      </div>
  </@s.FacetedSearch>
  </div>
</aside>
</@s.AfterSearchOnly>