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
	
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="Jquery/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="Jquery/jquery.editinplace.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Button20").click(function () {
                $("#txtSektor").prop('required', false);
            });
            $("#Button18").click(function () {
                $("#txtSektor").prop('required', false);
            });
            $("#btnDodadiSektor").click(function () {
                $("#txtSektor").prop('required', true);
                $("#txtSluzba").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtTipOprema").prop('required', false);
            });

            $("#Button21").click(function () {
                $("#txtSluzba").prop('required', false);
            });
            $("#Button23").click(function () {
                $("#txtSluzba").prop('required', false);
            });
            $("#btnDodadiSluzba").click(function () {
                $("#txtSluzba").prop('required', true);
                $("#txtSektor").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtTipOprema").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
            });

            $("#Button9").click(function () {
                $("#txtOrganizaciona").prop('required', false);
            });
            $("#Button16").click(function () {
                $("#txtOrganizaciona").prop('required', false);
            });
            $("#btnDodadiOrganizaciona").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtTipOprema").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtOrganizaciona").prop('required', true);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
            });

            $("#Button12").click(function () {
                $("#txtKorisnik").prop('required', false);
            });
            $("#Button14").click(function () {
                $("#txtKorisnik").prop('required', false);
            });
            $("#btnDodadiKorisnik").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', true);
                $("#txtStatus").prop('required', false);
                $("#txtTipOprema").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtModel").prop('required', false);
            });

            $("#Button15").click(function () {
                $("#txtGrad").prop('required', false);
            });
            $("#Button17").click(function () {
                $("#txtGrad").prop('required', false);
            });
            $("#btnDodadiGrad").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', true);
                $("#txtKorisnik").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtTipOprema").prop('required', false);
            });

            $("#Button11").click(function () {
                $("#txtStatus").prop('required', false);
            });
            $("#Button6").click(function () {
                $("#txtStatus").prop('required', false);
            });
            $("#btnDodadiStatus").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtStatus").prop('required', true);
                $("#txtTipOprema").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtModel").prop('required', false);
            });

            $("#Button10").click(function () {
                $("#txtDobavuvac").prop('required', false);
            });
            $("#Button8").click(function () {
                $("#txtDobavuvac").prop('required', false);
            });
            $("#btnDodadiDobavuvac").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', true);
                $("#txtProizvoditel").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtTipOprema").prop('required', false);
            });

            $("#Button4").click(function () {
                $("#txtModel").prop('required', false);
            });
            $("#Button7").click(function () {
                $("#txtModel").prop('required', false);
            });
            $("#btnDodadiModel").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtModel").prop('required', true);
                $("#txtProizvoditel").prop('required', false);
                $("#txtTipOprema").prop('required', false);
            });

            $("#Button3").click(function () {
                $("#txtProizvoditel").prop('required', false);
            });
            $("#Button5").click(function () {
                $("#txtProizvoditel").prop('required', false);
            });
            $("#btnDodadiProzvoditel").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtProizvoditel").prop('required', true);
                $("#txtTipOprema").prop('required', false);
            });

            $("#Button1").click(function () {
                $("#txtTipOprema").prop('required', false);
            });
            $("#btnIzgasiModalen").click(function () {
                $("#txtTipOprema").prop('required', false);
            });
            $("#Button2").click(function () {
                $("#txtSluzba").prop('required', false);
                $("#txtSektor").prop('required', false);
                $("#txtOrganizaciona").prop('required', false);
                $("#txtGrad").prop('required', false);
                $("#txtKorisnik").prop('required', false);
                $("#txtStatus").prop('required', false);
                $("#txtDobavuvac").prop('required', false);
                $("#txtModel").prop('required', false);
                $("#txtProizvoditel").prop('required', false);
                $("#txtTipOprema").prop('required', true);
            });

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

            $("#btnUredi1").hide();
            $("#btnUredi2").hide();
            $("#btnUredi3").hide();
            $("#btnUredi4").hide();
            $("#btnUredi5").hide();
            $("#btnUredi6").hide();
            $("#btnUredi7").hide();
            $("#btnUredi8").hide();
            $("#btnUredi9").hide();
            $("#btnUredi10").hide();
            
            //$("#btnIzgasiModalen").click(function () {

            //    $(".RemoveRequired").prop('required', false);
            //});
            //$("#Button2").click(function () {
            //    $(".RemoveRequired").prop('required', true);
            //});

            $("#tipOprema").click(function () {
                $("#ddlTipOprema").show();
                $("#btnPrikaziDodadi").show();
                $("#btnUredi1").show();
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
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
            });

            $("#proizvoditel").click(function () {
                $("#ddlProizvoditel").show();
                $("#btnPrikaziDodadi1").show();
                $("#btnUredi2").show();
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
                $("#btnUredi1").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi3").show();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").show();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").show();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").show();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").show();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#primary4").hide();
                $("#primary5").hide();
                $("#primary6").hide();
                $("#primary7").hide();
                $("#primary8").hide();
                $("#primary9").hide();
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").show();
                $("#btnUredi9").hide();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").show();
                $("#btnUredi10").hide();
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
                $("#btnUredi1").hide();
                $("#btnUredi2").hide();
                $("#btnUredi3").hide();
                $("#btnUredi4").hide();
                $("#btnUredi5").hide();
                $("#btnUredi6").hide();
                $("#btnUredi7").hide();
                $("#btnUredi8").hide();
                $("#btnUredi9").hide();
                $("#btnUredi10").show();
            });

            $("#btnPrikaziDodadi").click(function () {

                $("#primary").show();
                //$("#txtTipOprema").prop('required', true);
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
                //$("#txtProizvoditel").prop('required', true);
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
                //$("#txtModel").prop('required', true);
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
                //$("#txtDobavuvac").prop('required', true);
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
                //$("#txtStatus").prop('required', true);
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
                //$("#txtKorisnik").prop('required', true);
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
                //$("#txtGrad").prop('required', true);
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
                //$("#txtOrganizaciona").prop('required', true);
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
                //$("#txtSluzba").prop('required', true);
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
                //$("#txtSektor").prop('required', true);
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
                    <div class="nav-collapse collapse">
                        <ul id="nav-menu" class="nav" style="margin-left: 300px;">
                            <li class="divider-vertical"></li>
                            <li>
                                <asp:Button runat="server" ID="btnPocetna" Text="Почетна" BackColor="Transparent" BorderStyle="None" OnClick="btnPocetna_Click" /></li>
                            <li class="divider-vertical"></li>
                            <li id="lblTest" runat="server">
                                <asp:Button runat="server" BackColor="Transparent" ID="btnSledi" Text="Следење на опремата" BorderStyle="None" OnClick="btnSledi_Click" /></li>
                            <li class="divider-vertical"></li>
                            <li>
                                <asp:Button ID="btnSifrarnici" runat="server" Text="Шифрарници" BackColor="Transparent" BorderStyle="None" ToolTip="Уредување на шифрарници" OnClick="btnSifrarnici_Click"></asp:Button></li>
                            
                            

                        </ul>
                        <div style="float: right; display: inline;">
                            <label id="lblUser1" style="margin-top: 10px; float: left; margin-right: 5px;">User:</label>
                            <p style="float: left; display: inline; margin: 8px 5px 0 0; font-weight: bold;">
                                <asp:Label ID="lblUser" runat="server" Visible="true"></asp:Label></p>
                            <p style="float: right; display: inline; margin: 5px 5px 0 0;">
                                <asp:Button ID="btnLogout" runat="server" class="btn btn-danger" Style="margin-right: 5px; margin-top: -2px;" Text="Log Out" OnClick="btnLogout_Click"></asp:Button>
                            </p>
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
                                <asp:Button ID="btnUredi1" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi1_Click" />
                                <asp:Button ID="btnUredi2" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi2_Click" />
                                <asp:Button ID="btnUredi3" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi3_Click" />
                                <asp:Button ID="btnUredi4" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi4_Click" />
                                <asp:Button ID="btnUredi5" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi5_Click" />
                                <asp:Button ID="btnUredi6" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi6_Click" />
                                <asp:Button ID="btnUredi7" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi7_Click" />
                                <asp:Button ID="btnUredi8" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi8_Click" />
                                <asp:Button ID="btnUredi9" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi9_Click" />
                                <asp:Button ID="btnUredi10" class="btn btn-warning" runat="server" style="margin-top: -10px;" Text="Уреди" OnClick="btnUredi10_Click" />
                                
                                
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
                            <asp:TextBox ID="txtTipOprema"  class="RemoveRequired" type="text" style="margin-top:-5px;" runat="server"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="Изберете Производител:"></asp:Label>
                            <asp:DropDownList ID="ddlTipOpremaPROIZVODITEL" style="margin-top:5px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="Proizvoditel" DataValueField="Proizvoditel"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button2" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="Button2_Click" />
                            <asp:Button ID="btnIzgasiModalen" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                            <asp:TextBox ID="txtProizvoditel"  class="RemoveRequired" type="text" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiProzvoditel" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiProzvoditel_Click"  />
                            <asp:Button ID="Button5" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                            <asp:TextBox ID="txtGrad"  type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiGrad" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiGrad_Click" />
                            <asp:Button ID="Button17" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
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
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

         <!-- Modal -->
          <div class="modal fade" id="primary9" style="top:100px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                            <asp:Button ID="Button18" style="font-size: 20px; font-weight: bold; line-height: 20px; color: #000; text-shadow: 0 1px 0 #fff; opacity: .2;" class="close" data-dismiss="modal" aria-hidden="true" runat="server" Text="x" BackColor="Transparent" BorderStyle="None" Font-Size="Small"  />
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                            <h1><i class="glyphicon glyphicon-thumbs-up"></i>Додади: Сектор</h1>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label11" runat="server" Text="Сектор:"></asp:Label>
                            <asp:TextBox ID="txtSektor"  type="text" class="RemoveRequired" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDodadiSektor" style="float:left;" class="btn btn-success pull-left" runat="server" Text="Додади" OnClick="btnDodadiSektor_Click" />
                            <asp:Button ID="Button20" style="float:right;" class="btn btn-danger pull-right" data-dismiss="modal" runat="server" Text="Откажи"  />
                           
                             <%--<asp:Button style="float:right;" ID="btnIzgaziProzorec" class="btn btn-default pull-left" data-dismiss="modal" runat="server" Text="Затвори"  />--%>                             <%--<button style="float:right;" type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        <div class="container">
            <div class="row" style="margin-left:50px;">
                <div id="divTipOprema" runat="server" visible="false">
                    <asp:GridView ID="gvTipOprema" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="gvTipOprema_RowCancelingEdit" OnRowDeleting="gvTipOprema_RowDeleting" OnRowEditing="gvTipOprema_RowEditing" OnRowUpdating="gvTipOprema_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="ID_TipOprema" HeaderText="Број" ReadOnly="True" />
                            <asp:BoundField DataField="TipOprema" HeaderText="Тип Опрема" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divProizvoditel" runat="server" visible="false">
                    <asp:GridView ID="gvProizvoditel" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="gvProizvoditel_RowCancelingEdit" OnRowDeleting="gvProizvoditel_RowDeleting" OnRowEditing="gvProizvoditel_RowEditing" OnRowUpdating="gvProizvoditel_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="ID_Proizvoditel" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Proizvoditel" HeaderText="Производител" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" InsertText=""
                                ShowEditButton="True" UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divModel" runat="server" visible="false">
                    <asp:GridView ID="gvModel" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="gvModel_RowCancelingEdit" OnRowDeleting="gvModel_RowDeleting" OnRowEditing="gvModel_RowEditing" OnRowUpdating="gvModel_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="ID_Model" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Model" HeaderText="Модел" />
                            <asp:CommandField ShowEditButton="True" CancelText="Откажи" EditText="Уреди"
                                UpdateText="Внеси" />
                            <asp:CommandField ShowDeleteButton="True" DeleteText="Избриши" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divDobavuvac" runat="server" visible="false">
                    <asp:GridView ID="gvDobavuvac" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvDobavuvac_RowCancelingEdit"
                        OnRowDeleting="gvDobavuvac_RowDeleting" OnRowEditing="gvDobavuvac_RowEditing"
                        OnRowUpdating="gvDobavuvac_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Dobavuvac" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Dobavuvac" HeaderText="Добавувач" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divStatus" runat="server" visible="false">
                    <asp:GridView ID="gvStatus" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvStatus_RowCancelingEdit"
                        OnRowDeleting="gvStatus_RowDeleting" OnRowEditing="gvStatus_RowEditing"
                        OnRowUpdating="gvStatus_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Status" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Status" HeaderText="Статус" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divKorisnik" runat="server" visible="false">
                    <asp:GridView ID="gvKorisnik" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvKorisnik_RowCancelingEdit"
                        OnRowDeleting="gvKorisnik_RowDeleting" OnRowEditing="gvKorisnik_RowEditing"
                        OnRowUpdating="gvKorisnik_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Korisnik" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Korisnik" HeaderText="Корисник" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divGrad" runat="server" visible="false">
                    <asp:GridView ID="gvGrad" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvGrad_RowCancelingEdit" OnRowDeleting="gvGrad_RowDeleting"
                        OnRowEditing="gvGrad_RowEditing" OnRowUpdating="gvGrad_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Grad" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Grad" HeaderText="Град" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divOrganizacionaEdinica" runat="server" visible="false">
                    <asp:GridView ID="gvOrganizacionaEdinica" runat="server"
                        AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvOrganizacionaEdinica_RowCancelingEdit"
                        OnRowDeleting="gvOrganizacionaEdinica_RowDeleting"
                        OnRowEditing="gvOrganizacionaEdinica_RowEditing"
                        OnRowUpdating="gvOrganizacionaEdinica_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Edinica" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="OrganizacionaEdinica" HeaderText="Орг. Единица" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divSluzba" runat="server" visible="false">
                    <asp:GridView ID="gvSluzba" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvSluzba_RowCancelingEdit"
                        OnRowDeleting="gvSluzba_RowDeleting" OnRowEditing="gvSluzba_RowEditing"
                        OnRowUpdating="gvSluzba_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Sluzba" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Sluzba" HeaderText="Служба" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
                <div id="divSektor" runat="server" visible="false">
                    <asp:GridView ID="gvSektor" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="gvSektor_RowCancelingEdit"
                        OnRowDeleting="gvSektor_RowDeleting" OnRowEditing="gvSektor_RowEditing"
                        OnRowUpdating="gvSektor_RowUpdating" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="ID_Sektor" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Sektor" HeaderText="Сектор" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True"
                                UpdateText="Внеси" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
            </div>
            </div>
        
            <asp:Label ID="lblPoraka" runat="server" Text=" "></asp:Label>
            <div>
                <asp:Button ID="btnZatvoriPregled" runat="server" style="margin-left:140px;margin-top:20px;" class="btn btn-danger" Text="Затвори Преглед" OnClick="btnZatvoriPregled_Click" Visible="False" />
            </div>

    </form>
</body>
</html>
