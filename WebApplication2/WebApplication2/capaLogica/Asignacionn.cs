using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApplication2.capaLogica
{
    public class Asignacionn
    {
        {
    public class Asignaciones
        {
            public static int AgregarAsignaciones(int codigoReparacion, int codigoTecnico, string fechaAsignacion)
            {
                int retorno = 0;
                SqlConnection Conn = new SqlConnection();
                try
                {
                    using (Conn = DBconn.obtenerConexion())
                    {
                        SqlCommand cmd = new SqlCommand("IngresarAsignaciones", Conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.Add(new SqlParameter("@reparacionId", codigoReparacion));
                        cmd.Parameters.Add(new SqlParameter("@tecnicoId", codigoTecnico));
                        cmd.Parameters.Add(new SqlParameter("@fechaAsignacion", fechaAsignacion));

                        retorno = cmd.ExecuteNonQuery();
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    retorno = -1;
                }
                finally
                {
                    Conn.Close();
                }

                return retorno;
            }

            public static int ModificarAsignaciones(int codigo, int codigoReparacion, int codigoTecnico, string fechaAsignacion)
            {
                int retorno = 0;
                SqlConnection Conn = new SqlConnection();
                try
                {
                    using (Conn = DBconn.obtenerConexion())
                    {
                        SqlCommand cmd = new SqlCommand("ModificarAsignaciones", Conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.Add(new SqlParameter("@id", codigo));
                        cmd.Parameters.Add(new SqlParameter("@reparacionId", codigoReparacion));
                        cmd.Parameters.Add(new SqlParameter("@tecnicoId", codigoTecnico));
                        cmd.Parameters.Add(new SqlParameter("@fechaAsignacion", fechaAsignacion));

                        retorno = cmd.ExecuteNonQuery();
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    retorno = -1;
                }
                finally
                {
                    Conn.Close();
                }

                return retorno;
            }

            public static int BorrarAsignaciones(int codigo)
            {
                int retorno = 0;
                SqlConnection Conn = new SqlConnection();
                try
                {
                    using (Conn = DBconn.obtenerConexion())
                    {
                        SqlCommand cmd = new SqlCommand("BorrarAsignaciones", Conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.Add(new SqlParameter("@id", codigo));

                        retorno = cmd.ExecuteNonQuery();
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    retorno = -1;
                }
                finally
                {
                    Conn.Close();
                }

                return retorno;
            }
        }
    }
}
}