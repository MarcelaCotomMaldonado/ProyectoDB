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
    public partial class Director : Form
    {
        public Director()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Conexión a la base de datos
            string connectionString = "Data Source=localhost;Initial Catalog=ProyectoFinal;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Consulta SQL para obtener los datos
                string sql = "SELECT * FROM SalesData";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
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