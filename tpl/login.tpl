<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Base</title>
    <link rel="shortcut icon" href="{$base_dir}/tpl/assets/img/favicon.ico">
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
</head>

<body>
    <div class="container" role="main">
        <section id="login-container">
            <div class="row">
                <div class="col-12" id="login-wrapper">
                    <div class="panel panel-primary animated flipInY">
                        <div class="panel-heading">
                            <h4>Identification</h4>
                        </div>
                        <div class="panel-body">
                            <p> Login to access your account.</p>
                            <form class="form-signin form-horizontal" role="form" method="post" action="{$base_dir}/">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="login" placeholder="Login" name="login">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                </div>
                                                        <div class="form-group">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="{$base_dir}/tpl/assets/js/bootstrap.min.js"></script>
</body>

</html>