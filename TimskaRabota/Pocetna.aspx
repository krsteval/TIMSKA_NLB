<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pocetna.aspx.cs" Inherits="Pocetna" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <link href="Styles/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="Scripts/jquery.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.9.1.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script  type="text/javascript">
        $(document).ready(function () {
            $("#TextBox5").datepicker();
            $("#TextBox6").datepicker();
            $("#TextBox16").datepicker();
            var accOpts = {
                header: "h3",
                event: "mouseover",
                active: "#header3"
            }
            $("#accordion").accordion(accOpts);
        });
    </script>
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
                                                onclick="btnSkrieno_Click" />  
			 	            </div>			  
	        	            <div class="nav-collapse collapse" > 
						            <ul	id="nav-menu" class="nav" style="margin-left: 300px;">
							            <li class="divider-vertical"></li>
								            <li><asp:Button ID="btnpocetna" runat="server" class="meni_kopcinja" Text="Почетна" BackColor="Transparent" OnClick="btnpocetna_Click" BorderStyle="None" /></li>
						                    <li class="divider-vertical"></li>
						                    <li id="Li1" runat="server"><asp:Button ID="btnsledi" runat="server"  BackColor="Transparent" Text="Следење на опремата" OnClick="btnsledi_Click" BorderStyle="None" /></li>
						                    <li class="divider-vertical"></li>
						                    <li><asp:Button ID="btnSifrarnici" BackColor="Transparent" runat="server"  BorderStyle="None" Text="Шифрарници" ToolTip="Уредување на шифрарници" OnClick="btnSifrarnici_Click" ></asp:Button></li>
						                    <li class="divider-vertical"></li>
						                    
							           
						            </ul>
                                     <div style="float:right;display:inline;">
                                        <label style="margin-top:10px;float:left;margin-right:5px;">User:</label>
                                        <p style="float:left;display:inline;margin:8px 5px 0 0;font-weight:bold;"><asp:Label ID="lblUser" runat="server" Visible="true" ></asp:Label></p>
                                        <p style="float:right;display:inline;margin:5px 5px 0 0;">
                                            <asp:Button ID="btnLogout" runat="server" Text="Log Out" class="btn btn-danger" style="margin-right:5px;margin-top:-2px;"
                                                onclick="btnLogout_Click"></asp:Button></p>
                                    </div>
				            </div>
	                    </div>
	                  </div>
    	            </div>

        </header>
        
        <div class="custompopup" id="divThankYou" runat="server" 
        visible="False">
                <p>
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
                        <div style="float:right">
                                
                                <asp:Label ID="lblStatus" runat="server">Статус</asp:Label>
                                <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblKorisnik" runat="server">Корисник</asp:Label>
                                <asp:TextBox ID="txtKorisnik" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblGrad" runat="server">Град</asp:Label>
                                <asp:TextBox ID="txtGrad" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblOrganizacionaEdinica" runat="server">Организациона Единица</asp:Label>
                                <asp:TextBox ID="txtOrganizacionaEdinica" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblSluzba" runat="server">Служба</asp:Label>
                                <asp:TextBox ID="txtSluzba" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblSektor" runat="server">Сектор</asp:Label>
                                <asp:TextBox ID="txtSektor" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblBrojNaBaranje" runat="server">Број на барање</asp:Label>
                                <asp:TextBox ID="txtBrojNaBaranje1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblBrojNaNalog" runat="server">Број на налог</asp:Label>
                                <asp:TextBox ID="txtBrojNaNalog1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblGaranciskiRok" runat="server">Гаранциски Рок</asp:Label>
                                <asp:TextBox ID="txtGaranciskiRok1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblBrojCheckLista" runat="server">Број на Check листа</asp:Label>
                                <asp:TextBox ID="txtBrojCheckLista1" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="lblZabeleska" runat="server">Забелешка</asp:Label>
                                <asp:TextBox ID="txtZabeleska1" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>    
                </p>
                <div>
                    <asp:Label ID="lblPomosnaID" runat="server" Text=" " style="margin-top:-20px;position:absolute;color:transparent;" Font-Size="XX-Small" ></asp:Label>
                    <!--<asp:Button ID="Zacuvaj"  class="btn btn-success" runat="server" Text="Зачувај" OnClick="Zacuvaj_Click" />-->
                </div>              
            </div>

            <div id="wrapper" style="width:auto;margin-top: 70px;"> 
		                  <div style="margin-left:90px;">
				                <asp:TextBox ID="txtPrebaraj" runat="server"></asp:TextBox>
                                <asp:Button ID="btnPrebaraj" style="border-radius:5px;margin-top:-10px;" class="btn-success"  runat="server" onclick="btnPrebaraj_Click" 
                                    Text="Пребарај" />
                                    <asp:Button ID="bntAdvancedSearch" style="border-radius: 5px; margin-top: -10px;" class="btn btn-fresh" runat="server" Text="+" OnClick="btnAdvancedSearch_Click" />

                            </div>
            </div>

            <div id="advancedSearch" style="border:1px solid black; border-radius:3px; width:250px; margin-left:10px; padding: 10px 0px 10px 10px;" runat="server" visible="False">
                
                <label for="tip_oprema">Тип на Опрема</label>
                <asp:CheckBox ID="checkTipOprema" runat="server" />
                <asp:DropDownList ID="asTipOprema" runat="server" DataSourceID="SqlDataSource7" DataTextField="TipOprema" DataValueField="TipOprema" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [TipOprema] FROM [TipOprema]"></asp:SqlDataSource>
                
                <label for="proizvoditel">Производител</label>
                <asp:CheckBox ID="checkProizvoditel" runat="server" />
                <asp:DropDownList ID="asProizvoditel" runat="server" DataSourceID="SqlDataSource8" DataTextField="Proizvoditel" DataValueField="Proizvoditel"  ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Proizvoditel] FROM [PROIZVODITEL]"></asp:SqlDataSource>
                
                <label for="model">Модел</label>
                <asp:CheckBox ID="checkModel" runat="server" />
                <asp:DropDownList ID="asModel" runat="server" DataSourceID="SqlDataSource9" DataTextField="Model" DataValueField="Model"  ></asp:DropDownList> 
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Model] FROM [MODEL]"></asp:SqlDataSource>
                            
                <label for="txtBrojProdukt">Број на Продукт</label> 
                <asp:CheckBox ID="checkBrojProdukt" runat="server" />
                <asp:TextBox ID="asBrojProduct" name="txtBrojProdukt"  runat="server" type="text" placeholder="Број на Продукт"></asp:TextBox>
                
                <label for="dobavuvac">Добавувач</label>
                <asp:CheckBox ID="checkDobavuvac" runat="server" />
                <asp:DropDownList ID="asDobavuvac" runat="server" type="text"  placeholder="Добавувач" DataSourceID="SqlDataSource10" DataTextField="Dobavuvac" DataValueField="Dobavuvac"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Dobavuvac] FROM [DOBAVUVAC]"></asp:SqlDataSource>

                <label for="nabavna_cena">Набавна Цена</label>
                <asp:CheckBox ID="checkNabavnaCena" runat="server" />
                <asp:TextBox ID="asNabavnaCena" runat="server" type="number"  placeholder="Набавна Цена"></asp:TextBox>
                              
                <label for="status">Статус</label>
                <asp:CheckBox ID="checkStatus" runat="server" />
                <asp:DropDownList ID="asStatus" runat="server" DataSourceID="SqlDataSource11" DataTextField="Status" DataValueField="Status" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Status] FROM [STATUS]"></asp:SqlDataSource>

                <label for="korisnik">Корисник</label>
                <asp:CheckBox ID="checkKorisnik" runat="server" />
                <asp:DropDownList ID="asKorisnik" runat="server" DataSourceID="SqlDataSource12" DataTextField="Korisnik" DataValueField="Korisnik"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Korisnik] FROM [KORISNIK]"></asp:SqlDataSource>
                
                <label for="grad">Град</label>
                <asp:CheckBox ID="checkGrad" runat="server" />
                <asp:DropDownList ID="asGrad" runat="server" DataSourceID="SqlDataSource13" DataTextField="Grad" DataValueField="Grad" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Grad] FROM [GRAD]"></asp:SqlDataSource>
                
                <label for="organizaciona_edinica">Организациона Единица</label>
                <asp:CheckBox ID="checkOrganizacionaEdinica" runat="server" />
                <asp:DropDownList ID="asOrganizacionaEdinica" runat="server"  DataSourceID="SqlDataSource14" DataTextField="OrganizacionaEdinica" DataValueField="OrganizacionaEdinica"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [OrganizacionaEdinica] FROM [ORGANIZACIONA_EDINICA]"></asp:SqlDataSource>
                                        
                <label for="sluzba">Служба</label>
                <asp:CheckBox ID="checkSluzba" runat="server" />
                <asp:DropDownList ID="asSluzba" runat="server" DataSourceID="SqlDataSource15" DataTextField="Sluzba" DataValueField="Sluzba" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sluzba] FROM [SLUZBA]"></asp:SqlDataSource>
   
                <label for="sektor">Сектор</label>
                <asp:CheckBox ID="checkSektor" runat="server" />
                <asp:DropDownList ID="asSektor" runat="server" DataSourceID="SqlDataSource16" DataTextField="Sektor" DataValueField="Sektor"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:AleksandarConnectionString %>" SelectCommand="SELECT [Sektor] FROM [SEKTOR]"></asp:SqlDataSource>

                <asp:Button ID="btnNaprednoPrebaruvanje" runat="server"  style="border-radius:5px;margin-left:35px;" class="btn-success" Text="Напредно Пребарување" OnClick="btnNaprednoPrebaruvanje_Click" ToolTip="Мора да селектирате барем едно!" />
            </div>


            <div  style="display:inline;padding:10px">
                                        <asp:GridView ID="gvOpis" runat="server" 
                                        AutoGenerateColumns="False" CellPadding="3" 
                    BackColor="White" BorderColor="#E7E7FF"   Width="1200px"
                                            BorderStyle="None" BorderWidth="1px" style="margin-right: 7px"         
                                    onselectedindexchanged="gvOpis_SelectedIndexChanged" 
                    onrowcommand="gvOpis_RowCommand" onsorting="gvOpis_Sorting" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField SortExpression="ID" HeaderText="ID" ReadOnly="True" DataField="ID" />
                                        <asp:BoundField HeaderText="Тип на Опрема" SortExpression="TipOprema" DataField="TipOprema" />
                                        <asp:ButtonField SortExpression="Proizvoditel"  CommandName="Производител" DataTextField="Proizvoditel" 
                                            HeaderText="Производител" />
                                        <asp:BoundField HeaderText="Модел"  SortExpression="Model" DataField="Model" />
                                        <asp:BoundField DataField="BrojProdukt" SortExpression="BrojProdukt" HeaderText="Бр. Продукт"></asp:BoundField>
                                        <asp:BoundField DataField="SeriskiBroj" SortExpression="SeriskiBroj" HeaderText="Сер. Бр."></asp:BoundField>
                                        <asp:BoundField DataField="PartNo" SortExpression="PartNo"  HeaderText="PartNo"></asp:BoundField>
                                        <asp:BoundField HeaderText="Инвентарен Број" SortExpression="InventarenBroj" DataField="InventarenBroj" />
                                        <asp:BoundField DataField="Dobavuvac"  SortExpression="Dobavuvac" HeaderText="Добавувач"></asp:BoundField>
                                        <asp:BoundField DataField="NabavnaCena" SortExpression="NabavnaCena"  HeaderText="Набавна Цена"></asp:BoundField>
                                        <asp:BoundField HeaderText="Бр. Фактура"  SortExpression="BrojNaFaktura"  DataField="BrojNaFaktura" />
                                        <asp:BoundField DataField="DatumNaVnes" SortExpression="DatumNaVnes" HeaderText="Датум на внес" />
                                        <asp:BoundField DataField="DatumNaFaktura" SortExpression="DatumNaFaktura" HeaderText="Датум на фактура" />
                                        <asp:BoundField DataField="Status"  SortExpression="Status"  HeaderText="Статус" />
                                        <asp:BoundField HeaderText="Корисник"  SortExpression="Korisnik" DataField="Korisnik" />
                                        <asp:BoundField HeaderText="Град"  SortExpression="Grad"  DataField="Grad" />
                                        <asp:BoundField DataField="OrganizacionaEdinica" SortExpression="OrganizacionaEdinica"
                                            HeaderText="Организациона Единица" />
                                        <asp:BoundField HeaderText="Служба"  SortExpression="Sluzba"  DataField="Sluzba" />
                                        <asp:BoundField HeaderText="Сектор" SortExpression="Sektor" DataField="Sektor" />
                                        <asp:BoundField DataField="BrojNaBaranje" HeaderText="Бр. Барање" SortExpression="BrojNaBaranje" />
                                        <asp:BoundField DataField="BrojNaNalog"  SortExpression="BrojNaNalog" HeaderText="Бр. Налог" />
                                        <asp:BoundField DataField="GaranciskiRok" SortExpression="GaranciskiRok" HeaderText="Гаранциски Рок" />
                                        <asp:BoundField DataField="BrojCheckLista" SortExpression="BrojCheckLista" HeaderText="Бр. Check Lista" />
                                        <asp:BoundField HeaderText="Забелешка" DataField="Zabeleska" />
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

                    <div style="clear: both;">
                          <p>
                              <asp:Button ID="btnVrati" runat="server" onclick="btnVrati_Click" class="btn btn-success" Text="Врати Претходна Состојба" Visible="False" />
                          </p>
                    </div>

        <div style="padding:10px">
             <asp:Label ID="lblPoraka" runat="server"></asp:Label>
        
        </div>
        

    </form>
</body>
</html>
