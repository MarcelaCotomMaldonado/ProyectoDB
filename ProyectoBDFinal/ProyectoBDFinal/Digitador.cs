using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoBDFinal
{
    public partial class Digitador : Form
    {
        public Digitador()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
                // Conexión a la base de datos
                string connectionString = "Data Source=localhost;Initial Catalog=ProyectoFinal;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Consulta SQL para obtener las reservas para la fecha seleccionada
                    string sql = "SELECT * FROM Reservations WHERE ReservationDate = @selectedDate";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@selectedDate", e.Start.Date);

                        SqlDataReader reader = command.ExecuteReader();

                        // Vincular los datos al datagrid
                        dataGridView1.DataSource = reader;

                        // Cerrar el SqlDataReader
                        reader.Close();
                    }
                }
            }
        }
    }
