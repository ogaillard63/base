<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>{$title|default:"Home"}</title>
    <link rel="shortcut icon" href="tpl/assets/img/favicon.ico">
    <!-- Bootstrap -->
    <link href="{$base_dir}/tpl/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{$base_dir}/tpl/assets/css/custom.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="{$base_dir}/tpl/assets/js/bootstrap.min.js"></script>
  </head>
  <body>
    {include file="nav.tpl"}
     <div class="container">
    {include file="$content"}
      </div> <!-- /container -->
      {if isset($alert)}<div class="alert alert-{$alert.type} notification alert-dismissable fade in">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          {$alert.msg}</div>
      <script type="text/javascript">
      $(document).ready(function () {
        $(".notification").fadeTo(4000, 500).fadeOut(500, function(){
            $this.alert('close');
        });
      });
</script>{/if}
  </body>
</html>