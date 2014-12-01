 <div id="nav-wrap">

    <a id="nav-mobile-back" href="#"><img src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/images/close.png" alt="X" /> Close</a>

    <nav id="global-masthead">

      <div class="wrapper clearfix">

        <div id="global-search">
          <form action="" id="fb-global-form" method="get">
          <div id="searchform">
 <#assign searchInputFiller = question.query?html />
      <#if searchInputFiller == "!padrenullquery">
        <#assign  searchInputFiller = "" />
         </#if>
         <@s.IfDefCGI name="query">
    <input type="search" id="query" name="query" value="${searchInputFiller}" placeholder="Search website" id="search" value="">
  </@s.IfDefCGI>
            <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!?html}">
            <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!?html}"></@s.IfDefCGI>
            <@s.IfDefCGI name="profile"><input type="hidden" name="profile" value="${question.inputParameterMap["profile"]!?html}"></@s.IfDefCGI>
            <@s.IfDefCGI name="tab"><input type="hidden" name="tab" value="${question.inputParameterMap["tab"]!?html}" id="fb-tab"></@s.IfDefCGI>
          </div>
          <input type="submit" name="sumbit" value="Go" class="btn search" />
        </form>
      </div>

      <ul id="audiences" class="m-clear">
        <li><a href="index.php">UCL Home</a></li>
        <li><a href="prospective-students.php">Prospective students</a></li>
        <li><a href="current-students.php">Current students</a></li>
        <li><a href="staff.php">Staff</a></li>
      </ul>
    </div>

  </nav><!-- end #global-masthead -->

  <div class="wrapper">

    <div class="photograph">

      <header id="ucl-masthead" role="header">

        <div id="branding">
          <p>${brandingH1}</p>
          <img src="//cdn.ucl.ac.uk/silva/UCLIndigoSkin/images/ucl-logo.svg" alt="UCL logo" id="logo">
        </div>

      </header>

      <div class="site-brand">

        <p class="photograph-description">A nascent retina, generated from a 3D embryonic stem cell culture</p>

      </div>

    </div><!-- end .photograph -->

    <div id="leftcol">
      <!-- start of mobile nav -->
      <nav class="mobilenav">
        <ul>
          <li><a href="//www.ucl.ac.uk/isd" class="navitem selectednav">Home</a></li>
          <li>
            <a href="//www.ucl.ac.uk/isd/how-to" class="navitem">How to guides</a>                       
          </li>
          <li>
            <a href="//www.ucl.ac.uk/isd/services" class="navitem">Our Services</a>
          </li>
          <li>
            <a href="//www.ucl.ac.uk/isd/about" class="navitem">About ISD</a>
          </li>
        </ul>
      </nav><!-- End of mobile nav -->

    </div><!-- end #leftcol -->

  </div> <!-- end .wrapper -->

</div><!-- end #nav-wrap -->
