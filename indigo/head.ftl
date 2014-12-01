 <meta charset=utf-8 />
  <meta name="author" content="UCL" />
  <meta name="description" content="UCL Search Results Page" />
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0" />

  <title>${brandingH1}</title>
  

  <link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/screen.min.css" media="screen, projection" rel="stylesheet" type="text/css" />
  <link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/search-results.css" media="screen, projection" rel="stylesheet" type="text/css" />
  <link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/site-specific/${siteSpecificstylesheet}.min.css" media="screen, projection" rel="stylesheet" type="text/css" />
  <#if pallette?length != 0>
  <link rel="stylesheet" media="screen, projection" href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/${pallette}.css">
  </#if>
  <!--[if IE]><link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/ie.min.css" rel="stylesheet" />
  <link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/site-specific/${siteSpecificstylesheet}-ie.min.css" rel="stylesheet" /><![endif]-->
  <!--[if lt IE 8]><link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/site-specific/${siteSpecificstylesheet}-ie-old.min.css" rel="stylesheet" /><link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/css/ie-old.min.css" rel="stylesheet" /><![endif]-->
  <link rel="shortcut icon" href="/s/resources/${question.collection.id}/_default_preview/favicon.ico" />
  <link rel="apple-touch-icon-precomposed" href="/s/resources/${question.collection.id}/_default_preview/favicon-152.png">
  <meta name="msapplication-TileColor" content="#000000">
  <meta name="msapplication-TileImage" content="/s/resources/${question.collection.id}/_default_preview/favicon-144.png">

  <script src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/lib/modernizr-custom.js"></script>

  <script>
    var cuttingTheMustard = document.querySelector && window.localStorage && window.addEventListener;

    Modernizr.load({
      //cutting the mustard as used by the BBC
      test : cuttingTheMustard
      //if old browser load the shiv
      ,nope : [
        '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.js'
        ,'//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/respond-x-domain/respond.min.js'
        ,'//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/lib/respond.proxy.min.js'
      ]
    });
    //set conditional assets for main.js
    var globalSiteSpecificVars = {
      pathToJquery: 'http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min'
      ,googleAnalyticsIdsArray: ['UA-943297-1']//specify site specific id's NOT UCL generic UA-943297-1
    }
    if(cuttingTheMustard){
      globalSiteSpecificVars.pathToJquery = "//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min";
    }
    globalSiteSpecificVars.funnelbackCollection = '${question.collection.id}';
    
  </script>
  <script src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/lib/require.min.js"></script>
  <script src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/main.js"></script>
  <link href="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/js/respond-x-domain/respond-proxy.html" id="respond-proxy" rel="respond-proxy" />
        <link href="/s/resources/${question.collection.id}/_default_preview/respond.proxy.gif" id="respond-redirect" rel="respond-redirect" />

  <script>
    require(["app/general","app/search"]);
  </script>