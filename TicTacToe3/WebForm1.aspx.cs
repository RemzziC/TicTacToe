using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicTacToe3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string currentPlayer;
        private static int xScore = 0;
        private static int oScore = 0;
        private static string[] board = new string[9];
        private static Random random = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ResetBoard();
                SelectRandomPlayer();
            }
        }

        protected void OynaButon_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int index = int.Parse(button.ID.Replace("Button", "")) - 1;

            if (board[index] == string.Empty)
            {
                board[index] = currentPlayer;
                button.Text = currentPlayer;
                if (CheckWin())
                {
                    if (currentPlayer == "X")
                    {
                        xScore++;
                        LabelXSkor.Text = xScore.ToString();
                    }
                    else
                    {
                        oScore++;
                        LabelOSkor.Text = oScore.ToString();
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"gosterModal('{currentPlayer} oyuncusu kazandı!');", true);
                    ResetBoard();
                    SelectRandomPlayer();
                }
                else if (Array.IndexOf(board, string.Empty) == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "gosterModal('Berabere!');", true);
                    // Berabere
                    ResetBoard();
                    SelectRandomPlayer();
                }
                else
                {
                    currentPlayer = (currentPlayer == "X") ? "O" : "X";
                }
            }
        }

        protected void SifirlaButon_Click(object sender, EventArgs e)
        {
            xScore = 0;
            oScore = 0;
            LabelXSkor.Text = xScore.ToString();
            LabelOSkor.Text = oScore.ToString();
            ResetBoard();
            SelectRandomPlayer();
        }

        private void ResetBoard()
        {
            for (int i = 0; i < 9; i++)
            {
                board[i] = string.Empty;
                Button button = (Button)FindControl("Button" + (i + 1).ToString());
                button.Text = string.Empty;
            }
        }

        private void SelectRandomPlayer()
        {
            currentPlayer = random.Next(0, 2) == 0 ? "X" : "O";
        }

        private bool CheckWin()
        {
            string[][] winPatterns = new string[][]
            {
                new string[] { board[0], board[1], board[2] },
                new string[] { board[3], board[4], board[5] },
                new string[] { board[6], board[7], board[8] },
                new string[] { board[0], board[3], board[6] },
                new string[] { board[1], board[4], board[7] },
                new string[] { board[2], board[5], board[8] },
                new string[] { board[0], board[4], board[8] },
                new string[] { board[2], board[4], board[6] }
            };

            foreach (var pattern in winPatterns)
            {
                if (pattern[0] != string.Empty && pattern[0] == pattern[1] && pattern[1] == pattern[2])
                {
                    return true;
                }
            }
            return false;
        }
    }
}