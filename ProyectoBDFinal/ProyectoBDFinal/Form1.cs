using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoBDFinal
{
    public partial class Form1 : Form
    {
        private SqlConnection connection;
        public Form1()
        {
            InitializeComponent();
            string cadenaConexion = "Server=Marcela\\SQLEXPRESS01;Database=ProyectoFinal;Trusted_Connection=True;";
            connection = new SqlConnection(cadenaConexion);

        }

        private void button1_Click(object sender, EventArgs e)
        {
                string username = textBox1.Text;
                string password = textBox2.Text;

                // Conexión a la base de datos SQL Server
                string connectionString = "Data Source=localhost;Initial Catalog=SistemaGestionUsuarios;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionString);

                try
                {
                    // Abrir la conexión
                    connection.Open();

                    // Consulta SQL para verificar el usuario y contraseña
                    string sql = "SELECT Perfil FROM Usuarios WHERE NombreUsuario = @username AND Contraseña = @password";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    // Ejecutar la consulta y obtener el perfil del usuario
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        string profile = reader["Perfil"].ToString();

                        // Cerrar el lector de datos
                        reader.Close();

                        // Mostrar mensaje de éxito y abrir el formulario correspondiente
                        switch (profile)
                        {
                            case "Director":
                                MessageBox.Show("¡Bienvenido Director!");
                                // Abrir formulario de director
                                Director directorForm = new Director();
                                directorForm.Show();
                                this.Hide();
                                break;
                            case "Supervisor":
                                MessageBox.Show("¡Bienvenido Supervisor!");
                                // Abrir formulario de supervisor
                                Supervisor supervisorForm = new Supervisor();
                                supervisorForm.Show();
                                this.Hide();
                                break;
                            case "Digitador":
                                MessageBox.Show("¡Bienvenido Digitador!");
                                // Abrir formulario de digitador
                                Digitador digitadorForm = new Digitador();
                                digitadorForm.Show();
                                this.Hide();
                                break;
                            default:
                                MessageBox.Show("Error: Perfil de usuario no válido.");
                                break;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error: Usuario o contraseña incorrectos.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
                finally
                {
                    // Cerrar la conexión
                    connection.Close();
                }
            }
        }
    }