<li class="result__item result__item--web">
          <h3 class="result__title">
            <a href="${s.result.clickTrackingUrl}" title="${s.result.title}"><@s.boldicize>${s.result.title}</@s.boldicize></a>
          </h3>
          <a class="result__link" href="${s.result.clickTrackingUrl}" title="${s.result.title}">${s.result.displayUrl}</a>
          <p class="result__summary">
    <#if s.result.summary??><@s.boldicize>${s.result.summary}</@s.boldicize></#if>
          </p>
</li>
<!-- search result -->