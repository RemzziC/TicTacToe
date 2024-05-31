<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TicTacToe3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tic Tac Toe</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            margin: 0;

        }
        .container {
            width: auto;
            height: auto;
            background-color: saddlebrown;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: auto;
            padding: 20px;
        }
        .content {
            text-align: center; 
            padding: 20px;
        }

        .oyna-buton {
            height: 100px;
            width: 100px;
            font-size: 24px;
            text-align: center;
        }

        .oyun-bolumu {
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            width: max-content;
            margin: auto;
            text-align: center; 
            padding: 20px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-icerik {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .kapat {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .kapat:hover,
        .kapat:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function gosterModal(mesaj) {
            var modal = document.getElementById("myModal");
            var modalMetin = document.getElementById("modalMetin");
            modalMetin.innerText = mesaj;
            modal.style.display = "block";
        }

        function kapatModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
    </script>
</head>
<body style="background-color: lightskyblue">
    <form id="form1" runat="server">
        <div class="content">
            <%-- Skor tablosu --%>
            <asp:Label ID="Label1" runat="server" Text="X oyuncusu: "></asp:Label>
            <asp:Label ID="LabelXSkor" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text="O oyuncusu: "></asp:Label>
            <asp:Label ID="LabelOSkor" runat="server" Text="0"></asp:Label><br /><br /> <br /> <br />
            <%-- Skor tablosu --%>
            </div>

        <div class="oyun-bolumu">
            <%-- Oyun butonları --%>
            <asp:Button ID="Button1" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" /> 
            
            <br /><br />
            <asp:Button ID="Button4" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" /> 
            
            <br /><br />
            <asp:Button ID="Button7" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" Text="" CssClass="oyna-buton" OnClick="OynaButon_Click" />
            <%-- Oyun butonları --%>
            <br /><br />
            <%-- Sıfırlama butonu --%>
            <asp:Button ID="ButtonReset" runat="server" Text="Sıfırla" OnClick="SifirlaButon_Click" />
            <%-- Sıfırlama butonu --%>
        </div>
        <%-- Modal --%>
        <div id="myModal" class="modal">
            <div class="modal-icerik">
                <span class="kapat" onclick="kapatModal()">&times;</span>
                <p id="modalMetin"></p>
            </div>
        </div>
        <%-- Modal --%>
    </form>
</body>
</html>
