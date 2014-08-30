﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TipOprema.aspx.cs" Inherits="TimskaRabota_TipOprema" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Уреди:ТипОпрема</title>
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

</head>
<body>
    <form id="form1" runat="server">
       <div class="container" style="margin-top:50px;">
           <div class="row">
               <div class="col-lg-6 col-md-6 portfolio-item">
                   <asp:GridView ID="gvTipOprema" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="gvTipOprema_RowCancelingEdit" OnRowDeleting="gvTipOprema_RowDeleting" OnRowEditing="gvTipOprema_RowEditing" OnRowUpdating="gvTipOprema_RowUpdating">
                       <Columns>
                           <asp:BoundField DataField="ID_TipOprema" HeaderText="Број" ReadOnly="True" />
                           <asp:BoundField DataField="TipOprema" HeaderText="Тип Опрема" />
                           <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True" UpdateText="Внеси" HeaderText="Уреди" />
                           <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" HeaderText="Избриши" />
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
               <asp:Button ID="btnVratiSe" runat="server" style="margin:5px;margin-left:23%;" Text="Назад" class="btn btn-success" OnClick="btnVratiSe_Click" />

               <asp:Label ID="lblPoraka" runat="server" Text=""></asp:Label>
           </div>
        </div>
    </form>
</body>
</html>
