<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NLB Тутунска Банка - Евиденција на ИТ опрема</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    
    <link rel="Shortcut Icon" href="images/ikona.png" />
    <link href="Styles/login.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap-responsive.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="Scripts/jquery.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.9.1.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/TweenLite.min.js"></script>

    <style  type="text/css">
	    body{
		    background: url('images/back.png');
		    background-color: #444;
		    background: url('images/pinlayer2.png'),url('images/pinlayer1.png'),url('images/back.png');    
	    }

	    .vertical-offset-100{
		    padding-top:100px;
	}
	</style>
  
	<script type="text/javascript" >
	    $(document).ready(function () {
	        $(document).mousemove(function (e) {
	            TweenLite.to($('body'),
			.5,
			{ css:
				{
				    'background-position': parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / 12) + "px, " + parseInt(event.pageX / 15) + "px " + parseInt(event.pageY / 15) + "px, " + parseInt(event.pageX / 30) + "px " + parseInt(event.pageY / 30) + "px"
				}
			});
	        });
	    });
	</script>
  
   
</head>
<body>
    <form id="form1" runat="server">


    <div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title" style="color:White">Логирајте се</h3>
			 	</div>
			  	<div class="panel-body">
			    	
                    <div class="post">
						    <p><img src="images/Tutunska.png" alt="" height="50px" width="300px"/></p>
						
						    <div style="clear: both;">&nbsp;</div>
						    <div class="entry">

							    <div id="register">

                                    <asp:Label ID="lblUN" runat="server" Text="Корисничко име:"></asp:Label>
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="validationUN" runat="server" 
                                        ControlToValidate="txtUserName" ErrorMessage="Внесете корисничко име! " 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblP" runat="server" Text="Лозинка:"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" style="margin-left:50px;" ToolTip="Внесето ја вашата лозинка!" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="validationP" runat="server" 
                                        ControlToValidate="txtPassword" ErrorMessage="Внесето ја вашата лозинка! " 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />

                                </div>
                                <div style="clear: both;">&nbsp;<br />
                                    <asp:Label ID="lblGreska" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button ID="btnOK" class="btn btn-success" runat="server" onclick="btnOK_Click" Text="Влез" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
						    </div>
					    </div>


			    </div>
			</div>
		</div>
	</div>


    </div>
    </form>
</body>
</html>
