<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Promena.aspx.cs" Inherits="Promena" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NLB Тутунска Банка - Евиденција на ИТ опрема</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   
    <link href="Styles/style.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="images/glyphicons-halflings.png" />
    <link href="images/glyphicons-halflings-white.png" />
    <link rel="Shortcut Icon" href="images/ikona.png" />
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
	
    <script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>

    <script type="text/javascript" src="Jquery/jquery.tablesorter.js"></script>
	<script type="text/javascript" src="Jquery/jquery.editinplace.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {

	        //validacija checkbox
	        $('#btnNaprednoPrebaruvanje').click(function () {
	            var isChecked1 = $('#checkTipOprema').is(':checked');
	            var isChecked2 = $('#checkProizvoditel').is(':checked');
	            var isChecked3 = $('#checkModel').is(':checked');
	            var isChecked4 = $('#checkBrojProdukt').is(':checked');
	            var isChecked5 = $('#checkStatus').is(':checked');
	            var isChecked6 = $('#checkKorisnik').is(':checked');
	            var isChecked7 = $('#checkGrad').is(':checked');
	            var isChecked8 = $('#checkOrganizacionaEdinica').is(':checked');
	            var isChecked9 = $('#checkSluzba').is(':checked');
	            var isChecked10 = $('#checkNabavnaCena').is(':checked');
	            var isChecked11 = $('#checkDobavuvac').is(':checked');
	            var isChecked12 = $('#checkSektor').is(':checked');
	            if (isChecked10 || isChecked12 || isChecked11 || isChecked1 || isChecked2 || isChecked3 || isChecked4 || isChecked5 || isChecked6 || isChecked7 || isChecked8 || isChecked9)
	              return;
	            else
	                alert("Потребно е да се секирате барем една ставка !");
	        });

	        $("#pnlDodadiNov").hide();
	        $("#Label1").hide();
	        $("#dodadiNov").click(function () {
	            $("#pnlDodadiNov").slideToggle();
	            //$("#GridView").hide();
	            
	        });

	        var pickerOpts = {
	            dateFormat: "dd/mm/yy"
	        };
	        $("#txtDadumFaktura").datepicker(pickerOpts);
	        //// just for the demos, avoids form submit
	        //jQuery.validator.setDefaults({
	        //    debug: true,
	        //    success: "valid"
	        //});
	        //$("#btndodadi").click(function () {
	        //    rules: {
	        //    txtBrojProdukt: {
	        //                required: true
	        //     }
	        //    }
	        //});
	        $("#btndodadi").click(function () {
	            $("#txtBrojProdukt").prop('required', true);
	            $("#txtSeriskiBroj").prop('required', true);
	            $("#txtPartNo").prop('required', true);
	            $("#txtInventarenBroj").prop('required', true);
	            $("#ddlDobavuvac").prop('required', true);
	            $("#txtNabavnaCena").prop('required', true);
	            $("#txtBrojNaFaktura").prop('required', true);
	            $("#txtBrojNaBaranje").prop('required', true);
	            $("#txtBrojNaNalog").prop('required', true);
	            $("#txtGaranciskiRok").prop('required', true);
	            $("#txtBrojCheckLista").prop('required', true);
	            $("#txtZabeleska").prop('required', true);
	        });

	        $("#btnCloseDodadi").click(function () {
	            $("#txtBrojProdukt").prop('required', false);
	            $("#txtSeriskiBroj").prop('required', false);
	            $("#txtPartNo").prop('required', false);
	            $("#txtInventarenBroj").prop('required', false);
	            $("#ddlDobavuvac").prop('required', false);
	            $("#txtNabavnaCena").prop('required', false);
	            $("#txtBrojNaFaktura").prop('required', false);
	            $("#txtBrojNaBaranje").prop('required', false);
	            $("#txtBrojNaNalog").prop('required', false);
	            $("#txtGaranciskiRok").prop('required', false);
	            $("#txtBrojCheckLista").prop('required', false);
	            $("#txtZabeleska").prop('required', false);
	            $("#pnlDodadiNov").hide();
	        });
	        
	    });

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        

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
                                                onclick="btnSkrieno_Click" />  
			 	            </div>		  
	        	            <div class="nav-collapse collapse" > 
						            <ul	id="nav-menu" class="nav" style="margin-left: 300px;">
							            <li class="divider-vertical"></li>
								            <li><asp:Button runat="server" ID="btnPocetna" Text="Почетна" BackColor="Transparent" OnClick="btnPocetna_Click" BorderStyle="None" /></li>
						                    <li class="divider-vertical"></li>
						                    <li id="lblTest" runat="server"><asp:Button runat="server" BackColor="Transparent" ID="btnSledi" Text="Следење на опремата" OnClick="btnSledi_Click" BorderStyle="None" /></li>
						                    <li class="divider-vertical"></li>
						                    <li><asp:Button ID="btnSifrarnici" BackColor="Transparent" runat="server"  BorderStyle="None" Text="Шифрарници" ToolTip="Уредување на шифрарници" OnClick="btnSifrarnici_Click"></asp:Button></li>
						                    <li class="divider-vertical"></li>
						                    
							           
						            </ul>
                                     <div style="float:right;display:inline;">
                                <label id="lblUser1" style="margin-top:10px;float:left;margin-right:5px;">User:</label>
                                <p style="float:left;display:inline;margin:8px 5px 0 0;font-weight:bold;"><asp:Label ID="lblUser" runat="server" Visible="true" ></asp:Label></p>
                                <p style="float:right;display:inline;margin:5px 5px 0 0;">
                                    <asp:Button ID="btnLogout" runat="server" class="btn btn-danger" style="margin-right:5px;margin-top:-2px;" Text="Log Out" 
                                        onclick="btnLogout_Click"></asp:Button></p>
                            </div>
				            </div>
	                    </div>
	                  </div>
    	            </div>
        </header>

        <div class="custompopup" id="divThankYou" runat="server" 
        visible="False">
            <div>
                <asp:Button ID="Button1" runat="server" style="position:absolute;margin-left:370px;margin-top:-10px;font-weight:bold;padding:2px 5px;" class="btn btn-danger" Text="X" OnClick="Button1_Click" />
            </div>
                <p>
                    <div style="float:left">
                                <asp:Label ID="lblmessage" runat="server"></asp:Label>
                                <asp:Label ID="lblTipOprema" runat="server">Тип на Опрема</asp:Label>
                                <asp:TextBox ID="txtTipOprema" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblProizvoditel" runat="server">Производител</asp:Label>
                                <asp:TextBox ID="txtProizvoditel" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblModel" runat="server">Модел</asp:Label>
                                <asp:TextBox ID="txtModel" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblBrojProdukt" runat="server">Број на продукт</asp:Label>
                                <asp:TextBox ID="txtBrojProdukt1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblSeriskiBroj" runat="server">Сериски Број</asp:Label>
                                <asp:TextBox ID="txtSeriskiBroj1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblPartNo" runat="server">Part Number</asp:Label>
                                <asp:TextBox ID="txtPartNo1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblInventarenBroj" runat="server">Инвентарен Број</asp:Label>
                                <asp:TextBox ID="txtInventarenBroj1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblDobavuvac" runat="server">Добавувач</asp:Label>
                                <asp:TextBox ID="txtDobavuvac" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblNabavnaCena" runat="server">Набавна Цена</asp:Label>
                                <asp:TextBox ID="txtNabavnaCena1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblBrojNaFaktura" runat="server">Број на фактура</asp:Label>
                                <asp:TextBox ID="txtBrojNaFaktura1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblDatumNaVnes1" runat="server">Датум на внес</asp:Label>
                                <asp:TextBox ID="txtDatumNaVnes" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblDatumNaFaktura1" runat="server">Датум на фактура</asp:Label>
                                <asp:TextBox ID="txtDatumNaFaktura" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                    <div style="float: right">

                        <asp:Label ID="lblStatus" runat="server">Статус</asp:Label>
                        <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                        <asp:Label ID="lblKorisnik" runat="server">Корисник</asp:Label>
                        <asp:TextBox ID="txtKorisnik" runat="server"></asp:TextBox>
                        <asp:Label ID="lblGrad" runat="server">Град</asp:Label>
                        <asp:TextBox ID="txtGrad" runat="server"></asp:TextBox>
                        <asp:Label ID="lblOrganizacionaEdinica" runat="server">Организациона Единица</asp:Label>
                        <asp:TextBox ID="txtOrganizacionaEdinica" runat="server"></asp:TextBox>
                        <asp:Label ID="lblSluzba" runat="server">Служба</asp:Label>
                        <asp:TextBox ID="txtSluzba" runat="server"></asp:TextBox>
                        <asp:Label ID="lblSektor" runat="server">Сектор</asp:Label>
                        <asp:TextBox ID="txtSektor" runat="server"></asp:TextBox>
                        <asp:Label ID="lblBrojNaBaranje" runat="server">Број на барање</asp:Label>
                        <asp:TextBox ID="txtBrojNaBaranje1" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblBrojNaNalog" runat="server">Број на налог</asp:Label>
                        <asp:TextBox ID="txtBrojNaNalog1" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblGaranciskiRok" runat="server">Гаранциски Рок</asp:Label>
                        <asp:TextBox ID="txtGaranciskiRok1" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblBrojCheckLista" runat="server">Број на Check листа</asp:Label>
                        <asp:TextBox ID="txtBrojCheckLista1" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblZabeleska" runat="server">Забелешка</asp:Label>
                        <asp:TextBox ID="txtZabeleska1" runat="server"></asp:TextBox>
                    </div>    
                </p>
                <div>
                    <asp:Label ID="lblPomosnaID" runat="server" Text=" " style="margin-top:-20px;position:absolute;color:transparent;" Font-Size="XX-Small" ></asp:Label>
                    <asp:Button ID="Zacuvaj"  class="btn btn-success" runat="server" Text="Зачувај" OnClick="btnZacuvajPromeni_Click" />
                </div>            
            </div>
            </div>
            <div style="padding: 5px; margin-left: 5px; margin-top: 70px;" class="col-lg-12">
                <asp:TextBox ID="txtPrebaraj" runat="server"></asp:TextBox>
                <asp:Button ID="btnPrebaraj" style=" border-radius: 5px; margin-top: -10px;" class="btn-success" runat="server" OnClick="btnPrebaraj_Click" Text="Пребарај" />
                <asp:Button ID="bntAdvancedSearch" style="border-radius: 5px; margin-top: -10px;" class="btn btn-fresh" runat="server" Text="+" OnClick="btnAdvancedSearch_Click" />
            </div>

            <div id="advancedSearch" style="border:1px solid black; border-radius:3px; width:250px; margin-left:10px; padding: 10px 0px 10px 10px;float:left;" runat="server" visible="false">
                
                <label for="tip_oprema">Тип на Опрема</label>
                <asp:CheckBox ID="checkTipOprema" runat="server" />
                <asp:DropDownList ID="asTipOprema" runat="server" DataSourceID="SQLddlTipOprema" DataTextField="TipOprema" DataValueField="TipOprema" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema]"></asp:SqlDataSource>
                
                <label for="proizvoditel">Производител</label>
                <asp:CheckBox ID="checkProizvoditel" runat="server" />
                <asp:DropDownList ID="asProizvoditel" runat="server" DataSourceID="SqlDataSource1" DataTextField="Proizvoditel" DataValueField="Proizvoditel"  ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                
                <label for="model">Модел</label>
                <asp:CheckBox ID="checkModel" runat="server" />
                <asp:DropDownList ID="asModel" runat="server" DataSourceID="SqlDataSource2" DataTextField="Model" DataValueField="Model"  ></asp:DropDownList> 
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Model] FROM [MODEL]"></asp:SqlDataSource>
                            
                <label for="txtBrojProdukt">Број на Продукт</label> 
                <asp:CheckBox ID="checkBrojProdukt" runat="server" />
                <asp:TextBox ID="asBrojProduct" name="txtBrojProdukt"  runat="server" type="text" placeholder="Број на Продукт"></asp:TextBox>
                
                <label for="dobavuvac">Добавувач</label>
                <asp:CheckBox ID="checkDobavuvac" runat="server" />
                <asp:DropDownList ID="asDobavuvac" runat="server" type="text"  placeholder="Добавувач" DataSourceID="SQLDDLDobavuvac" DataTextField="Dobavuvac" DataValueField="Dobavuvac"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Dobavuvac] FROM [DOBAVUVAC]"></asp:SqlDataSource>

                <label for="nabavna_cena">Набавна Цена</label>
                <asp:CheckBox ID="checkNabavnaCena" runat="server" />
                <asp:TextBox ID="asNabavnaCena" runat="server" type="number"  placeholder="Набавна Цена"></asp:TextBox>
                              
                <label for="status">Статус</label>
                <asp:CheckBox ID="checkStatus" runat="server" />
                <asp:DropDownList ID="asStatus" runat="server" DataSourceID="SQLddlStatus" DataTextField="Status" DataValueField="Status" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Status] FROM [STATUS]"></asp:SqlDataSource>

                <label for="korisnik">Корисник</label>
                <asp:CheckBox ID="checkKorisnik" runat="server" />
                <asp:DropDownList ID="asKorisnik" runat="server" DataSourceID="SqlDataSource3" DataTextField="Korisnik" DataValueField="Korisnik"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Korisnik] FROM [KORISNIK]"></asp:SqlDataSource>
                
                <label for="grad">Град</label>
                <asp:CheckBox ID="checkGrad" runat="server" />
                <asp:DropDownList ID="asGrad" runat="server" DataSourceID="SQLddlGrad" DataTextField="Grad" DataValueField="Grad" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Grad] FROM [GRAD]"></asp:SqlDataSource>
                
                <label for="organizaciona_edinica">Организациона Единица</label>
                <asp:CheckBox ID="checkOrganizacionaEdinica" runat="server" />
                <asp:DropDownList ID="asOrganizacionaEdinica" runat="server"  DataSourceID="SqlDataSource4" DataTextField="OrganizacionaEdinica" DataValueField="OrganizacionaEdinica"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [OrganizacionaEdinica] FROM [ORGANIZACIONA_EDINICA]"></asp:SqlDataSource>
                                        
                <label for="sluzba">Служба</label>
                <asp:CheckBox ID="checkSluzba" runat="server" />
                <asp:DropDownList ID="asSluzba" runat="server" DataSourceID="SqlDataSource5" DataTextField="Sluzba" DataValueField="Sluzba" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sluzba] FROM [SLUZBA]"></asp:SqlDataSource>
   
                <label for="sektor">Сектор</label>
                <asp:CheckBox ID="checkSektor" runat="server" />
                <asp:DropDownList ID="asSektor" runat="server" DataSourceID="SqlDataSource6" DataTextField="Sektor" DataValueField="Sektor"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sektor] FROM [SEKTOR]"></asp:SqlDataSource>

                <asp:Button ID="btnNaprednoPrebaruvanje" runat="server"  style="border-radius:5px;" class="btn-success" Text="Напредно Пребарување" OnClick="btnNaprednoPrebaruvanje_Click" ToolTip="Мора да селектирате барем едно!" />
                <asp:Button ID="btnZatvoriNapredno" runat="server" style="display:inline;border-radius:5px;" class="btn-danger" Text="Откажи" OnClick="btnZatvoriNapredno_Click"/>
            </div>
            
        <br />
        <br />
        
        
        
                             
            <div id="DIV_dodadi_nov">     
                <input id="dodadiNov" class="btn-info" style="border-radius:5px;" value="Додади нов производ" type="button"/>
            </div>
           
                     <asp:Panel ID="pnlDodadiNov"  runat="server">
                     <table id="tabela_dodadi" style="width: 100%;">
                        <div>
                            <tr >
                                <td><label for="tip_oprema">Тип на Опрема</label></td>
                                <td><asp:DropDownList ID="ddlTipOprema" runat="server" DataSourceID="SQLddlTipOprema" DataTextField="TipOprema" DataValueField="TipOprema" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SQLddlTipOprema" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema]"></asp:SqlDataSource>
                                </td>
                                <td><label for="proizvoditel">Производител</label></td>
                                <td><asp:DropDownList ID="ddlProizvoditel" runat="server" DataSourceID="SqlDataSource1" DataTextField="Proizvoditel" DataValueField="Proizvoditel"  ></asp:DropDownList></td>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                            
                            </tr>
                            <tr>
                                <td><label for="model">Модел</label></td> 
                                <td><asp:DropDownList ID="ddlModel" runat="server" DataSourceID="SqlDataSource2" DataTextField="Model" DataValueField="Model"  ></asp:DropDownList></td> 
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Model] FROM [MODEL]"></asp:SqlDataSource>
                            
                                <td><label for="txtBrojProdukt">Број на Продукт</label></td> 
                                <td><asp:TextBox ID="txtBrojProdukt" name="txtBrojProdukt"  runat="server" type="text" placeholder="Број на Продукт"></asp:TextBox>
                                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtBrojProdukt" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>                                             
                                </td>     
                            </tr>
                            <tr>         
                              <td><label for="seriski_broj">Сериски Број</label></td>
                              <td> <asp:TextBox ID="txtSeriskiBroj" runat="server" type="number" placeholder="Сериски Број"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="prvoPole" runat="server" ControlToValidate="txtSeriskiBroj" ErrorMessage="  *" Font-Bold="True" ForeColor="Red" Font-Size="X-Large"></asp:RequiredFieldValidator>--%>
                                </td>
                              <td><label for="part_number">Part Number</label></td>
                              <td><asp:TextBox ID="txtPartNo" runat="server"  type="number" placeholder="Part Number" ></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPartNo" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>                          
                               </td>
                            </tr>
                            <tr>     
                              <td> <label for="inventaren_broj">Инвентарен Број</label></td>
                              <td> <asp:TextBox ID="txtInventarenBroj" runat="server"  type="number"  placeholder="Инвентарен Број"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInventarenBroj" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                              <td><label for="dobavuvac">Добавувач</label></td>
                              <td> <asp:DropDownList ID="ddlDobavuvac" runat="server" type="text"  placeholder="Добавувач" DataSourceID="SQLDDLDobavuvac" DataTextField="Dobavuvac" DataValueField="Dobavuvac"></asp:DropDownList>
                                  <asp:SqlDataSource ID="SQLDDLDobavuvac" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Dobavuvac] FROM [DOBAVUVAC]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>                    
                              <td><label for="nabavna_cena">Набавна Цена</label></td>
                              <td><asp:TextBox ID="txtNabavnaCena" runat="server" type="number"  placeholder="Набавна Цена"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNabavnaCena" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                              <td><label for="broj_na_faktura">Број на Фактура</label></td>
                              <td><asp:TextBox ID="txtBrojNaFaktura" runat="server" type="number"  placeholder="Број на Фактура"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtBrojNaFaktura" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="lblDatumNaVnes" runat="server" Text="Датум на фактура"></asp:Label>
                                </td>
                                <td class="style3">
                                    <asp:TextBox ID="txtDadumFaktura" runat="server"></asp:TextBox>
                                 </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                
                                </td>
                                <td class="style3">
                            
                                </td>
                            </tr>
                        </div>
                        <div>
                            <tr>               
                              <td><label for="status">Статус</label></td>
                              <td><asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SQLddlStatus" DataTextField="Status" DataValueField="Status" >
                                  </asp:DropDownList>
                                  <asp:SqlDataSource ID="SQLddlStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Status] FROM [STATUS]"></asp:SqlDataSource>
                                </td>
                              <td><label for="korisnik">Корисник</label></td>
                              <td><asp:DropDownList ID="ddlKorisnik" runat="server" DataSourceID="SqlDataSource3" DataTextField="Korisnik" DataValueField="Korisnik"></asp:DropDownList></td>
                                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Korisnik] FROM [KORISNIK]"></asp:SqlDataSource>
                            
                            </tr>
                            <tr>                  
                              <td><label for="grad">Град</label></td>
                              <td><asp:DropDownList ID="ddlGrad" runat="server" DataSourceID="SQLddlGrad" DataTextField="Grad" DataValueField="Grad" ></asp:DropDownList>
                                  <asp:SqlDataSource ID="SQLddlGrad" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Grad] FROM [GRAD]"></asp:SqlDataSource>
                                </td>
                              <td><label for="organizaciona_edinica">Организациона Единица</label></td>
                              <td><asp:DropDownList ID="ddlOrganizacionaEdinica" runat="server"  DataSourceID="SqlDataSource4" DataTextField="OrganizacionaEdinica" DataValueField="OrganizacionaEdinica"></asp:DropDownList></td>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [OrganizacionaEdinica] FROM [ORGANIZACIONA_EDINICA]"></asp:SqlDataSource>
                                
                            </tr>
                            <tr>                             
                              <td><label for="sluzba">Служба</label></td>
                              <td><asp:DropDownList ID="ddlSluzba" runat="server" DataSourceID="SqlDataSource5" DataTextField="Sluzba" DataValueField="Sluzba" ></asp:DropDownList></td>
                                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sluzba] FROM [SLUZBA]"></asp:SqlDataSource>
   
                              <td><label for="sektor">Сектор</label></td>
                              <td><asp:DropDownList ID="ddlSektor" runat="server" DataSourceID="SqlDataSource6" DataTextField="Sektor" DataValueField="Sektor"></asp:DropDownList></td>
                                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sektor] FROM [SEKTOR]"></asp:SqlDataSource>
   
                            </tr>
                            <tr>         
                              <td><label for="broj_na_baranje">Број на барање</label></td>
                              <td><asp:TextBox ID="txtBrojNaBaranje" runat="server" type="number"  placeholder="Број на барање"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBrojNaBaranje" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                              <td><label for="broj_na_nalog">Број на налог</label></td>
                              <td><asp:TextBox ID="txtBrojNaNalog" runat="server" type="number"  placeholder="Број на налог"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBrojNaNalog" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              </td>
                            </tr>
                            <tr>         
                              <td><label for="garanciski_rok">Гаранциски Рок</label></td>
                              <td><asp:TextBox ID="txtGaranciskiRok" runat="server" type="number"  placeholder="Гаранциски рок во денови"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGaranciskiRok" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                              <td><label for="broj_check_lista">Број на Check Листа</label></td>
                              <td><asp:TextBox ID="txtBrojCheckLista" runat="server" type="number"  placeholder="Број на Check Листа"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBrojCheckLista" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              </td>
                            </tr>
                        </div>
                        </table>
                           
                                <label for="Zabeleska">Поле за забелешка</label>
                                <asp:TextBox ID="txtZabeleska" runat="server" type="text"  placeholder="Забелешка"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtZabeleska" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%--<asp:Label ID="lblGreski" runat="server" ForeColor="Red" Text="Site polinja treba da se popolnat"></asp:Label>--%>
                                <br />
                <asp:Button ID="btndodadi" class="btn-success" 
                                    style="margin-left: 50%;padding: 4px;font-size: 1.2em;border-radius:5px;" 
                                    runat="server" Text="Додади" onclick="btndodadi_Click"></asp:Button>
                         <asp:Button ID="btnCloseDodadi" runat="server" Text="Откажи" style="margin-left:10px;" class="btn btn-danger" />
            </asp:Panel>
                        
    
                        <div id="GridView" style="display:inline;padding:10px;">
                                        <asp:GridView ID="gvPromena" runat="server" 
                                        AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderColor="#E7E7FF" 
                                            BorderStyle="None" BorderWidth="1px" style="margin-right: 7px" 
                                            Width="1200px" onrowcancelingedit="gvPromena_RowCancelingEdit" 
                                            onrowediting="gvPromena_RowEditing" onrowupdating="gvPromena_RowUpdating" 
                                            AllowSorting="True" onrowcommand="gvPromena_RowCommand" onsorting="gvPromena_Sorting" >
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" ReadOnly="True" DataField="ID" SortExpression="ID" >
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Тип на Опрема" SortExpression="TipOprema" DataField="TipOprema" 
                                            ReadOnly="True" >
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Производител" DataTextField="Proizvoditel" 
                                            HeaderText="Производител" ShowHeader="True" SortExpression="Proizvoditel" />
                                        <asp:BoundField HeaderText="Модел" DataField="Model" ReadOnly="True" SortExpression="Model" />
                                        <asp:BoundField HeaderText="Бр. Производ" DataField="BrojProdukt" 
                                            ReadOnly="True" SortExpression="BrojProdukt" />
                                        <asp:BoundField HeaderText="Сер. Бр." DataField="SeriskiBroj" ReadOnly="True" SortExpression="SeriskiBroj" />
                                        <asp:BoundField HeaderText="Part NO." DataField="PartNo" ReadOnly="True" SortExpression="PartNo" />
                                        <asp:BoundField DataField="InventarenBroj" HeaderText="Инв. Бр." 
                                            ReadOnly="True" SortExpression="InventarenBroj" />
                                        <asp:BoundField HeaderText="Добавувач" DataField="Dobavuvac" ReadOnly="True" SortExpression="Dobavuvac" />
                                        <asp:BoundField HeaderText="Набавна Цена" DataField="NabavnaCena" 
                                            ReadOnly="True" SortExpression="NabavnaCena" />
                                        <asp:BoundField HeaderText="Број на Фактура" DataField="BrojNaFaktura" 
                                            ReadOnly="True" SortExpression="BrojNaFaktura" />
                                        <asp:BoundField HeaderText="Датум на Внес" DataField="DatumNaVnes" 
                                            ReadOnly="True" SortExpression="DatumNaVnes" />
                                        <asp:BoundField HeaderText="Датум на Фактура" DataField="DatumNaFaktura" 
                                            ReadOnly="True" SortExpression="DatumNaFaktura" />
                                        <asp:BoundField HeaderText="Статус" DataField="Status" SortExpression="Status" />
                                        <asp:BoundField HeaderText="Корисник" DataField="Korisnik" SortExpression="Korisnik" />
                                        <asp:BoundField HeaderText="Град" DataField="Grad" SortExpression="Grad" />
                                        <asp:BoundField HeaderText="ОЕ" 
                                            DataField="OrganizacionaEdinica" SortExpression="OrganizacionaEdinica" />
                                        <asp:BoundField HeaderText="Служба" DataField="Sluzba" SortExpression="Sluzba" />
                                        <asp:BoundField HeaderText="Сектор" DataField="Sektor" SortExpression="Sektor" />
                                        <asp:BoundField HeaderText="Број на барање" DataField="BrojNaBaranje" 
                                            ReadOnly="True" SortExpression="BrojNaBaranje" />
                                        <asp:BoundField HeaderText="Број на налог" DataField="BrojNaNalog" 
                                            ReadOnly="True" SortExpression="BrojNaNalog" />
                                        <asp:BoundField HeaderText="Гаранциски Рок" DataField="GaranciskiRok" 
                                            ReadOnly="True" SortExpression="GaranciskiRok" />
                                        <asp:BoundField HeaderText="Број на check листа" DataField="BrojCheckLista" 
                                            ReadOnly="True" SortExpression="BrojCheckLista" />
                                        <asp:BoundField HeaderText="Забелешка" DataField="Zabeleska" />
                                        <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True" 
                                            UpdateText="Промени" />
                                    </Columns>
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" 
                                                VerticalAlign="Middle" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                    </asp:GridView>
                                </div>
                                <p style="padding:10px">
                                    <asp:Label ID="lblPoraka" runat="server"></asp:Label>
                                </p>

                                <div id="Istorijat">
                                    <asp:GridView ID="gvIstorijat" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="IstorID" />
                                            <asp:BoundField HeaderText="Тип Опрема" DataField="IstorTipOprema" />
                                            <asp:BoundField HeaderText="Производител" DataField="IstorProizvoditel" />
                                            <asp:BoundField HeaderText="Модел" DataField="IstorModel" />
                                            <asp:BoundField HeaderText="Бр. Производ" DataField="IstorBrojProdukt" />
                                            <asp:BoundField HeaderText="Сериски Бр." DataField="IstorSeriskiBroj" />
                                            <asp:BoundField HeaderText="Part No." DataField="IstorPartNo" />
                                            <asp:BoundField HeaderText="Инвентарен Бр." DataField="IstorInventarenBroj" />
                                            <asp:BoundField HeaderText="Добавувач" DataField="IstorDobavuvac" />
                                            <asp:BoundField HeaderText="Набавна Цена" DataField="IstorNabavnaCena" />
                                            <asp:BoundField HeaderText="Бр. Фактура" DataField="IstorBrojNaFaktura" />
                                            <asp:BoundField HeaderText="Датум на внес" DataField="IstorDatumNaVnes" />
                                            <asp:BoundField HeaderText="Датум на фактура" DataField="IstorDatumNaFaktura" />
                                            <asp:BoundField HeaderText="Статус" DataField="IstorStatus" />
                                            <asp:BoundField HeaderText="Корисник" DataField="IstorKorisnik" />
                                            <asp:BoundField HeaderText="Град" DataField="IstorGrad" />
                                            <asp:BoundField HeaderText="ОЕ" DataField="IstorOrganizacionaEdinica" />
                                            <asp:BoundField HeaderText="Служба" DataField="IstorSluzba" />
                                            <asp:BoundField HeaderText="Сектор" DataField="IstorSektor" />
                                            <asp:BoundField HeaderText="Бр. на барање" DataField="IstorBrojNaBaranje" />
                                            <asp:BoundField HeaderText="Бр. на налог" DataField="IstorBrojNaNalog" />
                                            <asp:BoundField HeaderText="Забелешка" DataField="IstorZabeleska" />
                                            <asp:BoundField HeaderText="Време на промена" DataField="IstorVremeNaPromena" />
                                            <asp:BoundField HeaderText="Променил" DataField="IstorPromenil" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <br />
                                </div>

                                <div style="clear: both;">
                                    <p>
                                        <asp:Button ID="btnIstorijat" runat="server" onclick="btnIstorijat_Click" class="btn btn-success" Text="Види Историјат" Visible="True" />
                                    </p>
                                </div>

                                <div style="clear: both;">
                                    <p>
                                        <asp:Button ID="btnVrati" runat="server" onclick="btnVrati_Click" class="btn btn-success" Text="Врати Претходна Состојба" Visible="False" />
                                    </p>
                                </div>

        <asp:TextBox ID="txtPrimiVrednost" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox7" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox9" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox10" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox11" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox12" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox13" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox14" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox15" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox16" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox17" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox18" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox19" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox20" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox21" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox22" runat="server" Text="" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox23" runat="server" Text="" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
