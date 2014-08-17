<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sifrarnici.aspx.cs" Inherits="TimskaRabota_Sifrarnici" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NLB Тутунска Банка - Евиденција на ИТ опрема</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   
    <link href="Styles/style.css" rel="stylesheet" type="text/css" media="screen" />
    <link  media="screen"  rel="stylesheet" href="images/glyphicons-halflings.png" />
    <link href="images/glyphicons-halflings-white.png"  media="screen"  rel="stylesheet" />
    <link rel="Shortcut Icon" href="images/ikona.png"  media="screen"   />
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap-responsive.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" media="screen" />
   
    <script type="text/javascript" src="Scripts/jquery.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.9.1.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
	
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="Jquery/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="Jquery/jquery.editinplace.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            //Modalen
            $("#primary").hide();
            $("#primary1").hide();
            $("#primary2").hide();
            $("#primary3").hide();
            $("#primary4").hide();
            $("#primary5").hide();
            $("#primary6").hide();
            $("#primary7").hide();
            $("#primary8").hide();
            $("#primary9").hide();
            //Kopcinja so malecki bukvi-se klikat gore
            //Listi ddl
            $("#ddlProizvoditel").hide();
            $("#ddlTipOprema").hide();
            $("#ddlModel").hide();
            $("#ddlDobavuvac").hide();
            $("#ddlStatus").hide();
            $("#ddlKorisnik").hide();
            $("#ddlGrad").hide();
            $("#ddlOrganizaciona").hide();
            $("#ddlSluzba").hide();
            $("#ddlSektor").hide();
            // $("#TipOprema").show();
            $("#btnPrikaziDodadi").hide();
            $("#btnPrikaziDodadi1").hide();
            $("#btnPrikaziDodadi2").hide();
            $("#btnPrikaziDodadi3").hide();
            $("#btnPrikaziDodadi4").hide();
            $("#btnPrikaziDodadi5").hide();
            $("#btnPrikaziDodadi6").hide();
            $("#btnPrikaziDodadi7").hide();
            $("#btnPrikaziDodadi8").hide();
            $("#btnPrikaziDodadi9").hide();
            

            $(".btn btn-danger pull-right").click(function () {

                $(".RemoveRequired").prop('required', false);
            });
            $(".btn btn-danger pull-right").click(function () {

                $(".close").prop('required', false);
            });

            $("#tipOprema").click(function () {
                $("#ddlTipOprema").show();
                $("#btnPrikaziDodadi").show();
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();

                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });

            $("#proizvoditel").click(function () {
                $("#ddlProizvoditel").show();
                $("#btnPrikaziDodadi1").show();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();

                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });

            $("#model").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlModel").show();
                $("#btnPrikaziDodadi2").show();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#dobavuvac").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").show();
                $("#btnPrikaziDodadi3").show();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#status").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").show();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").show();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#korisnik").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").show();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").show();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#grad").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").show();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").show();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#organizaciona").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").show();
                $("#ddlSluzba").hide();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").show();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#sluzba").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").show();
                $("#ddlSektor").hide();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").show();
                $("#btnPrikaziDodadi9").hide();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#sektor").click(function () {
                $("#ddlProizvoditel").hide();
                $("#btnPrikaziDodadi1").hide();
                $("#btnPrikaziDodadi").hide();
                $("#ddlTipOprema").hide();
                $("#ddlModel").hide();
                $("#btnPrikaziDodadi2").hide();
                $("#ddlStatus").hide();
                $("#ddlKorisnik").hide();
                $("#ddlGrad").hide();
                $("#btnPrikaziDodadi4").hide();
                $("#btnPrikaziDodadi5").hide();
                $("#btnPrikaziDodadi6").hide();
                $("#ddlDobavuvac").hide();
                $("#btnPrikaziDodadi3").hide();
                $("#ddlOrganizaciona").hide();
                $("#ddlSluzba").hide();
                $("#ddlSektor").show();
                $("#btnPrikaziDodadi7").hide();
                $("#btnPrikaziDodadi8").hide();
                $("#btnPrikaziDodadi9").show();
                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });

            $("#btnPrikaziDodadi").click(function () {

                $("#primary").show();
                $("#txtTipOprema").prop('required', true);
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi1").click(function () {
               
                $("#primary").hide();
                $("#primary1").show();
                $("#txtProizvoditel").prop('required', true);
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi2").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").show();
                $("#txtModel").prop('required', true);
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi3").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#txtDobavuvac").prop('required', true);
                $("#primary3").show();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi4").click(function () {

                $("#primary").hide();
                $("#primary1").hide(); 
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").show();
                $("#txtStatus").prop('required', true);
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi5").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide(); 
                $("#primary5").show();
                $("#txtKorisnik").prop('required', true);
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi6").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide(); 
                $("#primary5").hide();
                $("#primary6").show();
                $("#txtGrad").prop('required', true);
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi7").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").show();
                $("#txtOrganizaciona").prop('required', true);
                $("#primary8").hide();
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi8").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide(); 
                $("#primary8").show();
                $("#txtSluzba").prop('required', true);
                $("#primary9").hide();
            });
            $("#btnPrikaziDodadi9").click(function () {

                $("#primary").hide();
                $("#primary1").hide();
                $("#primary2").hide();
                $("#primary3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide(); 
                $("#primary9").show();
                $("#txtSektor").prop('required', true);
            });
        });
    </script>
    <style type="text/css">
        h2{
            margin: 0;     
            color: #666;
            padding-top: 90px;
            font-size: 52px;
            font-family: "trebuchet ms", sans-serif;    
        }
        .item{
            background: #2980b9;    
            text-align: center;
            height: 350px !important;
        }
        .carousel{
            /*margin-top: 20px;*/
        }
        .bs-example{
	        /*margin: 20px;*/
        }
        .modal-header-primary {
	        color:#fff;
            padding:9px 15px;
            border-bottom:1px solid #eee;
            background-color: #428bca;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
             border-top-left-radius: 5px;
             border-top-right-radius: 5px;
        }
    </style>
</head>
    
<body>
    <form id="form1" runat="server">
        <header class="row">
		    <div class="navbar navbar-fixed-top" style="margin-bottom: 2px;">
	            <div class="navbar-inner" >
	            <div class="container">
	                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                </button>
	          	    <div id="header_logo" style="margin-right: 10px;float: left;position:absolute;margin: 0px auto;width: 300px;vertical-align: middle;">		
						<asp:ImageButton runat="server" ID="btnSkrieno" Visible="True"  src="images/Tutunska.png" style="width:300px"
                                            />  
			 	    </div>		  
	        	    <div class="nav-collapse collapse" > 
						    <ul	id="nav-menu" class="nav" style="margin-left: 300px;">
							    <li class="divider-vertical"></li>
								    <li><asp:Button runat="server" ID="btnPocetna" Text="Почетна" BackColor="Transparent" BorderStyle="None" OnClick="btnPocetna_Click" /></li>
						            <li class="divider-vertical"></li>
						            <li id="lblTest" runat="server"><asp:Button runat="server" BackColor="Transparent" ID="btnSledi" Text="Следење на опремата" BorderStyle="None" OnClick="btnSledi_Click" /></li>
						            <li class="divider-vertical"></li>
						            <li><asp:Button ID="btnSifrarnici" runat="server" Text="Шифрарници" BackColor="Transparent" BorderStyle="None" ToolTip="Уредување на шифрарници" OnClick="btnSifrarnici_Click" ></asp:Button></li>
						            <li class="divider-vertical"></li>
						            <li><a href="">Contact</a></li>
						            <li class="divider-vertical"></li>
							           
						    </ul>
                                <div style="float:right;display:inline;">
                                <label id="lblUser" style="margin-top:10px;float:left;margin-right:5px;">User:</label>
                                <p style="float:left;display:inline;margin:8px 5px 0 0;font-weight:bold;"><asp:Label ID="lblUser" runat="server" Visible="true" ></asp:Label></p>
                                <p style="float:right;display:inline;margin:5px 5px 0 0;">
                                    <asp:Button ID="btnLogout" runat="server" class="btn btn-danger" style="margin-right:5px;margin-top:-2px;" Text="Log Out" OnClick="btnLogout_Click" ></asp:Button></p>
                            </div>
				    </div>
	            </div>
	            </div>
    	    </div>
        </header>

        <div class="container" style="margin-top:50px;">

            <div class="">

                <div class="col-lg-12">
                    <h1 class="page-header">Уредување на Шифрарници
                        <small>Прегледај / Додај</small>
                    </h1>
                </div>

            </div>
             <div class="row">

                <div class="col-lg-6 col-md-6 portfolio-item">
                        <div style="min-height:20px;padding:19px;margin-bottom:20px;" class="text-center">
                        <button id="tipOprema" type="button" class="btn btn-hot text-uppercase btn-lg">Тип на опрема</button>
                        <button id="proizvoditel" type="button" class="btn btn-sunny text-uppercase btn-lg">Производител</button>
                        <button id="model" type="button" class="btn btn-fresh text-uppercase btn-lg">Модел</button>
                        <button id="dobavuvac" type="button" class="btn btn-sky text-uppercase btn-lg">Добавувач</button>
                        <button id="status" type="button" class="btn btn-hot text-uppercase btn-lg">Статус</button>
                        <button id="korisnik" type="button" class="btn btn-sunny text-uppercase btn-lg">Корисник</button>
                        <button id="grad" type="button" class="btn btn-fresh text-uppercase btn-lg">Град</button>
                        <button id="organizaciona" type="button" class="btn btn-sky text-uppercase btn-lg">Организациона единица</button>
                        <button id="sluzba" type="button" class="btn btn-hot text-uppercase btn-lg">Служба</button>
                        <button id="sektor" type="button" class="btn btn-sunny text-uppercase btn-lg">Сектор</button>
                    </div>
                    
                </div>

                <div id="DDLlisti" class="col-lg-6 col-md-6 portfolio-item">
                   
                    <article style="margin:80px;">
                            <section>
                                <asp:DropDownList  ID="ddlTipOprema" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlProizvoditel" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlModel" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlDobavuvac" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlStatus" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlKorisnik" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlGrad" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlOrganizaciona" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlSluzba" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlSektor" runat="server"></asp:DropDownList>
                                <asp:Button ID="btnPrikaziDodadi" class="btn btn-primary" href="#primary" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi1" class="btn btn-primary" href="#primary1" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi2" class="btn btn-primary" href="#primary2" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi3" class="btn btn-primary" href="#primary3" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi4" class="btn btn-primary" href="#primary4" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi5" class="btn btn-primary" href="#primary5" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi6" class="btn btn-primary" href="#primary6" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi7" class="btn btn-primary" href="#primary7" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi8" class="btn btn-primary" href="#primary8" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                <asp:Button ID="btnPrikaziDodadi9" class="btn btn-primary" href="#primary9" style="margin-top: -10px;" data-toggle="modal" runat="server" Text="Додади" />
                                
                                <%--<asp:DropDownList ID="ddlTipModeli" runat="server" DataSourceID="SqlDataSource1" DataTextField="TipOprema" DataValueField="TipOprema" OnSelectedIndexChanged="ddlTipModeli_SelectedIndexChanged"  ></asp:DropDownList>
                                --%>

                                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema] ORDER BY [ID_TipOprema]"></asp:SqlDataSource>--%>
                                <%--<asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Model" DataValueField="Model"></asp:ListBox>--%>                <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT m.Model FROM MODEL AS m INNER JOIN TipOprema AS t ON m.ID_TipOprema = t.ID_TipOprema"></asp:SqlDataSource>--%>
                                <%--<asp:Button ID="btnPrikazi" class="btn btn-info" runat="server" Text="Прикажи"  />--%>
                                <%--<asp:ListBox ID="lsbTipOprema" runat="server" DataSourceID="SqlDataSource3" DataTextField="TipOprema" DataValueField="TipOprema" ></asp:ListBox>--%>                <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema]"></asp:SqlDataSource>--%>
                            
                           
                         <%--       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                    <Columns>
                                        <asp:BoundField DataField="Model" HeaderText="MODEL" />
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>--%>
                                <br />
                            </section>
                        </article>
                    </div>



                </div>
            </div>

      <%--        <a class="btn btn-primary" href="#primary" data-toggle="modal"><h4><i class="glyphicon glyphicon-eye-open"></i> Primary</h4></a>--%>
        <!-- Modal -->
          <div class="modal fade" id="primary" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button1" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Тип на опрема</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label1" style="float:left;margin-right:5px;" runat="server" Text="Име Тип Опрема:"></asp:Label>
                            <asp:TextBox ID="txtTipOprema" class="RemoveRequired" type="text" style="margin-top:-5px;" runat="server"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="Изберете Производител:"></asp:Label>
                            <asp:DropDownList ID="ddlTipOpremaPROIZVODITEL" style="margin-top:5px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="Proizvoditel" DataValueField="Proizvoditel"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button2" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="Button2_Click" />
                            <asp:Button ID="btnIzgasiModalen" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

           <!-- Modal -->
          <div class="modal fade" id="primary1" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button3" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Прозводител</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label2" runat="server" Text="Име производител:"></asp:Label>
                            <asp:TextBox ID="txtProizvoditel" class="RemoveRequired" type="text" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiProzvoditel" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiProzvoditel_Click"  />
                            <asp:Button ID="Button5" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

         <!-- Modal -->
          <div class="modal fade" id="primary2" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button4" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Модел</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label4" style="float:left;margin-right:5px;" runat="server" Text="Изберете Тип Опрема:"></asp:Label>
                            <asp:DropDownList ID="DDLTipOprema_Model"  style="margin-top:-5px;margin-right: 15px;"  runat="server" DataSourceID="SqlDataSource2" DataTextField="TipOprema" DataValueField="TipOprema"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema]"></asp:SqlDataSource>
                            <asp:Label ID="Label13" style="float:left;margin-right:5px;" runat="server" Text="Изберете Производител:"></asp:Label>
                            <asp:DropDownList ID="DropDownList1"  style="margin-top:-5px;margin-right: 121px;"  runat="server" DataSourceID="SqlDataSource3" DataTextField="Proizvoditel" DataValueField="Proizvoditel"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                           
                            <asp:Label ID="Label6" runat="server" Text="Име Модел:"></asp:Label>
                            <asp:TextBox ID="txtModel" type="text" class="RemoveRequired" style="margin-top: -25px;position: absolute;margin-left: 85px;" runat="server"></asp:TextBox>
                       
                             </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiModel" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiModel_Click"  />
                            <asp:Button ID="Button7" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

                <!-- Modal -->
          <div class="modal fade" id="primary3" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button8" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Добавувач</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label5" runat="server"  Text="Име добавувач:"></asp:Label>
                            <asp:TextBox ID="txtDobavuvac" type="text"  class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiDobavuvac" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiDobavuvac_Click" />
                            <asp:Button ID="Button10" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

          <!-- Modal -->
          <div class="modal fade" id="primary4" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button6" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Статус</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label7" runat="server" Text="Име Статус:"></asp:Label>
                            <asp:TextBox ID="txtStatus" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiStatus" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiStatus_Click" />
                            <asp:Button ID="Button11" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

          <!-- Modal -->
          <div class="modal fade" id="primary5" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button12" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Корисник</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label8" runat="server" Text="Име корисник:"></asp:Label>
                            <asp:TextBox ID="txtKorisnik" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiKorisnik" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiKorisnik_Click" />
                            <asp:Button ID="Button14" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

          <!-- Modal -->
          <div class="modal fade" id="primary6" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button15" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Град</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label9" runat="server" Text="Град:"></asp:Label>
                            <asp:TextBox ID="txtGrad" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiGrad" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiGrad_Click" />
                            <asp:Button ID="Button17" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
         <!-- Modal -->
          <div class="modal fade" id="primary7" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button9" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Организациона Единица</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label10" runat="server" Text="Организациона Единица:"></asp:Label>
                            <asp:TextBox ID="txtOrganizaciona" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiOrganizaciona" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiOrganizaciona_Click" />
                            <asp:Button ID="Button16" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

         <!-- Modal -->
          <div class="modal fade" id="primary8" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button21" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Служба</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label12" runat="server" Text="Служба:"></asp:Label>
                            <asp:TextBox ID="txtSluzba" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiSluzba" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiSluzba_Click" />
                            <asp:Button ID="Button23" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

         <!-- Modal -->
          <div class="modal fade" id="primary9" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button18" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small" />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Сектор</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label11" runat="server" Text="Сектор:"></asp:Label>
                            <asp:TextBox ID="txtSektor" type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiSektor" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiSektor_Click" />
                            <asp:Button ID="Button20" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>
                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        

        <asp:Label ID="lblPoraka" runat="server" Text=" "></asp:Label>
    </form>
</body>
</html>
