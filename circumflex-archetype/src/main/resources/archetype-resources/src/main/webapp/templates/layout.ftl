[#ftl]
[#macro page]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet"
          type="text/css"
          media="screen"
          href="/static/css/main.css"/>
    <title>Simple Circumflex Application</title>
  </head>
  <body>
    <div id="header">
    </div>
    <div id="outer">
      <div id="content">
        [#nested/]
      </div>
      <div id="footer">
        <span class="copyright">2008-${currentYear}</span> ©
        <a class="home" href="http://${host}">${host}</a>
      </div>
    </div>
  </body>
</html>
[/#macro]