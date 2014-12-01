<#ftl encoding="utf-8" />

<#-- set up the page here, much logic -->
<#include "config.ftl" parse=true>
<#include "pageSetup.ftl" parse=true>

<!DOCTYPE html>
<html>
<head>
  <#include "head.ftl" parse=true />
</head>

<body id="index" class="horizontal-nav horizontal-nav--1col search-page">

<#-- navigation header bar --> 
<#include "nav-header.ftl" parse=true />

<div id="site-content" class="wrapper">

  <header id="header-mobile"  class="default-header">

    <a id="nav-mobile-menu" href="#"><img src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/images/mob-nav.png" alt="Menu" /></a>

  </header>

  <div id="main" class="clearfix">
<div class="search-title"><h1 class="heading">Search How to Guides</h1></div>

    <#include "topNav.ftl" parse=true />

    <div class="search-results__meta">
       <#--<#if question.collection.id != "website-secure-meta">
      <div class="secure-login">
  <button class="secure-login--mobile">?</button>
        <a href="?${changeParam(QueryString, "collection", "website-secure-meta")}" class="sign-in--search">Login</a>
        <p>Authenticated UCL staff &amp; students have access to more, and richer, results</p>
      </div>
      <#else>
  <div class="secure-login">
     <p>You are authenticated to UCL's network</p>
  </div>
      </#if>-->
      <!-- search-box -->
      <div class="search-box">
         <#assign searchInputFiller = question.query?html />
      <#if searchInputFiller == "!padrenullquery">
        <#assign  searchInputFiller = "" />
         </#if>
        <form name="searchcollection" action="" method="get" role="search">
         <@s.IfDefCGI name="query"> <input type="text" name="query" value="${searchInputFiller}" placeholder="Search how to guides"/></@s.IfDefCGI>
            <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!?html}">
            <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!?html}"></@s.IfDefCGI>
      <@s.IfDefCGI name="tab"><input type="hidden" name="tab" value="${question.inputParameterMap["tab"]!?html}"></@s.IfDefCGI>
    
           <button class="btn search" type="submit">Search</button>
        </form>
         <div id="siteSearchErrorField">Please enter a search term</div>
      </div>
      <!-- search-box -->

       <!-- collections__list -->
     <#-- collections / tabs included 
       <#include "tabs.ftl" parse=true />
      -->
      <!-- collections -->
    </div>
    <!-- search-results__meta -->

    <div class="search-results">

      <!-- button for off-canvas on narrow viewports -->
      <a class="off-canvas btn" href="#">Refine your results</a>

   <@s.AfterSearchOnly>
      <!-- results-listed -->
      <#if searchInputFiller == "!padrenullquery">
  <p class="results-listed">
  <#if (response.resultPacket.resultsSummary.totalMatching > 1)>
<span class="page-start">${response.resultPacket.resultsSummary.currStart}</span> -
        <span class="page-end">${response.resultPacket.resultsSummary.currEnd}</span> of
        <span class="total-matching">${response.resultPacket.resultsSummary.totalMatching}</span>
        results found<#if ((question.query!"")?length > 0) && (question.query != "")> for <strong class="results-query">${question.query}</strong></#if>.
  </#if>

        <#if (response.resultPacket.resultsSummary.totalMatching == 1)>
        <span class="page-start">${response.resultPacket.resultsSummary.currStart}</span> -
        <span class="page-end">${response.resultPacket.resultsSummary.currEnd}</span> of
        <span class="total-matching">${response.resultPacket.resultsSummary.totalMatching}</span>
        results found<#if (question.query?length > 0) && (question.query != "")> for <strong class="results-query">${question.query}</strong></#if>.
        </#if>  
  
  <#if (response.resultPacket.resultsSummary.totalMatching == 0)>
        <#-- More expanded message according to mantis 23089 -->
  We're sorry, but no results have been found<#if (question.query?length > 0) && (question.query != "")> for <strong class="results-query">${question.query}</strong></#if><#if question.inputParameterMap["tab"]??> in <strong>${question.inputParameterMap["tab"]?replace('directory', 'people')?capitalize?html}</strong></#if>.
  <#--<#if topTab?? && topTab.name??> Try looking in <a href="?${changeParam(QueryString, "tab", topTab.meta_name)}">${topTab.name?replace('Directory','People')}</a> instead? </#if>-->
  </#if>

  <#-- spelling suggestions -->
  <#-- disabled, using blending instead! -->
  
  <#if 1 == 2 && response.resultPacket.spell?? && response.resultPacket.resultsSummary.currStart == 1>
        <span class="did-you-mean">Did you mean: <a href="?${response.resultPacket.spell.url!""}">
          <span class="search-highlight">${response.resultPacket.spell.text!""}</span></a>?
        </span>
  </#if>
  <@fb.CheckBlending />
  <#-- spelling suggestions -->

      </p>
      </#if>
      <!-- results-listed -->
  </@s.AfterSearchOnly>
  
      <!-- results sort by option -->
      <#-- Do not show sort options for singleton results -->
      <#if response.resultPacket.resultsSummary.totalMatching &gt; 1>
      <div id="results-sort-by">
  <form>
        <select name="sort">
          <option name="" value="" <#if !(question.inputParameterMap["sort"]??) || question.inputParameterMap["sort"] == "">selected</#if>>Relevance</option>
          <option name="sort" value="title" <#if question.inputParameterMap["sort"]?? && question.inputParameterMap["sort"] == "title">selected</#if>>A-Z</option>
          <option name="sort" value="dtitle" <#if question.inputParameterMap["sort"]?? && question.inputParameterMap["sort"] == "dtitle">selected</#if>>Z-A</option>
        </select>
  </form>
      </div>
      </#if>
      <!-- results sort by option -->
      <#if question.selectedCategoryValues?? && question.selectedCategoryValues?has_content>
      <!-- mobile pillboxes -->
      <div class="pillbox-container pillboxes--mobile" data-set="js-pillboxes">
  <div class="pillbox--inner">
        <h4>Your selections</h4>
        <ul class="pillboxes">
     <#assign facetKeys = question.selectedCategoryValues?keys>
                <#list facetKeys as facetKey>
                <!-- pillbox item -->
                <#list question.selectedCategoryValues[facetKey] as facetValue>
                        <li class="pillbox">
                                <#assign qs = urlDecode(QueryString) />
                                <#assign facetName = urlDecode(facetKey!"")?replace('f.','')?replace('\\|(.)*','','r') />
                                <a class="pillbox__link" href="?${qs?replace("${facetKey}=${facetValue}","")?replace("&{2,}","&","ir")}">${facetName}: ${facetValue?capitalize}<span>x</span></a>
                        </li>
                </#list>
                <!-- pillbox item -->
                </#list>
        </ul>
        </div>
      </div>
       <!-- mobile pillboxes -->
      </#if>

      <@s.AfterSearchOnly>
  <@s.BestBets>
      <!-- best bet result -->
      <div class="result__item result__item--best-bet">
        <h3 class="result__title">
          <#if s.bb.title??><a href="${s.bb.clickTrackingUrl?html}"><@s.boldicize>${s.bb.title}</@s.boldicize></a></#if>
        </h3>
  <#if s.bb.description??><p class="result__text"><@s.boldicize>${s.bb.description}</@s.boldicize></p></#if>
        <a class="result__link" href="${s.bb.clickTrackingUrl?html}" title="<#if s.bb.title??>${s.bb.title}</#if>">${s.bb.link}</a>
      </div>
      <!-- best be result -->
  </@s.BestBets>
  </@s.AfterSearchOnly>
  #
  <#include "results.ftl" parse=true />
  <#-- we have a switch statement to load the correct result type, based on collection / meta data -->
        <!-- search result -->
  
  <@s.Results>
  <#if s.result.class.simpleName != "TierBar">
  <#if s.result.metaData['e']??>
    <#switch s.result.metaData['e']?replace('^.*\\|','','r')>
      <#case "research"><#--temp leave here as an example-->
        <#include "result__research.ftl" parse=true />
      <#break>
      <#break>
      <#default>
        <#include "result__default.ftl" parse=true />
      <#break>
    </#switch>
  <#else>
    <#include "result__default.ftl" parse=true />
  </#if>
  </#if>
  </@s.Results>
      </ol>
      <!-- search results list -->
      <!-- search navigation -->
      <div class="results-nav">
  <@s.PrevNext />
      </div>
      <!-- search navigation -->

    </div><!-- end .search-results -->
 
  <#-- facets included -->
    <#include "facets.ftl" parse=true />

  </div>

  <!-- end main slot where silva content gets rendered-->

</div>


<!--End last modified info-->


<!-- </div>end #site-content -->

<#-- footer included -->
<#include "footer.ftl" />
<#--
<script src="/s/resources/${question.collection.id}/_default_preview/js/jquery.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/ucl.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/gridset-overlay.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/soundmanager2/soundmanager2-jsmin.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="NmFq93RR/ioemxMEtxGgvNDNjp55xLjEW5XrEA==";</script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/typeahead.bundle.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/handlebars.js"></script>
<script src="/s/resources/${question.collection.id}/_default_preview/js/audio.jquery-edit.js"></script>-->

<#-- taken this out of above into all site js ucl_general_js.ftl
-->
<!-- Google Analytics 
  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-47604398-1', 'auto');
  var searchFormCount = $('#query').val().length;
  $(document).on('hover','li.tt-suggestion', function() {
    var searchLabel = $(this).find('a').text();
    ga ('send', 'event', 'Autocomplete', 'click', searchLabel, searchFormCount, {
      // for testing only
      'hitCallback': function() {
          console.log(searchLabel);
        }
    });
  });
  ga('send', 'pageview', {
    // for testing only
    'hitCallback': function() {
      //console.log('analytics.js done sending pageview data');
    }
  });-->
</script>
<!-- End Google Analytics -->

</body>
</html>
